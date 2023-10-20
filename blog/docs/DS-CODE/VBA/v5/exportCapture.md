


# Export capture

## VBA
```vb

Sub CATMain()

Dim partDocument1 As PartDocument
Set partDocument1 = CATIA.ActiveDocument

Dim part1 As Part
Set part1 = partDocument1.Part

For k = 1 To CATIA.ActiveDocument.Selection.Count
    Dim parm1 As Parameter
    Set parm1 = CATIA.ActiveDocument.Selection.Item(k).Value
    'part1.Parameters.Item("Angle.1")
    Debug.Print parm1.ValueAsString()
    For i = 1 To 360
        Dim str As String
        str = CStr(i) & "deg"    
        parm1.ValuateFromString (str)
        part1.Update
        CATIA.ActiveWindow.ActiveViewer.CaptureToFile catCaptureFormatJPEG, "C:\temp\img\" & "\MyImage" & CStr(k) & "_" & CStr(i) & ".jpg"
    Next
Next

End Sub

Sub delay()
'前面的代码到此
T = Timer
Do While Timer - 2 < T
Debug.Print
Loop
'后面的代码继续
End Sub


```
