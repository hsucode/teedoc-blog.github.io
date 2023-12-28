
# V6 Installer

## 前言

* 复制第一次安装的安装记录 xml 文件例如 "C:\Program Files\Dassault Systemes\B421_RADE\InstallData\UserIntentions_CODE.xml" 复制到一个新的地方，如C盘

* 找到新的新的位置，再按照下面的操作，格式为 "按照文件位置 startTUI.exe" --silent "xml位置"

* cmd 如下
*
```bash
".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent "C:\UserIntentions_CODE.xml"
```

* jre.exe /s Java 在高版本中已经内嵌了，无需安装

* 按照下图的顺序将软件管理好，以后如果系统出问题，重做系统的之后，可以一键全自动的方式安装各个版本的达索软件

[代码可以直接下载](https://gitee.com/xuscode/ds-nativeapps-installer?_from=gitee_search)





=== "B421"

    ```batch
    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CODE.xml
    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CODE_421.14.xml

    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CAA_421.14.xml
    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CAA_Additional_421.xml
    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\RADE\UserIntentions_CODE.xml
    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\RADE\UserIntentions_CODE_421.14.xml
    ```

=== "B422"

    ```batch
    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CODE.xml
    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CODE_421.14.xml

    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CAA_421.14.xml
    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CAA_Additional_421.xml
    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\RADE\UserIntentions_CODE.xml
    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\RADE\UserIntentions_CODE_421.14.xml
    ```

=== "B423"

    ```batch
    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CODE.xml
    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CODE_421.14.xml

    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CAA_421.14.xml
    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CAA_Additional_421.xml
    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\RADE\UserIntentions_CODE.xml
    ".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\RADE\UserIntentions_CODE_421.14.xml
    ```

![](2022-04-21-21-30-13.png)
![](2022-04-21-21-34-15.png)


## 全自动安装

把下面文件存为 .bat 文件，右键管理员身份运行即可

```batch

cd /d %~dp0

:GA and CAA
".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CODE.xml
".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CODE_421.14.xml
".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CAA_421.14.xml
".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\UserIntentions_CAA_Additional_421.xml

:RADE
".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\RADE\UserIntentions_CODE.xml
".\AM_3DEXP_NativeApps.AllOS\6\3DEXPERIENCE_NativeApps\1\StartTUI.exe" --silent  .\InstallData\RADE\UserIntentions_CODE_421.14.xml

```

