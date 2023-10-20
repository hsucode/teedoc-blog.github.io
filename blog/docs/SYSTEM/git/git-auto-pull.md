
# auto pull

```bash
@echo off
cd /d %~dp0

set n=0
:abc
timeout /t 60
@echo start auto pull
CALL git_pull_all_code.bat
set /a n+=1
if %n%==300 exit
goto abc
```

## git_pull_all_code.bat


```bash

@ IF $%1 == $ GOTO GITDIR

:UPDATE
@ SET REPOS=%1
@ CD %REPOS:~0,-5%
@ ECHO Pulling [%CD%] ...
@ git pull
@ GOTO FINISH

:GITDIR
@ FOR /F %%I IN ('DIR /B /S /AD .git') DO @ CALL %0 %%I

:FINISH
@ CD %~DP0

```
