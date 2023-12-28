---
title: DP Installer
keywords: Installer
desc: teedoc 大小, 第一篇博客
author: designer
date: 2021-03-14
tags: DP
---


```python

#encoding=utf-8

import os,time,sys
import win32com.client as client
import pythoncom
import winshell  
import linecache
import re

# media path
# print(os.path.dirname(os.path.realpath(sys.executable)))
# print(os.path.dirname(os.path.realpath(sys.argv[0])))  
currentpath=os.path.dirname(os.path.realpath(sys.argv[0]))
#print(currentpath)
GApath=currentpath+'\\GT_B27_GA'+'\\WIN64\\StartB'
SPpath=currentpath+'\\GT_B27_SP6'+'\\WIN64\\StartSPKB'
HFpath=currentpath+'\\GT_B27_SP6HF40'+'\\WIN64\\StartHFXB'
DPpath=currentpath+'\\GT_B27_DP'
#install target path
CATInstallTarget='C:\\Program Files\\Dassault Systemes\\B27_GT'
DPInstallpath=CATInstallTarget+''
iconpath= DPInstallpath+'\\GTR5\\win_b64\\resources\\graphic\\icons\\GT_desktop_icon-v1.ico'


def InstallCATIA_GA(GApath):
   
    catGAcmd=GApath+' -u '+ '"' +CATInstallTarget+'"' +' -newdir ' + ' -D ' + '"' +CATInstallTarget+"\\CATEnv"+'"' + ' -ident "GTDP" -all -v -noStartMenuIcon -noStartMenuTools -noDesktopIcon' 
    os.system(catGAcmd)

    print("01-GA|   "+catGAcmd)
    print("CATIA-GA installation is complete! ")

def InstallCATIA_SP(SPpath):
    
    catSPcmd=SPpath+ ' -bC -killprocess -v' + " -u " + '"C:\Program Files\Dassault Systemes\B27_GT" '
    os.system(catSPcmd)

    print("02-SP|   "+catSPcmd)
    print("CATIA-SP installation is complete! ")

def InstallCATIA_HF(HFpath):
   
    catHFCmd=HFpath+ ' -u ' + ' "C:\Program Files\Dassault Systemes\B27_GT" ' + " -killprocess  -v"
    os.system(catHFCmd)
    print("03-HF|   "+catHFCmd)
    print("CATIA-HF installation is complete! ")


def copy_dir(src_path, target_path):
	if os.path.isdir(src_path) and os.path.isdir(target_path):		
		filelist_src = os.listdir(src_path)							
		for file in filelist_src:
			path = os.path.join(os.path.abspath(src_path), file)	
			if os.path.isdir(path):
				path1 = os.path.join(os.path.abspath(target_path), file)	
				if not os.path.exists(path1):						
					os.mkdir(path1)
				copy_dir(path,path1)			
			else:								
				with open(path, 'rb') as read_stream:
					contents = read_stream.read()
					path1 = os.path.join(target_path, file)
					with open(path1, 'wb') as write_stream:
						write_stream.write(contents)
		return 	True	
						
	else:
		return False

def mkdir(path):
    path=path.strip()
    path=path.rstrip("\\")
    isExists=os.path.exists(path)
    if not isExists:
        os.makedirs(path)
        print(path+' Created successfully. ')
        return True
    else:
        print(path+' Directory already exists. ')
        return False



def InstallDP():
    mkdir(DPInstallpath)
    copy_dir(DPpath,DPInstallpath)
    print("Digital Project Copy successfully! ")

#"C:\Program Files\Dassault Systemes\B27\win_b64\code\bin\CATSTART.exe" -run "DigitalProject.exe" -env DigitalProject.V1R5.64 -direnv "D:\001_Apps\GT_DP\APPS\TST\CATEnv" -nowindow

def CreateShortCut():
    
    destDir = winshell.desktop()  
    filename = "Digital Project V1,R5(B27)"  
    target = CATInstallTarget +'\\win_b64\\code\\bin\\CATSTART.exe'
    winshell.CreateShortcut(
        Path = os.path.join(destDir, os.path.basename(filename)+".lnk"),  
        Target =target, 
        Arguments= ' -run ' + '"' +'DigitalProject.exe'+ '"' + ' -env ' +'DigitalProject.V1R5.64' + ' -direnv ' + '"' + DPInstallpath +'\\CATEnv' + '"' + ' -nowindow',
        Icon = (iconpath, 0),  
        Description = "Design, engineering, and fabrication BIM for the world’s most demanding projects")  

def CreateStartShortCut():
    fld = 'C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Digital Project V1,R5(B27)'
    mkdir(fld)
    destDir = fld  
    filename = "Digital Project V1,R5(B27)"  
    target = CATInstallTarget +'\\win_b64\\code\\bin\\CATSTART.exe' 
    winshell.CreateShortcut(  
        Path = os.path.join(destDir, os.path.basename(filename)+".lnk"),  
        Target = target,  
        Arguments= ' -run ' + '"' +'DigitalProject.exe'+ '"' + ' -env ' +'DigitalProject.V1R5.64' + ' -direnv ' + '"' + DPInstallpath +'\\CATEnv' + '"' + ' -nowindow',
        Icon = (iconpath, 0),  
        Description = "Design, engineering, and fabrication BIM for the world’s most demanding projects")

def CreateShortCut_Admin():
    # "C:\Program Files\Gehry Technologies\Digital Project V1,R5\DSB22\win_b64\code\bin\CATSTART.exe" -run "DigitalProject.exe -admin" -env DigitalProject.V1R5.64 -direnv "C:\ProgramData\Gehry Technologies\CATEnv" -nowindow
    fld = 'C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Digital Project V1,R5(B27)'
    mkdir(fld)
    destDir = fld  
    filename = "Digital Project V1,R5(B27) Administrator"  
    target = CATInstallTarget +'\\win_b64\\code\\bin\\CATSTART.exe' 
    winshell.CreateShortcut(
        Path = os.path.join(destDir, os.path.basename(filename)+".lnk"),  
        Target = target,  
        Arguments= ' -run ' + '"' +'DigitalProject.exe -admin'+ '"' + ' -env ' +'DigitalProject.V1R5.64' + ' -direnv ' + '"' + DPInstallpath +'\\CATEnv' + '"' + ' -nowindow',
        Icon = (iconpath, 0),  
        Description = "Design, engineering, and fabrication BIM for the world’s most demanding projects")

def CreateShortCut_cmdCATUTIL():
    # cmdCATUTIL  = '"'+ CATInstallTarget+'\\win_b64\\code\\bin\\CATUTIL.exe' +'"' + ' -env DigitalProject.V1R5.64 -direnv ' + '"' + CATInstallTarget + '\\CATEnv' +'"'
    # print('CMD-A|   '+ cmdCATUTIL)
    fld = 'C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Digital Project V1,R5(B27)\\Tools'
    mkdir(fld)
    destDir = fld  
    filename = "Batch Management V5-6R2017"   
    target = CATInstallTarget +'\\win_b64\\code\\bin\\CATUTIL.exe' 
    winshell.CreateShortcut(  
        Path = os.path.join(destDir, os.path.basename(filename)+".lnk"),  
        Target = target, 
        Arguments=' -env DigitalProject.V1R5.64 -direnv ' + '"' + CATInstallTarget + '\\CATEnv' +'"',        
        Icon = (DPInstallpath+'\\GTR5\\win_b64\\resources\\graphic\\icons\\GT_desktop_icon-v1.ico', 0),  
        Description = "Batch Management V5-6R2017")
    

def CreateShortCut_cmdCATIAENV():
    # cmdCATIAENV = CATInstallTarget+'\\win_b64\\code\\bin\\CATIAENV.exe' + ' -env DigitalProject.V1R5.64 -direnv ' + CATInstallTarget + '\\CATEnv' 
    # print('CMD-B|   '+ cmdCATIAENV)
    fld = 'C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Digital Project V1,R5(B27)\\Tools'
    mkdir(fld)
    destDir = fld  
    filename = "Environment Editor V5-6R2017"  
    target = CATInstallTarget +'\\win_b64\\code\\bin\\CATIAENV.exe'     
    winshell.CreateShortcut(  
        Path = os.path.join(destDir, os.path.basename(filename)+".lnk"),  
        Target = target,  
        Arguments=' -env DigitalProject.V1R5.64 -direnv ' + '"' + CATInstallTarget + '\\CATEnv'+'"',
        Icon = (DPInstallpath+'\\GTR5\\win_b64\\resources\\graphic\\icons\\GT_desktop_icon-v1.ico', 0),  
        Description = "Environment Editor V5-6R2017")    
   
   
def CreateShortCut_cmdDSLicMgt():
    # cmdDSLicMgt = CATInstallTarget+'\\win_b64\\code\\bin\\DSLicMgt.exe' + ' -env DigitalProject.V1R5.64 -direnv ' + CATInstallTarget + '\\CATEnv'  
    # print('CMD-C|   '+ cmdDSLicMgt)
    
    fld = 'C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Digital Project V1,R5(B27)\\Tools'
    mkdir(fld)
    destDir = fld  
    filename = "Nodelock Key Management V5-6R2017"  
    target = CATInstallTarget +'\\win_b64\\code\\bin\\DSLicMgt.exe'     
    winshell.CreateShortcut(  
        Path = os.path.join(destDir, os.path.basename(filename)+".lnk"),  
        Target = target,
        Arguments=' -env DigitalProject.V1R5.64 -direnv ' + '"' + CATInstallTarget + '\\CATEnv'+'"',        
        Icon = (DPInstallpath+'\\GTR5\\win_b64\\resources\\graphic\\icons\\GT_desktop_icon-v1.ico', 0),  
        Description = "Nodelock Key Management V5-6R2017")    
    
    
def CreateShortCut_cmdCATNodelockMgt():
    # cmdCATNodelockMgt = CATInstallTarget+'\\win_b64\\code\\bin\\CATNodelockMgt.exe' + ' -env DigitalProject.V1R5.64 -direnv ' + CATInstallTarget + '\\CATEnv'  
    # print('CMD-D|   '+ cmdCATNodelockMgt)
    
    fld = 'C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Digital Project V1,R5(B27)\\Tools'
    mkdir(fld)
    destDir = fld  
    filename = "Nodelock Key Management V5-6R2017"  
    target = CATInstallTarget +'\\win_b64\\code\\bin\\CATNodelockMgt.exe'  
    winshell.CreateShortcut(  
        Path = os.path.join(destDir, os.path.basename(filename)+".lnk"),  
        Target = target,
        Arguments=' -env DigitalProject.V1R5.64 -direnv ' + '"' + CATInstallTarget + '\\CATEnv'+'"',
        Icon = (DPInstallpath+'\\GTR5\\win_b64\\resources\\graphic\\icons\\GT_desktop_icon-v1.ico', 0),  
        Description = "Nodelock Key Management V5-6R2017")    
    
    
def CreateShortCut_cmdCATPrinterManager():
    # cmdCATPrinterManager = CATInstallTarget+'\\win_b64\\code\\bin\\CATPrinterManager.exe' + ' -env DigitalProject.V1R5.64 -direnv ' + CATInstallTarget + '\\CATEnv' 
    # print('CMD-E|   '+ cmdCATPrinterManager)
    
    fld = 'C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Digital Project V1,R5(B27)\\Tools'
    mkdir(fld)
    destDir = fld  
    filename = "Printers V5-6R2017"  
    target = CATInstallTarget +'\\win_b64\\code\\bin\\CATPrinterManager.exe'   
    winshell.CreateShortcut(
        Path = os.path.join(destDir, os.path.basename(filename)+".lnk"),  
        Target = target,  
        Arguments=' -env DigitalProject.V1R5.64 -direnv ' + '"' + CATInstallTarget + '\\CATEnv'+'"',
        Icon = (DPInstallpath+'\\GTR5\\win_b64\\resources\\graphic\\icons\\GT_desktop_icon-v1.ico', 0),  
        Description = "Printers V5-6R2017")    
    

    
def CreateShortCut_cmdCATOptionsMgt():
    # cmdCATOptionsMgt = CATInstallTarget+'\\win_b64\\code\\bin\\CATOptionsMgt.exe' + ' -env DigitalProject.V1R5.64 -direnv ' + CATInstallTarget + '\\CATEnv'  
    # print('CMD-F|   '+ cmdCATOptionsMgt)  
    
    fld = 'C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Digital Project V1,R5(B27)\\Tools'
    mkdir(fld)
    destDir = fld  
    filename = "Settings Management V5-6R2017"  
    target = CATInstallTarget +'\\win_b64\\code\\bin\\CATOptionsMgt.exe'   
    winshell.CreateShortcut(  
        Path = os.path.join(destDir, os.path.basename(filename)+".lnk"),  
        Target = target,  
        Arguments=' -env DigitalProject.V1R5.64 -direnv ' + '"'+CATInstallTarget + '\\CATEnv'+'"',
        Icon = (DPInstallpath+'\\GTR5\\win_b64\\resources\\graphic\\icons\\GT_desktop_icon-v1.ico', 0),  
        Description = "Settings Management V5-6R2017")    
    
        
def CreateShortCut_cmdCATSoftwareMgt():
    # cmdCATSoftwareMgt = CATInstallTarget+'\\win_b64\\code\\bin\\CATSoftwareMgt.exe' + ' -env DigitalProject.V1R5.64 -direnv ' + CATInstallTarget + '\\CATEnv'   
    # print('CMD-G|   '+ cmdCATSoftwareMgt) 

    fld = 'C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Digital Project V1,R5(B27)\\Tools'
    mkdir(fld)
    destDir = fld  
    filename = "Software Management V5-6R2017"  
    target = CATInstallTarget +'\\win_b64\\code\\bin\\CATSoftwareMgt.exe'   
    winshell.CreateShortcut(  
        Path = os.path.join(destDir, os.path.basename(filename)+".lnk"),  
        Target = target,  
        Arguments= ' -env DigitalProject.V1R5.64 -direnv ' + '"' + CATInstallTarget + '\\CATEnv'+'"',
        Icon = (DPInstallpath+'\\GTR5\\win_b64\\resources\\graphic\\icons\\GT_desktop_icon-v1.ico', 0),  
        Description = "Software Management V5-6R2017")    

      
def CreateShortCut_cmdVaultClientSetup():
    # cmdVaultClientSetup  = CATInstallTarget+'\\win_b64\\code\\bin\\CATSTART.exe' + ' -run VaultClientSetup.EXE -env DigitalProject.V1R5.64 -direnv ' + CATInstallTarget + '\\CATEnv'   
    # print('CMD-H|   '+ cmdVaultClientSetup) 
    fld = 'C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Digital Project V1,R5(B27)\\Tools'
    mkdir(fld)
    destDir = fld  
    filename = "Vault Client Setup V5-6R2017"  
    target = CATInstallTarget +'\\win_b64\\code\\bin\\CATSTART.exe' 
    winshell.CreateShortcut(  
        Path = os.path.join(destDir, os.path.basename(filename)+".lnk"),  
        Target = target,  
        Arguments=' -run VaultClientSetup.EXE -env DigitalProject.V1R5.64 -direnv ' + '"' + CATInstallTarget + '\\CATEnv' +'"' ,
        Icon = (DPInstallpath+'\\GTR5\\win_b64\\resources\\graphic\\icons\\GT_desktop_icon-v1.ico', 0),  
        Description = "Vault Client Setup V5-6R2017")    
            
            
dpenvtxt= DPInstallpath+'\\CATEnv\\DigitalProject.V1R5.64.txt'
#获取指定行内容
def get_line(file, nums_line):
    return linecache.getline(file, nums_line).strip()   

print(get_line(dpenvtxt,9))
print(get_line(dpenvtxt,10))
    
    

#InstallCATIA(GApath,SPpath,HFpath)
InstallCATIA_GA(GApath)
InstallCATIA_SP(SPpath)
InstallCATIA_HF(HFpath)

InstallDP()
CreateShortCut()
CreateStartShortCut()
CreateShortCut_Admin()

CreateShortCut_cmdCATUTIL()
CreateShortCut_cmdCATIAENV()
CreateShortCut_cmdCATNodelockMgt()
CreateShortCut_cmdCATPrinterManager()
CreateShortCut_cmdCATSoftwareMgt()
CreateShortCut_cmdDSLicMgt()
CreateShortCut_cmdVaultClientSetup()
CreateShortCut_cmdCATOptionsMgt()

print("Digital Project installation is complete! ")
time.sleep(3)


#"C:\Program Files\Dassault Systemes\B27\win_b64\code\bin\CATSTART.exe" -run "CNEXT.exe" -env DigitalProject.V1R6.64 -direnv "%~dp0\CATEnv" -nowindow
#"C:\Program Files\Dassault Systemes\B27\win_b64\code\bin\CATSTART.exe" -run "DigitalProject.exe" -env DigitalProject.V1R5.64 -direnv "D:\001_Apps\GT_DP\APPS\TST\CATEnv" -nowindow

#"C:\Program Files\Dassault Systemes\B22\win_b64\code\bin\CATUTIL.exe"  -env CATIA_P3.V5-6R2012.B22 -direnv "C:\ProgramData\DassaultSystemes\CATEnv" 
#"C:\Program Files\Dassault Systemes\B22\win_b64\code\bin\CATIAENV.exe"  -env CATIA_P3.V5-6R2012.B22 -direnv "C:\ProgramData\DassaultSystemes\CATEnv" 
#"C:\Program Files\Dassault Systemes\B22\win_b64\code\bin\DSLicMgt.exe"  -env CATIA_P3.V5-6R2012.B22 -direnv "C:\ProgramData\DassaultSystemes\CATEnv" 
#"C:\Program Files\Dassault Systemes\B22\win_b64\code\bin\CATNodelockMgt.exe"  -env CATIA_P3.V5-6R2012.B22 -direnv "C:\ProgramData\DassaultSystemes\CATEnv" 
#"C:\Program Files\Dassault Systemes\B22\win_b64\code\bin\CATPrinterManager.exe"  -env CATIA_P3.V5-6R2012.B22 -direnv "C:\ProgramData\DassaultSystemes\CATEnv" 
#"C:\Program Files\Dassault Systemes\B22\win_b64\code\bin\CATOptionsMgt.exe"  -env CATIA_P3.V5-6R2012.B22 -direnv "C:\ProgramData\DassaultSystemes\CATEnv" 
#"C:\Program Files\Dassault Systemes\B22\win_b64\code\bin\CATSoftwareMgt.exe"  -env CATIA_P3.V5-6R2012.B22 -direnv "C:\ProgramData\DassaultSystemes\CATEnv" 
#"C:\Program Files\Dassault Systemes\B22\win_b64\code\bin\CATSTART.exe"  -run VaultClientSetup.EXE -env CATIA_P3.V5-6R2012.B22 -direnv "C:\ProgramData\DassaultSystemes\CATEnv" -nowindow

```
