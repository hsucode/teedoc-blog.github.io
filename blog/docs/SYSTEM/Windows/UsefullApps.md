

# 常用软件安装

__我为什么要写上这个？因为如果你的达索软件出问题了，可能我无法帮你解决，我可能就会抛出让你重做系统这个解决方法，可是你觉得很麻烦，所以我提供这个软件自动安装解决方案，也是无奈的。__

Windows 11 直接在 cmd 输入以下列表安装自己需要的软件，如果没有可以自己搜索

**Winget search BAIDU**

列表会自动列出可以下载的产品，输入  winget install 加上 ID 即可自动安装
Windows 10 用户需要进入商店安装以下产品，之后你的CMD 的winget 才可用

直接CMD输入 winget 可以获得使用帮助。

__软件下载的同时会列出下载地址，如果嫌弃比较慢可以直接复制用下载软件下载，下载完成后的软件在 %Temp%\winget  文件夹，可以直接进去此文件双击安装或者Cmd 安装。__

```batch
start /wait %Temp%\winget\"Firefox Setup 79.0.exe" /s

```

把常用的软件写成如下格式，存为bat 文件双击即可全自动安装。
如果需要更新软件可以采用以下格式

**winget upgrade Tencent.WeChat**

## 编辑器

* Visual Studio Code 
    1. icon  
* Sublime text 4
    1. Terminal
    2. Terminus
    3. ConventerUTF8
  
* Notepad++
  
## IDE 
* Visual Studio 2017
* Visual Studio 2019
* Visual Studio 2022
* Python

## apps
* 7zip
* Microsoft Terminal (win11 自带，win 10 应用商店安装) 
* winget (win11 自带，win 10 应用商店安装) 

## 软件自动安装列表

```batch
@echo off  

winget install Microsoft.Powertoys  
winget install Microsoft.VisualStudioCode
winget install Microsoft.WindowsTerminal.Preview
winget install Microsoft.WindowsTerminal
winget install Microsoft.Teams
winget install Microsoft.Skype
winget install Microsoft.PowerShell
winget install Microsoft.RemoteDesktopClient

winget install Tencent.WeiyunSync       
winget install Tencent.Weiyun
winget install Tencent.wechat-work
winget install Tencent.WeChat
winget install Tencent.TIM 
winget install Tencent.TencentVideo 
winget install Tencent.TencentMeeting

winget install Google.Chrome
winget install Adobe.Acrobat.Reader.64-bit
winget install Mozilla.Firefox
winget install Mozilla.Thunderbird
winget install Tonec.InternetDownloadManager
winget install VMware.WorkstationPro
winget install 7zip.7zip

winget install Alibaba.Teambition
winget install Alibaba.aDrive
winget install Baidu.BaiduNetdisk
winget install Baidu.BaiduTranslate
winget install Youdao.YoudaoDict
winget install ByteDance.Feishu
winget install Zoom.Zoom
winget install AnyDeskSoftwareGmbH.AnyDesk

winget install --id Git.Git -e --source winget
winget install Git.Git
winget install TortoiseGit.TortoiseGit
winget install TortoiseSVN.TortoiseSVN

winget install JetBrains.PyCharm.Community
winget install JetBrains.IntelliJIDEA.Community
winget install Python.Python.3

winget install AdoptOpenJDK.OpenJDK.11
winget install Microsoft.OpenJDK.11

```
