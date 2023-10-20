# CAA-开发安装


## vs 下载

	https://visualstudio.microsoft.com/zh-hans/vs/older-downloads/

	下载社区版，旧的社区版已经被微软取消了，只能找第三方下载地址

## VS 离线下载

=== "2015"

	https://learn.microsoft.com/zh-cn/previous-versions/visualstudio/visual-studio-2015/install/create-an-offline-installation-of-visual-studio?view=vs-2015

	To create the special offline feed, run the following command: /layout Drive:\VisualStudio2015 /overridefeeduri URL-to-feed-xml

	For example, for an English-language special offline feed of Visual Studio 2015 Enterprise, run:
	
	```bash
	vs_enterprise_ENU.exe /layout D:\VisualStudio2015 /overridefeeduri "https://go.microsoft.com/fwlink/?LinkID=785882&clcid0x409"
	```
	For a complete list of URLs that you can use to create a special offline feed in the language of your choice, see the table below.

    2015版本提供了光盘，但是安装过程仍然需要联网；

=== "2017"
	```bash
	vs_enterprise.exe --layout c:\localVSlayout --lang en-US
	```

=== "2019"
	```bash
	vs_enterprise.exe --layout c:\localVSlayout --lang en-US
	```

=== "2022"
	
	https://learn.microsoft.com/en-us/visualstudio/install/create-an-offline-installation-of-visual-studio?view=vs-2022

	```bash
	vs_enterprise.exe --layout c:\localVSlayout --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetWeb --includeOptional --lang en-US
	```

	```bash
	vs_enterprise.exe --layout c:\localVSlayout --lang en-US
	```


=== "批量下载"

	```batch

	Set mypath=%~dp0
	cd /d %mypath%

	md VS2015\VS2015Offline_Com
	md VS2015\VS2015Offline_Pro
	md VS2015\VS2015Offline_Ent

	md VS2017\VS2017Offline_Com
	md VS2017\VS2017Offline_Pro
	md VS2017\VS2017Offline_Ent

	md VS2019\VS2019Offline_Com
	md VS2019\VS2019Offline_Pro
	md VS2019\VS2019Offline_Ent

	md VS2022\VS2022Offline_Com
	md VS2022\VS2022Offline_Pro
	md VS2022\VS2022Offline_Ent

	rem VS2015\vs_community.exe /layout VS2015\VS2015Offline_Com
	rem VS2015\vs_Professional.exe /layout VS2015\VS2015Offline_Pro
	rem VS2015\vs_Enterprise.exe /layout VS2015\VS2015Offline_Ent

	VS2017\vs_community.exe --layout VS2017\VS2017Offline_Com --lang en-US
	VS2017\vs_Professional.exe --layout VS2017\VS2017Offline_Pro --lang en-US
	VS2017\vs_Enterprise.exe --layout VS2017\VS2017Offline_Ent --lang en-US

	VS2019\vs_community.exe --layout VS2019\VS2019Offline_Com --lang en-US
	VS2019\vs_Professional.exe --layout VS2019\VS2019Offline_Pro --lang en-US
	VS2019\vs_Enterprise.exe --layout VS2019\VS2019Offline_Ent --lang en-US

	VS2022\VisualStudioSetup.exe --layout VS2022\VS2022Offline_Com --lang en-US
	VS2022\vs_community.exe --layout VS2022\VS2022Offline_Com --lang en-US
	VS2022\vs_Professional.exe --layout VS2022\VS2022Offline_Pro --lang en-US
	VS2022\vs_Enterprise.exe --layout VS2022\VS2022Offline_Ent --lang en-US

	rem https://download.microsoft.com/download/e/b/c/ebc2c43f-3821-4a0b-82b1-d05368af1604/vs2015.3.pro_enu.iso
	rem https://download.microsoft.com/download/8/4/3/843ec655-1b67-46c3-a7a4-10a1159cfa84/vs2015.3.ent_enu.iso
	rem https://download.microsoft.com/download/b/e/d/bedddfc4-55f4-4748-90a8-ffe38a40e89f/vs2015.3.com_enu.iso

	```