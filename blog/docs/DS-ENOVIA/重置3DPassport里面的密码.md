

# 重置3DPassport里面的密码

本文以Linux环境为例进行说明，如果3DPassport里面的密码忘记了，该如何进行重置。

* 在3DE服务器上创建一个文本文件，txt文件格式如下：

```bash

*PERSON admin_platform;Company Name
+ATTRIBUTE First Name;Admin
+ATTRIBUTE Last Name;Platform
+ATTRIBUTE EmailAddress;admin_platform@mydomain.com
+ATTRIBUTE Country;CN

```

* 进入3DPassport安装路径下command目录，如:

```bash
/app/DassaultSystemes/R2019x/3DPassport/linux_a64/code/command
```

* 运行如下语句

```bash
./ PassportUserImport.sh –url 3dpassporturl –filetxtfile –users username –action update –default_password newpassword
```

* 返回结果{"code":0,"messages":["ok"]}，表示密码更新成功。如果没有返回ok，请根据错误提示进行修改。

如果想在3DPassport里面批量创建用户，应该如何操作？本文继续以Linux环境为例进行说明。还是在3DPassport安装目录下找到command目录,
如：

=== "R2017x"
    ```bash
    C:\DassaultSystemes\R2017x\3DPassport\win_b64\code\command\PassportUserImport.bat
    ```
=== "R2019x"
    ```bash
    /app/DassaultSystemes/R2019x/3DPassport/linux_a64/code/command/PassportUserImport.sh
    ```


命令还可以用于在3DPassport批量创建用户。

* 首先创建一个txt文件，将新用户的基本信息按如下格式准备好。
* 运行命令

```bash
./PassportUserImport.sh -url https://r2019x.mydomain.com:40443/3dpassport -file /tmp/createuser.txt
```

* 检查每一次返回结果{"code":0,"messages":["ok"]}，表示创建成功。
* 打开3DPassport，测试登录。
* 再使用管理员为其分配license后，才可以访问3DSpace。


