

# Surface Bounding Box

```VBScript

Option Explicit
'Script writing= @2007 Thomas Anagnostou.
'Last modified 2022/04/02
'Version compatibility= Tested with Rhino V7

'Minimum Volume/Surface Bounding Box (iterational)

Sub minboundbox ()

	'--Declarations--
	Dim objects, selection
	Dim angleXY, angleXZ, angleYZ		'ForLoop counters
	Dim fEnd							'ForLoop ender
	Dim fStart				 			'ForLoop starting value
	Dim user_inp 						'User input
	Dim epsilon 						'user specified tolerance to be used for comparators
	Dim spanX,SpanY,SpanZ 				'Bbox dimensions
	Dim s, sDiv							'LoopStep and LoopStep divisor
	Dim iteration						'Progress meter
	Dim boxMetric_now					'boxMetric idx 0 means area, idx 1 means volume
	Dim boxMetric_min
	Dim boxMetric_delta
	Dim boxMetric_start
	Dim boxMetric_epsilon
	Dim angle_min						'Cplane angles recorded at min bbox iteration
	Dim bbox_min	
	Dim absTolerance 					'absolute tolerance
	Dim DefaultTolerance
	Dim Parsing,planar1, detect
	Dim ThisView						'Current setting (before script starts
	Dim ThisCplane,startingCplane, tempCplane
	Dim thisCplaneName					'Store the curent cplane as a nemedCplane
	Dim userChoice, userChoiceStr
	Dim percent
	Dim startTime
	Dim arrUserOptions
	Dim usrOptTol, usrOptType
	Dim usrBoxTypes
	'--end

	'--Default values--
	Const pi = 3.141592654
	absTolerance = rhino.unitAbsoluteTolerance
	DefaultTolerance = 0.1
	fEnd = Array(90, 90, 90)	'XY, XZ, YZ - In Degrees
	fStart = Array(0, 0, 0)		'In Degrees
	sDiv = Array(7, 17, 4)		'Loop steps divisor: volume,planar,laterDiv (Defaults vol=7,pl=17,later=4)
	s = Rhino.VectorSubtract(fEnd, fStart) 'LoopStep starts as the whole range
	iteration = 0
	parsing = 0
	planar1 = 0
	userChoice = -1
	ThisView = rhino.currentview 'String
	thiscplane = rhino.viewcplane 'Array of 3D-points
	thisCplaneName = "Temp**MinBoundBox3d^^1"
	rhino.addnamedcplane thiscplanename, thisview
	'--end

	'--PreSelection check and user interaction
	objects = rhino.selectedobjects
	If Not isarray(objects) Then objects = rhino.getobjects("Select objects to frame with a minimum Bounding Box", 0, True, True, False) '4159, 63
	If Not isarray(objects) Then :Rhino.print "Script cancelled" :Exit Sub :End If 'If still nothing was selected
	Rhino.UnselectAllObjects()
	detect = detect_planar(objects, absTolerance)
	planar1 = detect(0)
	If (planar1 = -1) Then :rhino.print "Script unsuccessfull (Cannot proceed with this input)" :Exit Sub :End If

	'User Questions ****
	If (planar1 = 0) Then :usrBoxTypes = Array("Surface", "Volume"):Else :usrBoxTypes = Array("Perimeter", "Area"):End If
	usrOptType = Array(4, "Minimize", usrBoxTypes, 1)
	usrOptTol = Array(3, "Tolerance", DefaultTolerance, "New value", absTolerance, 10)
	arrUserOptions = Array(usrOptTol, usrOptType)
	
	Do
		Dim repeat
		rhino.print "Compute the Bounding box to within this tolerance. Lower values take longer. Document tolerance is: " & absTolerance
		user_inp = rhino.GetOption("Minimum Bounding Box", arrUserOptions)
		If isnull(user_inp) Then
			rhino.restorenamedcplane thiscplanename, thisview 
			rhino.deletenamedcplane thiscplanename
			Rhino.EnableRedraw vbtrue
			Rhino.print "Script cancelled"
			Exit Sub
		End If
		repeat = False
		If (arrUserOptions(0)(2) <> user_inp(0)) Then :repeat = True :arrUserOptions(0)(2) = user_inp(0):End If
		If (arrUserOptions(1)(3) <> user_inp(1)) Then :repeat = True :arrUserOptions(1)(3) = user_inp(1):End If	
	Loop While (repeat = True) 'Give user a chance to edit both options if needed
	
	epsilon = user_inp(0)
	userChoice = user_inp(1)
	userChoiceStr = usrBoxTypes(user_inp(1))
	
	'--Main script
	startTime = Timer
	Rhino.EnableRedraw vbfalse
	rhino.print "Please wait (Brute-force calculation may take a few minutes)"
	If (planar1 = 1) Then
		startingCplane = detect(1) 'Contents of ViewCplane from Detect_Planar function
		s = Rhino.VectorDivide(s, sDiv(1)) 'Initial LoopStep size
	Else
		startingCplane = thiscplane
		s = Rhino.VectorDivide(s, sDiv(0)) 'Initial LoopStep size
	End If
	Do
		For angleYZ= fStart(2) To fEnd(2) Step s(2)
			For angleXZ= fStart(1) To fEnd(1) Step s(1)
				For angleXY = fStart(0)  To fEnd(0) Step s(0)
					iteration = iteration + 1

					'calculate cPlane rotation
					Dim temp
					tempCplane = Rhino.RotatePlane(startingCplane, angleYZ, startingCplane(1))
					temp = Rhino.RotatePlane(tempCplane, angleXZ, tempCplane(2)):tempCplane = temp
					temp = Rhino.RotatePlane(tempCplane, angleXY, tempCplane(3)):tempCplane = temp
					rhino.viewcplane thisview, tempCplane 'commit the rotation
					'--end

					'--Bounding box for this iteration
					Dim tempBox
					tempBox = rhino.boundingbox(objects, thisview, True) 'cPlane aligned, but using world coordinates
					spanX = rhino.VectorLength(rhino.VectorSubtract(tempBox(1), tempBox(0)))
					spanY = rhino.VectorLength(rhino.VectorSubtract(tempBox(3), tempBox(0)))
					spanZ = rhino.VectorLength(rhino.VectorSubtract(tempBox(4), tempBox(0)))
					'rhino.addbox tempBox
					'rhino.addpolyline array(tempBox(0), tempBox(1), tempBox(2), tempBox(3), tempBox(0))
					'--

					'Metric to be minimized over time
					If (planar1 = 0 And userChoice = 0) Then boxMetric_now = 2 * spanX * spanY + 2 * spanX * spanZ + 2 * spanY * spanZ 'Area
					If (planar1 = 0 And userChoice = 1) Then boxMetric_now = spanX * spanY * spanZ 'Volume
					If (planar1 = 1 And userChoice = 0) Then boxMetric_now = 2 * spanX + 2 * spanY 'Perimeter
					If (planar1 = 1 And userChoice = 1) Then boxMetric_now = spanX * spanY 'Area

					'error detect
					If ((spanx < epsilon Or spany < epsilon Or spanz < epsilon) And planar1 = 0) Then
						rhino.restorenamedcplane thiscplanename, thisview
						rhino.deletenamedcplane thiscplanename
						Rhino.EnableRedraw vbtrue
						rhino.print "Script unsuccessful (Improper attempt for min volume Box calculation on planar object(s) )"
						Exit Sub
					End If
					'end

					'-Run this ONCE EVER
					If (iteration = 1) Then
						boxMetric_epsilon = epsilon
						boxMetric_min = boxMetric_now 'Initial value for min is the first box itself
						boxMetric_delta = boxMetric_epsilon / 2		'In case the original box is the smallest one already
							
						bbox_min = tempBox
						angle_min = Array(angleXY, angleXZ, angleYZ)
					End If
					
					'-Run this ONCE at the beginning of EVERY PARSING - 
					If (angleXY = fStart(0) And angleXZ = fStart(1) And angleYZ = fStart(2)) Then
						boxMetric_start = boxMetric_min	'boxMetric_start is the known min at the beginning of this parsing
					End If
					
					'DETECT MIMIMUM ---------------------------------------------------
					If (boxMetric_now < boxMetric_min) Then 
						'-Values specific to loop iteration --
						'--Found new minimum
						boxMetric_delta = boxMetric_start - boxMetric_now 'The difference between the min box and the starting box from the beginning of this parsing
						boxMetric_min = boxMetric_now
						
						bbox_min = tempBox 'This is the box to be drawn on screen
						angle_min = Array(angleXY, angleXZ, angleYZ)
					End If
					'------------------------------------------------------------------
				Next 'angleXY
				If (planar1 = 1) Then :Exit For :End If
			Next 'angleXZ
			If (planar1 = 1) Then :Exit For :End If
		Next 'angleYZ
		percent = boxMetric_epsilon / boxMetric_delta
		If (percent > 1) Then percent = 1
		rhino.print userChoiceStr & " calculations=" & iteration & " Parsing=" & parsing + 1 & " Delta= " & formatPercent(percent, 1)

		'--Tighten the loop parameters
		'--There is an issue in that this method might be getting stuck into local minima
		If (boxMetric_delta > boxMetric_epsilon) Then
			'set cplane to rotate again

			'New start and end ranges for the for loops
			fStart = Rhino.VectorSubtract(angle_min, s)
			fEnd = Rhino.VectorAdd(angle_min, s)
			s = Rhino.VectorDivide(s, sDiv(2)) 'adjust step increment

			parsing = parsing + 1
		Else
			parsing = -1
		End If
	Loop While(parsing > 0)

	'--Draw the minimum found bounding box
	If(planar1 = 0) Then '3D box
		selection = rhino.addbox(bbox_min)
	Else 'Perimeter box
		selection = rhino.addpolyline(array(bbox_min(0), bbox_min(1), bbox_min(2), bbox_min(3), bbox_min(0)))
	End If
	Rhino.SelectObject(selection)
	
	'--Reset to original cplane
	rhino.restorenamedcplane thiscplanename, thisview
	rhino.deletenamedcplane thiscplanename
	Rhino.EnableRedraw vbtrue
	Rhino.print("Script completed successfully (in " & FormatNumber(Timer - startTime, 1) & "sec) " & userChoiceStr & "= " & FormatNumber(boxMetric_min, 2) & " " & Rhino.UnitSystemName(False, False, True) & userChoice + 2 - planar1)

	'--End of main script
End Sub

'# # # # # # # # # # # # # # #
'Detect if a group of objects reside entirely on a single plane (co-planar)
'Send errors if unsupported object types are used
'Prepare Cplane to handle trivial cases of single straight line or single point
Function detect_planar (theseObj, tol)
	Dim count
	Dim objectsPlane 'This plane to return if all geometry is co-planar
	Dim temp_plane, blockXform
	Dim unsupported_obj
	Dim meshVertices, vertices
	Dim isPlanar, objArr

	'defaults
	objectsPlane = rhino.viewcplane
	meshVertices = Array()
	unsupported_obj = 0
	isPlanar = True
	'---

	'Parse the selection for preliminary object-identification --------------
	'Rhino returns vertices in World coordinates always
	For count=0 To ubound(theseObj) 
		If (rhino.iscurve(theseobj(count))) Then
			vertices = rhino.curvepoints(theseobj(count))
			meshVertices = Rhino.JoinArrays(meshVertices, vertices)		
		ElseIf (rhino.issurface(theseobj(count))) Then
			vertices = Rhino.SurfacePoints(theseobj(count))
			meshVertices = Rhino.JoinArrays(meshVertices, vertices)
		ElseIf (rhino.ispolysurface(theseobj(count))) Then
			isPlanar = Rhino.IsPolysurfacePlanar(theseobj(count))
			if (Not isPlanar) Then :Exit For :End if
			Rhino.EnableRedraw False
			Rhino.SelectObject(theseobj(count))
			rhino.command "_SolidPtOn", False
			vertices = Rhino.ObjectGripLocations(theseobj(count))
			meshVertices = Rhino.JoinArrays(meshVertices, vertices)
			Rhino.EnableObjectGrips theseobj(count), False
		ElseIf (rhino.ispoint(theseobj(count))) Then 
			vertices = Array(Rhino.PointCoordinates(theseobj(count)))
			meshVertices = Rhino.JoinArrays(meshVertices, vertices)
		ElseIf (rhino.isMesh(theseobj(count))) Then 
			vertices = Rhino.MeshVertices(theseobj(count))
			meshVertices = Rhino.JoinArrays(meshVertices, vertices)
		ElseIf (Rhino.IsExtrusion(theseobj(count))) Then
			Rhino.EnableRedraw False
			Rhino.EnableObjectGrips theseobj(count), True
			vertices = Rhino.SurfacePoints(theseobj(count))
			meshVertices = Rhino.JoinArrays(meshVertices, vertices)
			Rhino.EnableObjectGrips theseobj(count), False
		ElseIf (Rhino.IsPointCloud(theseobj(count))) Then
			vertices = Rhino.PointCloudPoints(theseobj(count))
			meshVertices = Rhino.JoinArrays(meshVertices, vertices)
		ElseIf (Rhino.IsText((theseobj(count)))) Then
			Dim textPlane
			textPlane = Rhino.TextObjectPlane(theseobj(count))
			vertices = Array(textPlane(0), rhino.VectorAdd(textplane(1), textplane(0)), rhino.VectorAdd(textplane(2), textplane(0)))
			meshVertices = Rhino.JoinArrays(meshVertices, vertices)
		ElseIf (Rhino.IsLight(theseobj(count))) Then
			Dim lightPlane
			lightPlane = Rhino.RectangularLightPlane(theseobj(count))
			vertices = Array(lightPlane(0), rhino.VectorAdd(lightplane(1), lightplane(0)), rhino.VectorAdd(lightplane(2), lightplane(0)))
			meshVertices = Rhino.JoinArrays(meshVertices, vertices)
		ElseIf (Rhino.IsBlockInstance(theseobj(count))) Then
			objArr = Rhino.BlockObjects(Rhino.BlockInstanceId(theseobj(count)))
			Dim isBlockPlanar
			isBlockPlanar = detect_planar(objArr, tol) 'Recursion
			If (isBlockPlanar(0) < 0 ) Then :unsupported_obj = unsupported_obj + 1 :Exit For :End If
			If (isBlockPlanar(0) = 0) Then :isPlanar = False :Exit For :End If
			'Get the origin and x and y vertices of the plane that this planar block is on
			'Vertices need to be in world coordinates before going into the meshVertices array
			blockXform = Rhino.BlockInstanceXform(theseobj(count))
			temp_plane = Rhino.PlaneTransform(isBlockPlanar(1), blockXform) 'Origin in world coordinates
			vertices = Array(temp_plane(0), rhino.VectorAdd(temp_plane(1), temp_plane(0)), rhino.VectorAdd(temp_plane(2), temp_plane(0)))
			meshVertices = Rhino.JoinArrays(meshVertices, vertices)
		Else :unsupported_obj = unsupported_obj + 1 :Exit For
		End If
	Next
	'-------------------------------------------------------------------------
	
	If (unsupported_obj > 0 ) Then :detect_planar = array(-1, rhino.viewcplane):Exit Function :End If
	If (Not isPlanar) Then :detect_planar = array(0, rhino.viewcplane):Exit Function :End If
	If (Rhino.PointsAreCoplanar(meshVertices)) Then
		objectsPlane = Rhino.PlaneFitFromPoints(meshVertices)
		detect_planar = array(1, objectsPlane)
	Else
		detect_planar = array(0, rhino.viewcplane)
	End If

End Function
	
' minboundbox

```