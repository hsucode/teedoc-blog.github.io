
# CATIA V5 安装步骤


1. 得到软件，检查md5 和官网发布的md5 是否一致，如果不一致，说明文件损坏，需要重新下载新的软件介质；检查工具参考(md5批量生成)[https://xuscode.github.io/bimnote.github.io/SYSTEM/Windows/md5%E6%89%B9%E9%87%8F%E6%A0%A1%E9%AA%8C%E7%94%9F%E6%88%90/]
2. 获得许可证电脑所在的IP或者电脑名称，确保现在需要安装的软件的电脑能连上许可证电脑，如果许可证电脑就是本机，需要先安装好许可证管理器，然后倒入license；参考(许可证导入)[https://xuscode.github.io/bimnote.github.io/CATIA/%E5%AF%BC%E5%85%A5%E8%AE%B8%E5%8F%AF%E8%AF%81/]

3. 请设置好你的许可证指向IP，编辑 C:\ProgramData\DassaultSystemes\Licenses\DSLicSrv.txt，设置里面的内容为  <ip>:4085,例如本地为 localhost:4085

    ```batch
    md C:\ProgramData\DassaultSystemes\Licenses\
    echo 10.tcp.cpolar.top:11135 >C:\ProgramData\DassaultSystemes\Licenses\DSLicSrv.txt
    ```
    也可以使用管理员运行cmd,运行以上代码


4. 开始安装CATIA，过程直接下一步即可，也可以参考批处理安装方法(链接)[https://xuscode.github.io/bimnote.github.io/CATIA/V5_Installer/]

5. 最后在软件的首选项内勾选获得的许可即可开启使用软件

