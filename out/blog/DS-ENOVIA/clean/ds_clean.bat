title system-cleaning
@echo off
echo System garbage removal is in progress, please be patient......

rem ipconfig
ipconfig/flushdns

rd /s/q C:\Users\%username%\AppData\Local\DassaultSystemes\

rem IE
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
echo Cookies
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2
echo Histroy
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1
echo Sheet
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16
echo Password
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 32
echo ALL
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
echo ALl and plugin
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351

rem delete_system_cache
@REM del /f /q %userprofile%\AppData\Local\Temp\*.*

rd /s /q %LocalAppData%\Temp
rd /s /q C:\Temp
rd /s /q C:\Tmp
rd /s /q C:\Windows\SoftwareDistribution\Download

rem clean log

echo system_garbage_removal_complete
echo. & pause
