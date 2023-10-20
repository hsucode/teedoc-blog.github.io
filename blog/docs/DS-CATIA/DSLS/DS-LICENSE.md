
# DS License

=== "导入许可证"

    - 首先在软件安装包内找到 License Server 软件进行安装，或者通过以下网站进行下载

    [下载链接](https://www.3ds.com/support/documentation/resource-library/single/dassault-systemes-license-server-and-license-keys/)

    ![](导入许可证\2022-09-20-01-32-01.png)

    - 打开许可管理器License Server

    ![](导入许可证\2022-09-06-16-51-35.png)

    - 双击激活local host ，确定

    ![](导入许可证\2022-09-06-16-51-43.png)
    ![](导入许可证\2022-09-06-16-51-54.png)

    - 点击‘许可证’、‘登记’

    ![](导入许可证\2022-09-06-16-52-01.png)

    - 找到从邮件里面下载好的许可证，打开。

    ![](导入许可证\2022-09-06-16-52-09.png)

    确定 。

    导入许可证完成

    注：邮件里面.LICZ格式的为许可证
    ![](导入许可证\2022-09-06-16-52-21.png)





=== "创建许可"

    一定要管理员运行cmd,不是powershell

    ```powershell

    md C:\ProgramData\DassaultSystemes\Licenses\
    echo localhost:4085 >C:\ProgramData\DassaultSystemes\Licenses\DSLicSrv.txt

    ```

