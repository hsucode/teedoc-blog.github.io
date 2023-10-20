# CreatePointFromExcel


```vb

Imports System
Imports excel = Microsoft.Office.Interop.Excel
Imports HybridShapeTypeLib
Imports MECMOD
Imports KnowledgewareTypeLib

Partial Public NotInheritable Class ThisApplication
    Inherits ObjectModelAgentLib.CATIAEntryPoint

    Public Shared Sub CATMain()
        'Debug entry point, not visible from the host
        CATIA.SystemService.PrintToStdout("Hello, World! VB.NET")

        Dim xlsapp As Microsoft.Office.Interop.Excel.Application = GetObject(, "Excel.Application")
        Dim sheet As excel.Worksheet = xlsapp.ActiveSheet

        Dim part As MECMOD.Part = CATIA.ActiveEditor.ActiveObject
        Dim hsf As HybridShapeTypeLib.HybridShapeFactory = part.HybridShapeFactory

        Dim hb As HybridBody
        hb = part.HybridBodies.Add


        Dim i As Integer = 1

        Dim x, y, z As Double
        For i = 1 To 35
            x = sheet.Cells(i + 2, 11).value
            y = sheet.Cells(i + 2, 12).value
            z = sheet.Cells(i + 2, 13).value

            Dim pt As Point = hsf.AddNewPointCoord(x, y, z)
            pt.Compute()
            hb.AppendHybridShape(pt)

        Next
    End Sub
    
End Class

```

```rust
    println!("Hello, world!");
```
