
@echo off  
echo cleaner running......  
	
rem xcopy /s /e /c /y /h /r /d "C:\Users\%username%\Documents\WXWork\1688857629348952\Cache\File" D:\BaiduSyncdisk\temp\

:: ipconfig
ipconfig/flushdns

:: IE
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

del /f /s /q %systemdrive%\*.tmp  
del /f /s /q %systemdrive%\*._mp  
del /f /s /q %systemdrive%\*.log  
del /f /s /q %systemdrive%\*.gid  
del /f /s /q %systemdrive%\*.chk  
del /f /s /q %systemdrive%\*.old  
del /f /s /q %systemdrive%\recycled\*.*  
del /f /s /q %windir%\*.bak  
del /f /s /q %windir%\prefetch\*.*  
del /f /q %userprofile%\cookies\*.*  
del /f /q %userprofile%\recent\*.*  
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"  
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"  
del /f /s /q "%userprofile%\recent\*.*" 

rd /s %systemdrive%\$Recycle.bin
rd /s /q %windir%\temp & md %windir%\temp  
rd /s /q %LocalAppData%\Temp
rd /s /q C:\Temp
rd /s /q C:\Tmp
rd /s /q C:\Windows\SoftwareDistribution\Download
rd /s/q "C:\Users\%username%\Documents\Tencent Files"
rd /s/q "C:\Users\%username%\Documents\WeChat Files"
rd /s/q "C:\Users\%username%\Documents\WXWork"
rd /s/q C:\Users\%username%\AppData\Local\DassaultSystemes\
rd /s/q C:\Users\%username%\AppData\Local\Temp

:clean log
PowerShell -Command "& {Clear-Eventlog -Log Application,System,Security}"
PowerShell -Command "& {Get-WinEvent -ListLog Application,System,Security -Force | % {Wevtutil.exe cl $_.Logname}}"

Clear-Eventlog -Log Application,System,Security
Get-WinEvent -ListLog Application,System,Security -Force | % {Wevtutil.exe cl $_.Logname}

echo 清除系统垃圾完成！  
echo. & pause

