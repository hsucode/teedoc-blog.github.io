
# AnnotateCurveEndPoints

```java

Sub AnnotateCurveEndPoints()
Const rhObjectCurve = 4
Dim strObject, arrPoint
' Get the curve object
strObject = Rhino.GetObject("Select curve", rhObjectCurve)
If IsNull(strObject) Then Exit Sub 
' Add the first annotation
arrPoint = Rhino.CurveStartPoint(strObject)
Rhino.AddPoint arrPoint
Rhino.AddTextDot Rhino.Pt2Str(arrPoint, 3), arrPoint
' Add the second annotation if necessary
If Not Rhino.IsCurveClosed(strObject) Then
arrPoint = Rhino.CurveEndPoint(strObject)
Rhino.AddPoint arrPoint
Rhino.AddTextDot Rhino.Pt2Str(arrPoint, 3), arrPoint
End If
End Sub

```
