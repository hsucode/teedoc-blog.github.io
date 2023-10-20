

# CAA-TCK

C:\Program Files\Dassault Systemes\T27\win_b64\code\command\tck_init.bat

C:\Users\user>tck_list,会显示一下结果


```bash
	SCM_adm_V5_6R2017_B27 tckDevTools_V5_6R2017_B27 SCM_adm_V5_6R2017_B27
	V5_6R2017_B27 Mkmk_V5_6R2017_B27 tckDevTools_V5_6R2017_B27 CSC_V5_6R2017_B27
	V6R2021x_B423 Mkmk_V6R2021x_B423 tckDevTools_V6R2021x_B423 CSC_V6R2021x_B423
```

=== "V5"

	Tck_list V5_6R2017_B27 -all,会显示一下结果

	```bash
	SCM_adm_V5_6R2017_B27 user 2023/03/07-19:30:34 local
	Type = Official
	tckDevTools_V5_6R2017_B27 2023/03/07-19:30:34 local
		Windows NT: C:\Program Files\Dassault Systemes\T27\win_b64\code\command\tckDevTools_init.bat
	SCM_adm_V5_6R2017_B27 2023/03/07-19:30:34 local
		Windows NT: C:\Program Files\Dassault Systemes\T27\win_b64\code\command\admin\adl_profile_adm.bat
	V5_6R2017_B27 user 2023/03/07-19:30:34 local
	Type = Official
	Mkmk_V5_6R2017_B27 2023/03/07-19:30:34 local
		Windows NT: C:\Program Files\Dassault Systemes\T27\win_b64\code\command\mkinit.bat
	tckDevTools_V5_6R2017_B27 2023/03/07-19:30:34 local
		Windows NT: C:\Program Files\Dassault Systemes\T27\win_b64\code\command\tckDevTools_init.bat
	CSC_V5_6R2017_B27 2023/03/07-19:30:34 local
		Windows NT: C:\Program Files\Dassault Systemes\T27\win_b64\code\command\mkcsinit.bat
	```


	INIT:
	C:\Program Files\Dassault Systemes\T27\win_b64\code\command\tck_init.bat
	"C:\Program Files\Dassault Systemes\T27\win_b64\code\command\tck_init.bat"


	ADD:

	```bash
	tck_update_local V5_6R2017_B27 -tool Mkmk_V5_6R2017_B27 -profile "C:\Program Files\Dassault Systemes\T22\win_b64\code\command\mkinit.bat"
	tck_update_local V5_6R2017_B27 -tool tckDevTools_V5_6R2017_B27 -profile "C:\Program Files\Dassault Systemes\T22\win_b64\code\command\tckDevTools_init.bat"
	tck_update_local V5_6R2017_B27 -tool CSC_V5_6R2017_B27 -profile "C:\Program Files\Dassault Systemes\T22\win_b64\code\command\mkcsinit.bat"
	
	```
	REMOVE:

	```bash

	tck_update_local V5_6R2017_B27 -tool Mkmk_V5_6R2017_B27 -remove  "C:\Program Files\Dassault Systemes\T27\win_b64\code\command\mkinit.bat"
	tck_update_local V5_6R2017_B27 -tool tckDevTools_V5_6R2017_B27 -remove "C:\Program Files\Dassault Systemes\T27\win_b64\code\command\tckDevTools_init.bat"
	tck_update_local V5_6R2017_B27 -tool CSC_V5_6R2017_B27 -remove  "C:\Program Files\Dassault Systemes\T27\win_b64\code\command\mkcsinit.bat"

	```



=== "V6"


	```bash
	C:\Users\user>tck_update_local
	Running command: tck_update_local
	#ERR# ADLBC - 0004: tck_update_local requires one argument
	Usage: tck_update_local TCK [-tool Tool] [-profile profile | -remove] [-os] [-h|-help|-?]
		tck_update_local TCK -tool Tool [-profile profile]
		tck_update_local TCK -tool Tool -remove
		tck_update_local TCK -remove
		
	Tck_list V6R2021x_B423 -all,会显示一下结果
	```


	"C:\dev\T423\win_b64\code\command\tck_init.bat"
	"C:\Program Files\Dassault Systemes\T423\win_b64\code\command\tck_init.bat"


	```bash
	:add
	tck_update_local V6R2021x_B423 -tool Mkmk_V6R2021x_B423 -profile  "C:\Program Files\Dassault Systemes\T423\win_b64\code\command\mkinit.bat"
	tck_update_local V6R2021x_B423 -tool tckDevTools_V6R2021x_B423 -profile "C:\Program Files\Dassault Systemes\T423\win_b64\code\command\tckDevTools_init.bat"
	tck_update_local V6R2021x_B423 -tool CSC_V6R2021x_B423 -profile  "C:\Program Files\Dassault Systemes\T423\win_b64\code\command\mkcsinit.bat"
	tck_update_local V6R2021x_B423 -profile

	:remove
	tck_update_local V6R2021x_B423 -tool Mkmk_V6R2021x_B423 -remove  "C:\Program Files\Dassault Systemes\T423\win_b64\code\command\mkinit.bat"
	tck_update_local V6R2021x_B423 -tool tckDevTools_V6R2021x_B423 -remove "C:\Program Files\Dassault Systemes\T423\win_b64\code\command\tckDevTools_init.bat"
	tck_update_local V6R2021x_B423 -tool CSC_V6R2021x_B423 -remove  "C:\Program Files\Dassault Systemes\T423\win_b64\code\command\mkcsinit.bat"
	tck_update_local V6R2021x_B423 -remove

	Mkmk_V6R2021x_B423 2023/03/10-00:20:45 local
		Windows NT: C:\Program Files\Dassault Systemes\T423\win_b64\code\command\mkinit.bat
	tckDevTools_V6R2021x_B423 2023/03/10-00:20:45 local
		Windows NT: C:\Program Files\Dassault Systemes\T423\win_b64\code\command\tckDevTools_init.bat
	CSC_V6R2021x_B423 2023/03/10-00:20:45 local
		Windows NT: C:\Program Files\Dassault Systemes\T423\win_b64\code\command\mkcsinit.bat
	
	```

