# git 常用代码

tools 文件夹内包含git 和 7z 软件包


## 自动下拉更新


```batch

@echo off
set PATH=%~dp0\tools\git\cmd;%PATH%
cd /d %~dp0
git pull --force
timeout /t 5

```



## 自动打包压缩包

```batch

@echo off
@title AUTO-ZIP
set MyPath=%~dp0

@echo delete 7z

if exist %MyPath%\V6R2021x_BMEDI.7z del %MyPath%\V6R2021x_BMEDI.7z
"%MyPath%\tools\zip\7za.exe" a "%MyPath%\V6R2021x_BMEDI.7z" ".\net6.0-windows"

@echo all done
timeout /t 5

```
