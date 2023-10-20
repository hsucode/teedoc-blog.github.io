
@echo off
echo Input you Project_Name.
set /p Project_Name=
echo Your Project_Name is %Project_Name%.


md %Project_Name%
echo # %Project_Name% >%Project_Name%.md
