title 创建MD文档架构

@echo off
echo Input you Project_Name.
set /p Project_Name=
echo Your Project_Name is %Project_Name%.

md %Project_Name%
cd %Project_Name%
@REM echo # %Project_Name% >%Project_Name%.md

echo --->%Project_Name%.md
echo title: %Project_Name% >>%Project_Name%.md
echo keywords: %Project_Name%, catia >>%Project_Name%.md
echo desc: %Project_Name% >>%Project_Name%.md
echo author: designer >>%Project_Name%.md
echo date: 2021-03-14 >>%Project_Name%.md
echo tags: hello, blog, teedoc >>%Project_Name%.md
echo cover: ./assets/cover.jpg >>%Project_Name%.md
echo --->>%Project_Name%.md

cd ....

