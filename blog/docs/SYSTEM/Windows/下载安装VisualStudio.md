

# 下载安装VisualStudio


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
