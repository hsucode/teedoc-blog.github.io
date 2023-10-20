# vba call exe

```vb
Sub CATMain()

Dim strProgramName As String

strProgramName = "D:\003_Projects\SUCDRI\VIDEO\YMA\APP\Macro\100-立面图自动标注2.exe"
strProgramName = "D:\003_Projects\SUCDRI\VIDEO\YMA\APP\Macro\101-平面图自动标注2.exe"
strProgramName = "D:\003_Projects\SUCDRI\VIDEO\YMA\APP\Macro\200-盖梁顶部钢筋标注.exe"
strProgramName = "D:\003_Projects\SUCDRI\VIDEO\YMA\APP\Macro\201-盖梁底部钢筋标注.exe"
strProgramName = "D:\003_Projects\SUCDRI\VIDEO\YMA\APP\Macro\202-盖梁后侧钢筋标注32.exe"
strProgramName = "D:\003_Projects\SUCDRI\VIDEO\YMA\APP\Macro\203-盖梁侧钢筋标注31.exe"
strProgramName = "D:\003_Projects\SUCDRI\VIDEO\YMA\APP\Macro\204-封锚端部钢筋标注.exe"
strProgramName = "D:\003_Projects\SUCDRI\VIDEO\YMA\APP\Macro\300-材料统计_中文环境.exe"
strProgramName = "D:\003_Projects\SUCDRI\VIDEO\YMA\APP\Macro\301-材料统计.exe"
strProgramName = "D:\003_Projects\SUCDRI\VIDEO\YMA\APP\Macro\400-支座分布图2.exe"
strProgramName = "D:\003_Projects\SUCDRI\VIDEO\YMA\APP\Macro\500-分板图自动标注.exe"

Call Shell("""" & strProgramName & """", vbNormalFocus)
    
End Sub

```
