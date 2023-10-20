
# CAA-如何批量编译


## VS CONFIG

[VS2017](./CAA-VS/DS-CAA-VS2017.vsconfig)
[VS2019](./CAA-VS/DS-CAA-VS2019.vsconfig)
[VS2022](./CAA-VS/DS-CAA-VS2022.vsconfig)

## 如何运行

V5版本请运行 CAA_Build_B27.cmd
V6版本请运行 CAA_Build_B42x.cmd


## 版本参考

如下文件，请根据需要修改相应的版本号和项目文件夹的路径
	```bash
	V5_6R2017_B27 
	V6R2019x_B421 
	V6R2020x_B422 
    V6R2021x_B423 
	```

## 自动化流程

先自动编译，在复制或者更新win_b64 之远程仓库或者团队文件夹

=== "cmd自动编译"

	```batch

    title BUILD-CAA
    @echo off
    cd /d %~dp0
    @REM CALL ipconfig
    @echo ==============================================================
    CALL "C:\Program Files\Dassault Systemes\T27\win_b64\code\command\tck_init.bat"
    CALL tck_list
    CALL Tck_list V5_6R2017_B27 -all
    CALL tck_profile V5_6R2017_B27
    CALL mkmk  -a -g -u  -brief && mkrtv
    

	```

=== "提交修改的代码之仓库备份"

	```batch

	@echo off
	set date=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%

	cd /d %~dp0
	rem git pull
	rem git status
	@REM git config --global --add safe.directory E:/200-CODE/Dassault_Systemes/3DEXPERIENCE_Automation
	@REM git remote add origin git@gitee.com:xuscode/all_catia_code.git
	@REM git add B27 B421 B422 B423 B27_功能定义 V6功能定义
	rem git rm --cached -r 3DEXPERIENCE_Release B27
	@rem git add .

	rem git add *.md *.vb *.cs *.catvba *.CATScript *.bas  *.py *.cpp *.h *.DSGen *.tsrc *.osm   *.CATNls *.CATRsc *.mk *.ico *.rc *.afr *.xml *.cmd *.bat *.png *.bmp *.ico
	git add *.cpp *.h   *.CATNls *.CATRsc *.mk *.bmp  *.catvba *.CATScript *.bat *.txt
	git push --set-upstream origin master
	@echo WRITE UPDATE AND PRESS ENTER:
	::set /p GetYourLog=
	git commit -m "%date%"
	git push -u origin master
	pause

	```




## 手动cmd编译

=== "手动V5"

	```Batch
	Cd C:\CATAECObjectModeler
	"C:\Program Files\Dassault Systemes\B27\win_b64\code\command\tck_init.bat"
	tck_profile V5_6R2017_B27
	mkmk  -a -g -u  -brief && mkrtv
	```

=== "手动V6"

	``` Batch
	@echo off
	cd /d %~dp0
	rem echo "<Install> compatible" >Install_config_win_b64
	rem echo "C:\Program Files\Dassault Systemes\B423" >>Install_config_win_b64	
	call "C:\Program Files\Dassault Systemes\T423\win_b64\code\command\tck_init.bat"
	call tck_profile V6R2021x_B423
	mkmk  -a -g -u  -brief && mkrtv
	```

## 自动编译

=== "自动V6"

	```BATCH
	@echo off
	cd /d %~dp0
	CALL ipconfig
	echo "<Install> compatible" >Install_config_win_b64
	echo "C:\Program Files\Dassault Systemes\B423" >>Install_config_win_b64	
	set PATH=%PATH%;C:\Program Files\Dassault Systemes\B423_RADE\win_b64\TCK\command
	CALL "C:\Program Files\Dassault Systemes\B423_RADE\win_b64\code\command\tck_init.bat"
	CALL tck_profile V6R2021x_B423
	CALL mkmk  -a -g -u  -brief 
	CALL mkrtv

	```

=== "自动V5"

	```batch
	@echo off
	cd /d %~dp0
	CALL ipconfig
	CALL "C:\Program Files\Dassault Systemes\B27\win_b64\code\command\tck_init.bat"
	CALL tck_profile V5_6R2017_B27
	CALL mkmk  -a -g -u  -brief 
	CALL mkrtv
	```

## 命令行参考

Before being able to run the written application, you must build your programs with the appropriate compiler and linker. This is not a simple task especially when you must take into account various locations of source files, multiple operating systems, several languages, multiple compilers with different and numerous options, and so on. Those who have experienced makefiles management know the problem.

With mkmk, C++ Interactive Dashboard proposes a single tool to compile and link applications wherever you are working and whatever the programming language you use.

The first time you compile your program, use the mkmk builder which not only compiles your program but also generates information that used afterwards to accelerate compilations or to compile just one file.


### Build All with mkmk

```bash
mkmk -a ...
```
Link All	
```bash
mklnk or mklnk -a
```
Link Module	Runs mklink upon the selected module to link-edit it.
```bash	
mklnk
```
Build ID Cards	Runs mkCi upon the selected framework or workspace to build the identity cards.	
```bash
mkCi or mkCi -a
```
Clean Build	Runs mkRemoveDo upon the selected framework or workspace to remove all the derived objects.	
```bash
mkRemoveDo or mkRemoveDo -a
```

### The table below gives you a view on what could be used:

|	Option	|	Description	|
| ----------- | ------------------------------------ |
|	-a	|	If run in a workspace folder, build all the modules of all the frameworks of the current workspace, or if run in a framework folder, build all the modules of this framework.	|
|	-bsc	|	Create browser information files .bsc while compiling/linking.	|
|	-dev	|	Disable the optimization mode while compiling.	|
|	-g	|	Activate the debug mode while compiling.	|
|	-ge	|	Activate the editor and continue with the debug mode while compiling.	|
|	-h|-help|-?	|	Display the command help.	|
|	-idcard	|	Intend to recompile only the (embedding) framework identity card. No modules are built. This is not the default.	|
|	-javadoc	|	Generate Java documentation.	|
|	-jobs #	|	Multiprocessing mode. # is the maximum number of parallel tasks mkmk forks. Useful to limit the number of tasks when the machine is heavily used. Default is 5.	|
|	-keeptemp	|	Keep the temporary files created by mkmk. When this option is not used, these files are deleted when mkmk returns. These files are located in the LocalGenerated folders.	|
|	-lFW FWlist	|	Build the modules of the frameworks the names of which are listed in the file located at the path FWlist.	|
|	-lMod MODlist	|	Build the current framework modules the names of which are listed in the file located at the path MODlist.	|
|	-mkdataonly	|	Regenerate the build time data only.	|
|	-nobuild	|	Do not start the module build. Useful when coupled with option -u. mkmk then only regenerates the build time data.	|
|	-noci	|	Do not intend to recompile the (embedding) framework identity card. This is not the default..	|
|	-nomk	|	Deactivate the build time data update.	|
|	-showcmd	|	Print command lines before executing them.	|
|	-u	|	Force the build time data update.	|
|	-v	|	Verbose mode.	|
|	-w	|	Activate warning messages while compiling.	|
|	-W WSPath	|	Path of the workspace to process. Default is the current folder.	|
|	-xrefdb	|	Generate a framework dependency database. Internal.	|
|	-zip	|	Create java source archive files .zip while compiling.	|
|	FW1 [FW2]...	|	Build the modules of FW1, FW2, etc.	|
|	MOD1 [MOD2]...	|	Build MOD1, MOD2, etc., of the current framework.	|

## SDK

### R2023x FD02
Requirements for 3DEXPERIENCE Open Application Development
Build Time considerations for 3DEXPERIENCE Open Development Toolset for Native Apps
The following sections identify additional requirements for installation and activation of 3DEXPERIENCE Open Development Toolset for Native Apps on Windows:

Microsoft Visual Studio 2019 version 16.9.2 including C/C++ compilers.

Windows 10 SDK 10.0.18362.0 (It can be selected, during Visual Studio installation, in the "Individual components" tab by typing "windows sdk" in the search box and selecting the proper Windows SDK).


### R2022x FD09

Build Time considerations for 3DEXPERIENCE Open Development Toolset for Native Apps
The following sections identify additional requirements for installation and activation of 3DEXPERIENCE Open Development Toolset for Native Apps on Windows:

Microsoft Visual Studio 2019 version 16.9.2 including C/C++ compilers.

Windows 10 SDK 10.0.18362.0 (It can be selected, during Visual Studio installation, in the "Individual components" tab by typing "windows sdk" in the search box and selecting the proper Windows SDK).

### R2021x FD18

Build Time considerations for 3DEXPERIENCE Open Development Toolset for Native Apps
The following sections identify additional requirements for installation and activation of 3DEXPERIENCE Open Development Toolset for Native Apps on Windows:

Microsoft Visual Studio 2017 version 15.9.12 including C/C++ compilers.

Windows 10 SDK 10.0.16299.0 (It can be selected, during Visual Studio installation, in the "Individual components" tab by typing "windows sdk" in the search box and selecting the proper Windows SDK).


### R2020x FD19

Build Time considerations for 3DEXPERIENCE Open Development Toolset for Native Apps
The following sections identify additional requirements for installation and activation of 3DEXPERIENCE Open Development Toolset for Native Apps on Windows: Microsoft Visual Studio 2017 version 15.9.12 including C/C++ compilers, with Windows 10 SDK 10.0.16299.0.
