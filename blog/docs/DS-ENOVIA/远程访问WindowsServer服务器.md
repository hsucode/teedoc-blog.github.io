# 远程访问WindowsServer服务器


远程访问可以方便我们重置索引等操作

## 服务器安装SSH

安装 OpenSSH 阅读帮助

    https://docs.microsoft.com/zh-cn/windows-server/administration/openssh/openssh_install_firstuse

下载地址

    https://github.com/PowerShell/OpenSSH-Portable

可以进入以下链接，下载 微软SSH

    https://github.com/PowerShell/Win32-OpenSSH/releases

![](远程访问WindowsServer服务器\1.png)

以下是 Powershell 的下载链接，系统都自带了，只不过不是最新版本，如果需要更新可以在下面的链接下载 。


    https://github.com/PowerShell/PowerShell



下载好  OpenSSH-Win64.zip  文件，解压到  C:\  或者其他位置

打开系统自带的 Powershell ,管理员运行


```bash
"C:\OpenSSH-Win64\OpenSSH-Win64\install-sshd.ps1"
```

安装完毕。

![](远程访问WindowsServer服务器\2.png)

```sql
# Start the sshd service
Start-Service sshd

# OPTIONAL but recommended:
Set-Service -Name sshd -StartupType 'Automatic'

# Confirm the Firewall rule is configured. It should be created automatically by setup. Run the following to verify
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
}
```

复制以上命令启动SSH。

## 本地客户端操作

在本地客户端电脑的  微软 Terminal 中输入     #  ssh username@servername  # 链接服务器

```batch
ssh Administrator@172.16.2.2
```

![](远程访问WindowsServer服务器\3.png)

## 在客户端Terminal 中输入

```bash
"E:\DassaultSystemes\R2021x\3DSpace\win_b64\code\bin\mql.exe"
```
启动 MQL。
输入MQL语法即可操作服务，重建索引等。
![](远程访问WindowsServer服务器\4.png)

## 重建索引

```sql
set context user creator;
stop searchindex;
clear searchindex;
set system searchindex file E:\DassaultSystemes\R2021x\3DSpace\Apps\BusinessProcessServices\V6R2021x\Modules\ENOFramework\AppInstall\Programs\config.xml;
start searchindex mode full;
status searchindex;

```
