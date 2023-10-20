
# 自定义CATIA启动方式

- 使用自定义CATIA 启动的方式的好处是可以加载更多的CAA开发插件，下面的环境变量支持7个插件的一次性部署；
- 环境变量的位置就放在与catia.bat同级别下的CATEnv文件夹，方便管理；

=== "catia.bat"

    ```batch

    @echo off

    cd /d %~dp0

    REM ============================================================================================
    REM CATIA 3DEXPERIENCE installation path
    REM ============================================================================================

    set CATPath1=C:\XUS\APP\DS\B27_GT\GTR4
    set CATPath2=C:\XUS\APP\DS\B27_GT\GTR5
    set CATPath3=%~dp0
    set CATPath4=
    set CATPath5=
    set CATPath6=

    REM ============================================================================================
    REM Start of CATIA
    REM ============================================================================================
    :CATIA
    "%CATPath1%\win_b64\code\bin\CATSTART.exe" -run "CNEXT.exe" -env Env7 -direnv "%~dp0\CATEnv" -nowindow
    :Tools
    REM "%CAT_CODE%\win_b64\code\bin\CATUTIL.exe"  -env Env7 -direnv "%~dp0\CATEnv"
    REM "%CAT_CODE%\win_b64\code\bin\CATIAENV.exe"  -env Env7 -direnv "%~dp0\CATEnv"
    REM "%CAT_CODE%\win_b64\code\bin\DSLicMgt.exe"  -env Env7 -direnv "%~dp0\CATEnv"
    REM "%CAT_CODE%\win_b64\code\bin\CATNodelockMgt.exe"  -env Env7 -direnv "%~dp0\CATEnv"
    REM "%CAT_CODE%\win_b64\code\bin\CATPrinterManager.exe"  -env Env7 -direnv "%~dp0\CATEnv"
    REM "%CAT_CODE%\win_b64\code\bin\CATOptionsMgt.exe"  -env Env7 -direnv "%~dp0\CATEnv"
    REM "%CAT_CODE%\win_b64\code\bin\CATSoftwaREMgt.exe"  -env Env7 -direnv "%~dp0\CATEnv"
    REM "%CAT_CODE%\win_b64\code\bin\CATSTART.exe"  -run VaultClientSetup.EXE -env Env7 -direnv "%~dp0\CATEnv" -nowindow

    ```

=== "CATEnv"

    ```batch

    !----------------------------------------------------------
    !   DASSAULT SYSTEMES  -  V5 ENVIRONMENT FILE
    !----------------------------------------------------------
    ! MODE : User
    ! TYPE : CATIA_P3
    ! TMSTMP : 1656736355
    ! ARGS : -icon no -menu no -desktop no -cs CATIA_P3 -a user 
    !----------------------------------------------------------
    GTCProjectStandards=%CATPath2%\Project Standards
    GTCProjectData=%CATPath2%\Project Data
    GTCUserData=CSIDL_APPDATA\DassaultSystemes

    CATInstallPath=%CATPath7%\win_b64;%CATPath6%\win_b64;%CATPath5%\win_b64;%CATPath4%\win_b64;%CATPath3%\win_b64;%CATPath2%\win_b64;%CATPath1%\win_b64
    CATDLLPath=%CATPath7%\win_b64\code\bin;%CATPath6%\win_b64\code\bin;%CATPath5%\win_b64\code\bin;%CATPath4%\win_b64\code\bin;%CATPath3%\win_b64\code\bin;%CATPath2%\win_b64\code\bin;%CATPath1%\win_b64\code\bin
    CATICPath=%CATPath7%\win_b64\code\productIC;%CATPath6%\win_b64\code\productIC;%CATPath5%\win_b64\code\productIC;%CATPath4%\win_b64\code\productIC;%CATPath3%\win_b64\code\productIC;%CATPath2%\win_b64\code\productIC;%CATPath1%\win_b64\code\productIC
    CATCommandPath=%CATPath7%\win_b64\code\command;%CATPath6%\win_b64\code\command;%CATPath5%\win_b64\code\command;%CATPath4%\win_b64\code\command;%CATPath3%\win_b64\code\command;%CATPath2%\win_b64\code\command;%CATPath1%\win_b64\code\command
    CATDictionaryPath=%CATPath7%\win_b64\code\dictionary;%CATPath6%\win_b64\code\dictionary;%CATPath5%\win_b64\code\dictionary;%CATPath4%\win_b64\code\dictionary;%CATPath3%\win_b64\code\dictionary;%CATPath2%\win_b64\code\dictionary;%CATPath1%\win_b64\code\dictionary
    CATDocView=%CATPath7%\win_b64\doc;%CATPath6%\win_b64\doc;%CATPath5%\win_b64\doc;%CATPath4%\win_b64\doc;%CATPath3%\win_b64\doc;%CATPath2%\win_b64\doc;%CATPath1%\win_b64\doc
    CATReffilesPath=%CATPath7%\win_b64\reffiles;%CATPath6%\win_b64\reffiles;%CATPath5%\win_b64\reffiles;%CATPath4%\win_b64\reffiles;%CATPath3%\win_b64\reffiles;%CATPath2%\win_b64\reffiles;%CATPath1%\win_b64\reffiles
    CATFontPath=%CATPath7%\win_b64\resources\fonts;%CATPath6%\win_b64\resources\fonts;%CATPath5%\win_b64\resources\fonts;%CATPath4%\win_b64\resources\fonts;%CATPath3%\win_b64\resources\fonts;%CATPath2%\win_b64\resources\fonts;%CATPath1%\win_b64\resources\fonts
    CATGalaxyPath=%CATPath7%\win_b64\resources\galaxy;%CATPath6%\win_b64\resources\galaxy;%CATPath5%\win_b64\resources\galaxy;%CATPath4%\win_b64\resources\galaxy;%CATPath3%\win_b64\resources\galaxy;%CATPath2%\win_b64\resources\galaxy;%CATPath1%\win_b64\resources\galaxy
    CATGraphicPath=%GTCProjectStandards%\customstartup\Dictionaries;%GTCProjectStandards%\customstartup\Dictionaries\icons;%GTCProjectStandards%\startup\Dictionaries;%GTCProjectStandards%\startup\Dictionaries\icons;%CATPath7%\win_b64\resources\graphic;%CATPath7%\win_b64\resources\graphic\icons;%CATPath7%\win_b64\resources\graphic\figures;%CATPath7%\win_b64\resources\graphic\splashscreens;%CATPath7%\win_b64\resources\graphic\symbols;%CATPath7%\win_b64\resources\graphic\textures;%CATPath6%\win_b64\resources\graphic;%CATPath6%\win_b64\resources\graphic\icons;%CATPath6%\win_b64\resources\graphic\figures;%CATPath6%\win_b64\resources\graphic\splashscreens;%CATPath6%\win_b64\resources\graphic\symbols;%CATPath6%\win_b64\resources\graphic\textures;%CATPath5%\win_b64\resources\graphic;%CATPath5%\win_b64\resources\graphic\icons;%CATPath5%\win_b64\resources\graphic\figures;%CATPath5%\win_b64\resources\graphic\splashscreens;%CATPath5%\win_b64\resources\graphic\symbols;%CATPath5%\win_b64\resources\graphic\textures;%CATPath4%\win_b64\resources\graphic;%CATPath4%\win_b64\resources\graphic\icons;%CATPath4%\win_b64\resources\graphic\figures;%CATPath4%\win_b64\resources\graphic\splashscreens;%CATPath4%\win_b64\resources\graphic\symbols;%CATPath4%\win_b64\resources\graphic\textures;%CATPath3%\win_b64\resources\graphic;%CATPath3%\win_b64\resources\graphic\icons;%CATPath3%\win_b64\resources\graphic\figures;%CATPath3%\win_b64\resources\graphic\splashscreens;%CATPath3%\win_b64\resources\graphic\symbols;%CATPath3%\win_b64\resources\graphic\textures;%CATPath2%\win_b64\resources\graphic;%CATPath2%\win_b64\resources\graphic\icons;%CATPath2%\win_b64\resources\graphic\figures;%CATPath2%\win_b64\resources\graphic\splashscreens;%CATPath2%\win_b64\resources\graphic\symbols;%CATPath2%\win_b64\resources\graphic\textures;%CATPath1%\win_b64\resources\graphic;%CATPath1%\win_b64\resources\graphic\icons;%CATPath1%\win_b64\resources\graphic\figures;%CATPath1%\win_b64\resources\graphic\splashscreens;%CATPath1%\win_b64\resources\graphic\symbols;%CATPath1%\win_b64\resources\graphic\textures
    CATMsgCatalogPath=%GTCProjectStandards%\customstartup\Dictionaries\msgCatalog;%GTCProjectStandards%\startup\Dictionaries\msgCatalog;%CATPath7%\win_b64\resources\msgcatalog;%CATPath6%\win_b64\resources\msgcatalog;%CATPath5%\win_b64\resources\msgcatalog;%CATPath4%\win_b64\resources\msgcatalog;%CATPath3%\win_b64\resources\msgcatalog;%CATPath2%\win_b64\resources\msgcatalog;%CATPath1%\win_b64\resources\msgcatalog
    CATFeatureCatalogPath=%CATPath7%\win_b64\resources\featurecatalog;%CATPath6%\win_b64\resources\featurecatalog;%CATPath5%\win_b64\resources\featurecatalog;%CATPath4%\win_b64\resources\featurecatalog;%CATPath3%\win_b64\resources\featurecatalog;%CATPath2%\win_b64\resources\featurecatalog;%CATPath1%\win_b64\resources\featurecatalog
    CATDefaultCollectionStandard=%GTCProjectStandards%\resources\standard;%CATPath7%\win_b64\resources\standard;%CATPath6%\win_b64\resources\standard;%CATPath5%\win_b64\resources\standard;%CATPath4%\win_b64\resources\standard;%CATPath3%\win_b64\resources\standard;%CATPath2%\win_b64\resources\standard;%CATPath1%\win_b64\resources\standard
    CATKnowledgePath=%GTCProjectStandards%\resources\knowledge;%CATPath7%\win_b64\resources\knowledge;%CATPath6%\win_b64\resources\knowledge;%CATPath5%\win_b64\resources\knowledge;%CATPath4%\win_b64\resources\knowledge;%CATPath3%\win_b64\resources\knowledge;%CATPath2%\win_b64\resources\knowledge;%CATPath1%\win_b64\resources\knowledge
    CATStartupPath=%GTCProjectStandards%\customstartup;%GTCProjectStandards%\startup;%CATPath7%\win_b64\startup;%CATPath6%\win_b64\startup;%CATPath5%\win_b64\startup;%CATPath4%\win_b64\startup;%CATPath3%\win_b64\startup;%CATPath2%\win_b64\startup;%CATPath1%\win_b64\startup
    CATW3ResourcesPath=%CATPath7%\win_b64\docs;%CATPath6%\win_b64\docs;%CATPath5%\win_b64\docs;%CATPath4%\win_b64\docs;%CATPath3%\win_b64\docs;%CATPath2%\win_b64\docs;%CATPath1%\win_b64\docs
    CATReconcilePath=
    CATReferenceSettingPath=%GTCProjectStandards%\customresources\projectsettings;CATSettings\B27
    CATUserSettingPath=CSIDL_APPDATA\DassaultSystemes\CATSettings\R27
    CATCollectionStandard=%GTCProjectStandards%\customresources\standard
    CATTemp=CSIDL_LOCAL_APPDATA\DassaultSystemes\CATTemp
    CATMetasearchPath=DSKEY_TMPDIR
    CATW3PublishPath=DSKEY_TMPDIR
    CATSharedWorkbookPath=DSKEY_TMPDIR
    CATErrorLog=CSIDL_LOCAL_APPDATA\DassaultSystemes\CATTemp\error.log
    CATReport=CSIDL_LOCAL_APPDATA\DassaultSystemes\CATReport
    CATDisciplinePath=%CATPath2%\win_b64\startup\PRMData
    USER_HOME=CSIDL_PERSONAL
    JAVA_HOME=%JAVA_HOME%
    CLASSPATH_JDBC=
    CLASSPATH=%CLASSPATH_JDBC%;%CLASSPATH%
    PATH=%CATPath7%\win_b64\code\bin;%CATPath7%\win_b64\code\command;%CATPath6%\win_b64\code\bin;%CATPath6%\win_b64\code\command;%CATPath5%\win_b64\code\bin;%CATPath5%\win_b64\code\command;%CATPath4%\win_b64\code\bin;%CATPath4%\win_b64\code\command;%CATPath3%\win_b64\code\bin;%CATPath3%\win_b64\code\command;%CATPath2%\win_b64\code\bin;%CATPath2%\win_b64\code\command;%CATPath1%\win_b64\code\bin;%CATPath1%\win_b64\code\command;%JAVA_HOME%\bin;%PATH%
    LM_LICENSE_FILE=%CATPath2%\FlexLMLicense;@FlexLM_License_Server_Name
    GSD_TOOLSOPTION_AUTOEXPANDATOPEN=1
    CAT_DRW_CAA_SECTIONVIEWCREATION=1
    GTCMultiSelectUserMode=FALSE
    GTCIfcAdvancedExportOptions=TRUE
    BreakRunAtEveryPart=1
    GTCMSProjectFilePath=%GTCUserData%\MicrosoftProject;%GTCProjectData%\MicrosoftProject
    GTC3DDWGFilePath=%GTCUserData%\3D-DWG Import With Link;%GTCProjectData%\3D-DWG Import With Link
    GTCExcelDataSheetFilePath=%GTCUserData%\Datasheets;%GTCProjectData%\Datasheets
    CATNoStartDocument=1
    CNEXTOUTPUT=console
    CATVBAPath=%CATPath3%\win_b64\VBScript

    ```
