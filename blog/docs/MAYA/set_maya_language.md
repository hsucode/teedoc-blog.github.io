<!--
 * @Name: 
 * @Data: YYYY-MM-DD HH:mm:ss
 * @Input: 
-->

# SET MAYA UI LANGUAGE


以管理员身份运行 cmd，然后运行以下代码，也可以 保存为  xxx.bat 文件直接右键管理员身份运行。

run_cmd_as_an_administrator_and_then_run_the_following_code_or_you_can_save_it_as_xxx_bat_file_and_run_it_as_an_administrator

## option1

```batch
setx /M MAYA_UI_LANGUAGE en_US
rem ja_JP
rem zh_CN
```

## option2

```batch
::add_environment_variable
@echo off
echo add_the_environment_variable
set regpath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
set evname=MAYA_UI_LANGUAGE
set batpath=en_US
reg add "%regpath%" /v %evname% /d %batpath% /f
pause>nul
```


```batch
::delete_environment_variable
@echo off
echo delete_the_bat_environment_variable
set regpath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
set evname=MAYA_UI_LANGUAGE
reg delete "%regpath%" /v "%evname%"  /f
pause>nul
```
