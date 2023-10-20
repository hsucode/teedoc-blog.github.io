
# Boundary Cone

```java

Option Explicit
'Author: YukiukiH
'Date: 10/08/2008
'compatibility: Rhino4
boundary CONE
'----------------------------------------------------------------------------------------------
Dim strTrgPt, arrTrgPt
strTrgPt = Rhino.GetObject ("select a target point", 1)
Dim strALLRefPts
strALLRefPts = Rhino.GetObjects ("select reference points", 1)
Dim strPtDir, arrPtDir, arrDirVector
strPtDir = Rhino.GetObject ("select a point for direction", 1)
Dim strRefPts
strRefPts = boundaryCone (strTrgPt, strALLRefPts, strPtDir, 400, 30)
'color
Dim intR, intG, intB
Dim i
For i = 0 To UBound(strRefPts)
intR =255 
intG =25+i*Rnd()*2
intB =0
Call Rhino.ObjectColor (strRefPts(i), RGB(intR, intG, intB))
Next
Call Rhino.print("execution completed")
'----------------------------------------------------------------------------------------------
'----------------------------------------------------------------------------------------------
Function boundaryCone (strTrgPt, strALLRefPts, strPtDir, dblBoundCos, dblBoundAngle)
Dim arrResult
'coordinate extraction
'----------------------------------------------------------------------------------------------
Dim arrTrgPt
arrTrgPt = Rhino.PointCoordinates (strTrgPt)
Dim arrALLRefPts()
Dim i
For i = 0 To UBound(strALLRefPts)
ReDim Preserve arrALLRefPts(i)
arrALLRefPts(i) = Rhino.PointCoordinates (strALLRefPts(i))
Next
Dim arrPtDir
arrPtDir = Rhino.PointCoordinates (strPtDir)
'set boundary
'---------------------------------------
Dim arrLine1(1), arrLine2(1)
Dim dblAngles, dblVectorLength, dblDist
Dim arrREFPts(), strRefPts() 
Dim n, m
n = 0
For m = 0 To UBound(arrALLRefPts)
arrLine1(0) = arrPtDir
arrLine1(1) = arrTrgPt
arrLine2(0) = arrALLRefPts(m)
arrLine2(1) = arrTrgPt
dblAngles = Rhino.Angle2 (arrLine1, arrLine2)
If dblAngles(0) < dblBoundAngle Then
dblVectorLength = Rhino.Distance (arrALLRefPts(m), arrTrgPt)
dblDist = dblVectorLength *Cos(dblAngles(0)*2*dblPi/360) 'cone
If dblDist < dblBoundCos Then
Call Rhino.Print ("through point: " & CStr(n+1))
ReDim Preserve arrRefPts(n)
arrRefPts(n) = arrALLRefPts(m)
ReDim Preserve strRefPts(n)
strRefPts(n) = strALLRefPts(m)
n = n+1
End If
End If
Next
'---------------------------------------
arrResult = strRefPts
boundaryCone = arrResult
End Function
'----------------------------------------------------------------------------------------------
'----------------------------------------------------------------------------------------------

```
