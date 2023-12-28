
## 前言



=== "V5R27"

	```batch
	cd /d %~dp0
	:GA
	CATIA_P3.win_b64\1\WIN64\StartB -u "C:\Program Files\Dassault Systemes\B27" -newdir -D "C:\Program Files\Dassault Systemes\B27\CATEnv"  -all -v -addUserPrivilegesForOrbix
	DELMIA.win_b64\1\WIN64\StartB -u "C:\Program Files\Dassault Systemes\B27" -newdir -D "C:\Program Files\Dassault Systemes\B27\CATEnv"  -all -v 

	:CAA
	CAA_CATIA_P3.win_b64\1\WIN64\StartCAAB -code "C:\Program Files\Dassault Systemes\B27" -all -v

	:RADE
	RADE.win_b64\1\WIN64\StartB -u "C:\Program Files\Dassault Systemes\B27" -newdir -D "C:\Program Files\Dassault Systemes\B27\CATEnv" -ident "RADE" -all -v

	:SP
	SPK.win_b64\1\WIN64\StartSPKB -u "C:\Program Files\Dassault Systemes\B27" -bC -killprocess -v
	SPK_CAA.win_b64\1\WIN64\StartSPKB -u "C:\Program Files\Dassault Systemes\B27" -bC -killprocess -v

	rem HOTFIXR27SP6\CDROM\B27.6.40.win_b64\1\WIN64\StartHFXB -u "C:\Program Files\Dassault Systemes\B27" -killprocess  -v

	rem  "C:\Program Files\Dassault Systemes\B27\win_b64\code\bin\CATSoftwareMgtB" -hfxR


	pause

	```


=== "B29"

	```batch
	.\CATIA_P3.win_b64\1\WIN64\StartB -u "C:\Program Files\Dassault Systemes\B29" -newdir -D "C:\Program Files\Dassault Systemes\B29\CATEnv"  -all -v 
	.\DELMIA.win_b64\1\WIN64\StartB -u "C:\Program Files\Dassault Systemes\B29" -newdir -D "C:\Program Files\Dassault Systemes\B29\CATEnv"  -all -v 
	.\RADE.win_b64\1\WIN64\StartB -u "C:\Program Files\Dassault Systemes\B29_RADE" -newdir -D "C:\Program Files\Dassault Systemes\B29_RADE\CATEnv" -ident "RADE" -all -v
	.\CAA_CATIA_P3.win_b64\1\WIN64\StartCAAB -code "C:\Program Files\Dassault Systemes\B29" -all -v

	.\SPK.win_b64\1\WIN64\StartSPKB -u "C:\Program Files\Dassault Systemes\B29" -bC -killprocess -v
	.\SPK.win_b64\1\WIN64\StartSPKB -u "C:\Program Files\Dassault Systemes\B29_RADE" -bC -killprocess -v

	.\SPK_CAA.win_b64\1\WIN64\StartSPKB -u "C:\Program Files\Dassault Systemes\B29" -bC -killprocess -v

	.\HOTFIXR29SP6\CDROM\B29.6.11.win_b64\1\WIN64\StartHFXB -u "C:\Program Files\Dassault Systemes\B29" -killprocess  -v
	.\HOTFIXR29SP6\CDROM\B29.6.11.win_b64\1\WIN64\StartHFXB -u "C:\Program Files\Dassault Systemes\B29_RADE" -killprocess  -v

	```

-addUserPrivilegesForOrbix 选项请求增加权限。


## 卸载HF
```batch
"C:\Program Files\Dassault Systemes\B29\win_b64\code\bin\CATSoftwareMgtB" -hfxR
"C:\Program Files\Dassault Systemes\B29_RADE\win_b64\code\bin\CATSoftwareMgtB" -hfxR
```
## 安装HF
```batch
.\WIN64\StartHFXB -u "C:\Program Files\Dassault Systemes\B29" -killprocess  -v
.\WIN64\StartHFXB -u "C:\Program Files\Dassault Systemes\B29_RADE" -killprocess  -v
```
