
# AttractorToolsScale

```cs
Option Explicit
'------------------------------------------------------------------------------
' Subroutine: 	attractorToolsScale
' Purpose:    	transforms objects based on proximity to attractors
' Author:    	Roland Snooks | 2007 | www.kokkugia.com
'------------------------------------------------------------------------------
Sub attractorToolsScale
  
  Dim i, j, arrObjects, arrAttract, thresholdDist, scaleFactor, arrBBox, arrCntrPt, counter, arrAttPt 
  Dim dblAttDistTest, dblClosestAttDist, dblClosestAtt, adjAmount
  
  ' input
  arrObjects = Rhino.GetObjects("select objects")
  arrAttract = Rhino.GetObjects("select point attractors", 0)
  thresholdDist = Rhino.GetReal("distance threshold", 10, 0)
  scaleFactor = Rhino.GetReal("scale factor", 1, 0)
  
  ' loop through each object and get the closest attractor
  For i = 0 To UBound(arrObjects)
      
    ' get object bounding box centerpoint
    arrBBox = Rhino.BoundingBox(arrObjects(i))
    arrCntrPt = array((((arrBBox(2)(0)) + (arrBBox(0)(0))) / 2), (((arrBBox(2)(1)) + (arrBBox(0)(1))) / 2), (((arrBBox(0)(2)) + (arrBBox(4)(2))) / 2))
 
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
      adjAmount = 1 - ((thresholdDist - dblClosestAttDist)/thresholdDist)                     ' decrease infinite amount
      'adjAmount = ((thresholdDist - dblClosestAttDist)/thresholdDist) * scaleFactor + 1      ' increase by factor of up to 100% x scaleFactor
   
      ' based on attractor proximity do something to the object (eg scale)
      
      ' scale
      Rhino.ScaleObject arrObjects(i), arrCntrPt, array(adjAmount,adjAmount,adjAmount) ' scale
      
      ' change color
      at_ChangeColor arrObjects(i),thresholdDist,dblClosestAttDist,scaleFactor 
      
    End If
    
  Next  
End Sub
attractorToolsScale
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

```