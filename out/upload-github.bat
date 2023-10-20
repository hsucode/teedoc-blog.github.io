@echo off

cd /d %~dp0
git add .

@echo WRITE UPDATE AND PRESS ENTER:
::set /p GetYourLog=
git commit -m "%date%  %time%"
git push --force


timeout /t 10