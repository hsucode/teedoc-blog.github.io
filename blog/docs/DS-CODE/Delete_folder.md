

# 删除文件夹

在CAA 开发中，经常需要清理缓存，也就是win_b64文件夹，来个整体重新编译，使用自带的编译器有时候清理不干净，使用下面脚本会删除的很干净，它也可以修改一下字符变成递归删除自己需要删除的文件夹。

可以修改 __fn__ 的值，变成自己需要的文件夹名称


```batch
cd /d %~dp0
set fn=win_b64
for /f "delims=" %%i in ('dir %fn% /s/ad/b') do rd /s/q "%%i"
```
