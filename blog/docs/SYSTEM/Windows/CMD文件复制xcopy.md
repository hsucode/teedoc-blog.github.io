

# CMD文件复制 xcopy

可以使用一下方法

* 先创建目标文件夹
md X:\003_Projects\New_Project

* 把自己的项目复制到目标文件夹,使用 下面的cmd 复制资料电脑不会卡死，/q 可以隐藏细节。

```batch
xcopy C:\Video\*.* X:\003_Projects\New_Project  /s /e /c /y /h /r /d

echo d| xcopy D:\win_b64\*.* D:\win_b64\ /s /e /c /y /h /r /d

echo d| xcopy /s /e /c /y /h /r /d Z:\004_WorkSpace\VIDEO\*.* .\


```

