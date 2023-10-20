
# Army HQ Pavilion

```java
Option Explicit
'-------------------------------------------------------------------------------
' Subroutine: Army HQ Pavilion
' Purpose: honeycomb study
' Author: Milutin Cerovic 2009
' www.4ofseven.com
'--------------------------------------------------------------------------------
Call Main() 
Sub Main()  
Dim arrIsoCurves
Dim arrPoints
Dim DivNumber
Dim i,j
arrIsoCurves=Rhino.GetObjects ("Select Isocurves, in order one by one")
ReDim arrPoints(UBound(arrIsoCurves))
DivNumber = Rhino.GetReal ("enter divide number") 
For i=0 To UBound(arrIsoCurves)
arrPoints(i)=Rhino.DivideCurve(arrIsoCurves(i),DivNumber,True)
Next
For i=0 To (UBound(arrIsoCurves)-1)Step 2
For j=0 To (DivNumber-2)
If j Mod 2 <> 0 Then
Rhino.addLine arrPoints(i)(j),arrPoints(i+1)(j+2)
Rhino.addLine arrPoints(i)(j),arrPoints(i+1)(j)
Rhino.addLine arrPoints(i+1)(j),arrPoints(i+2)(j)
End If
Next
Next
End Sub


```
