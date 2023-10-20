
# attractorToolsOrient

```java

Option Explicit
'------------------------------------------------------------------------------
' Subroutine: 	attractorToolsOrient
' Purpose:    	orients objects toward multiple attractors with a falloff
' Author:    	Roland Snooks | 2006 | www.kokkugia.com
'------------------------------------------------------------------------------
Call Main()
Sub Main()
	Dim i, j, arrObjects, arrAttract, thresholdDist, scaleFactor, arrBBox, arrCntrPt, counter, arrAttPt 
	Dim dblAttDistTest, dblClosestAttDist, dblClosestAtt, adjAmount
  
	' input
	arrObjects = Rhino.GetObjects("select vector field")
	arrAttract = Rhino.GetObjects("select point attractors", 0)
	thresholdDist = Rhino.GetReal("distance threshold", 10, 0)
	scaleFactor = Rhino.GetReal("scale factor", 1, 0)
  
	' loop through each object and get the closest attractor
	For i = 0 To UBound(arrObjects)
      
		' get object bounding box centerpoint
		arrCntrPt =  Rhino.CurveMidPoint(arrObjects(i))
' loop through attractors to find the distance to the closest
		counter = 0
		For j = 0 To UBound(arrAttract)
			' get closest point - use for curves rather than points
			'dblParam = Rhino.CurveClosestPoint(arrAttract(j), arrCntrPt)
			'arrAttPt = Rhino.EvaluateCurve(arrAttract(j), dblParam)
			arrAttPt = Rhino.PointCoordinates(arrAttract(j))
    
			' get distance
			dblAttDistTest = Rhino.Distance(arrAttPt, arrCntrPt)
    
			' is it closer
			If counter < 1 Then
				dblClosestAttDist = dblAttDistTest
				dblClosestAtt = counter
			Else
				If dblAttDistTest < thresholdDist Then
					If dblAttDistTest < dblClosestAttDist Then 
						dblClosestAttDist = dblAttDistTest
						dblClosestAtt = counter
					End If
				End If  
			End If
			counter = counter + 1
Next 
    
		' if the object is within the threshold then operate on it
		If dblClosestAttDist < thresholdDist Then
      
			' caculate the adjustment amount
			adjAmount = (thresholdDist - dblClosestAttDist)/thresholdDist 
			'adjAmount = 1 - ((thresholdDist - dblClosestAttDist)/thresholdDist)                     ' decrease infinite amount
			'adjAmount = ((thresholdDist - dblClosestAttDist)/thresholdDist) * scaleFactor + 1      ' increase by factor of up to 100% x scaleFactor
   
			' based on attractor proximity do something to the object (eg scale)
      
			' scale
			'Rhino.ScaleObject arrObjects(i), arrCntrPt, array(adjAmount,adjAmount,adjAmount) ' scale
      
			' change color
			at_ChangeColor arrObjects(i),thresholdDist,dblClosestAttDist,scaleFactor 
      
			' rotate
			at_rotate arrObjects(i),arrAttract(dblClosestAtt),adjAmount
			
			
		End If
    
	Next  
End Sub
Function at_ChangeColor(obj,tDist,aDist,sFactor)
	Dim objColor, newColor
	' caculate color
	newColor = 255 - ((1 - ((tDist - aDist)/tDist)) * 255) 
	'newColor = 255
	' change color
	objColor = Rhino.ObjectColor(obj, newColor)
	'Rhino.print objColor
	'	at_ChangeColor=
End Function
Function at_rotate(obj,attr,adj)
	Dim currentVec, aLoc, dirVec, currentAngle, arrAngle, diffAngle, angle, xProd, adjAngle
	
	aLoc = Rhino.PointCoordinates(attr)
	
	' get closest end on line and current direction vector
	If (Rhino.Distance((Rhino.CurveEndPoint(obj)), aLoc)) > (Rhino.Distance((Rhino.CurveStartPoint(obj)), aLoc)) Then
		currentVec = Rhino.VectorCreate((Rhino.CurveEndPoint(obj)),(Rhino.CurveStartPoint(obj)))
	Else
		currentVec = Rhino.VectorCreate((Rhino.CurveStartPoint(obj)),(Rhino.CurveEndPoint(obj)))
	End If
	
	' get vector to attractor
	
	dirVec = Rhino.VectorCreate((Rhino.CurveMidPoint(obj)),aLoc)
	
	' get cross product
	xProd = Rhino.VectorCrossProduct(currentVec,dirVec)
' get angle between vectors
	angle = Rhino.Angle2(array(array(0,0,0),currentVec),array(array(0,0,0),dirVec))
' adjust angle based on adj amount	
	adjAngle = (adj*angle(0))		 
	
	' rotate object using cross prod as axis
	Rhino.RotateObject obj, Rhino.CurveMidPoint(obj), adjAngle, xProd
	
End Function

```
