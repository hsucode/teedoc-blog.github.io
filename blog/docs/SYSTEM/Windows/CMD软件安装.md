
# CMD install apps

## chocolatey

#### 一、简介
chocolatey

* Windows 包管理工具，相当于brew（The package manager for Windows）
  
* 官网 
https://chocolatey.org/

* 环境
Windows 7+ / Windows Server 2003+
PowerShell v2+
.NET Framework 4+

#### 二、下载安装

PowerShell 安装
ps：
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

cmd 安装
直接拷贝执行即可，注意需要管理员身份运行

cmd:
```batch
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```


检查安装是否成功
choco -v

更新
choco upgrade chocolatey

#### 三、常用指令
Commands

    choco list -li 查看本地安装的软件
    choco search nodejs 查找安装包
    choco install sublimetext3 下载
    choco uninstall sublimetext3 卸载
    choco upgrade sublimetext3 更新（update）

## winget 

系统自带

