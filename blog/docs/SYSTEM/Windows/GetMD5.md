
# 获得文件的MD5码

## CMD方式

右键Windows　开始菜单，点击powershell,输入以下命令
```powershell
CertUtil -hashfile "D:\aaa.zip" MD5 
```
__"D:\aaa.zip" 替换你的文件地址__

系统会返回ＭＤ５吗，检查此码，给官方提供的码是否一致，不一致说明文件被别人修改了，需要注意了


=== "MD5"

    ```batch
    CertUtil -hashfile "D:\aaa.zip" MD5 

    ```

=== "sha256"

    ```batch

    CertUtil -hashfile "D:\aaa.zip" sha256

    ```

=== "sha1"

    ```batch

    CertUtil -hashfile "D:\aaa.zip" sha1
    ```