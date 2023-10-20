
# md5批量校验生成

```batch
title 002md5批量校验生成
setlocal enabledelayedexpansion
%~d0
cd %~dp0
if exist 001filelist.txt del 001filelist.txt
for /R %%s in (.,*) do (
echo %%s
) >>001filelist.txt
if exist 002md5.txt del 002md5.txt
for /f "skip=1" %%a in (001filelist.txt) do certutil -hashfile %%a MD5>>002md5.txt

```
