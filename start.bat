cd /d %~dp0
rem python -m venv pyenv
call C:\dev\pyenv\Scripts\activate.bat

goto aaa
mkdir my_site
cd my_site
teedoc init

rem -i https://pypi.tuna.tsinghua.edu.cn/simple

teedoc -d my_site init

cd my_site
teedoc install

:aaa

teedoc build
teedoc serve

