
# Cmd-7z 打包文件

```bash

@echo off
@title "B423"
set MyPath=%~dp0
set filename=aaaa
@echo delete 7z
if exist %MyPath%\%filename%.7z del %MyPath%\%filename%.7z

"C:\Program Files\7-Zip\7z.exe" a "%MyPath%\%filename%.7z"  ".\CATApps"
"C:\Program Files\7-Zip\7z.exe" a "%MyPath%\%filename%.7z"  ".\CATEnv"
"C:\Program Files\7-Zip\7z.exe" a "%MyPath%\%filename%.7z"  ".\CATSettings"
"C:\Program Files\7-Zip\7z.exe" a "%MyPath%\%filename%.7z"  ".\CATIA_R2021x.cmd"
"C:\Program Files\7-Zip\7z.exe" a "%MyPath%\%filename%.7z"  ".\help.txt"

@echo all done
timeout /t 5

```
