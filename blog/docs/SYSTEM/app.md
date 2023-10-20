


# 常用软件集合

由于每个app 版本不同，系统不同等因素，希望将同系列app 放在一个文件夹内管理，可以通过以下命令让每个 portable app在自己的文件夹内。

mvapp.bat

```batch
@echo off
title mvapp
echo Please type your app name:
set /p TypeAppName=
md %TypeAppName%
move *%TypeAppName%* %TypeAppName%
```

## APP 

- [git](https://git-scm.com/download/win)
- [FileZilla](https://filezilla-project.org/)
- [7z](https://www.7-zip.org)
- [firefox](https://www.mozilla.org/en-US/firefox/all/#product-desktop-release)
- [free download manager]()
- [neat download manager]()
- [aria2]()
- [xmind]()
- [Everything]()
- [mdbook]()
- [vim]()
- [PowerToys]()

## CAD
- [FreeCAD]()
- [blender]()
## VR
- [EpicInstaller]()
- [Unity]()

## picture
- [captura]()
- [ffmpeg]()
- [Snipaste]()
- [ShareX]()
- [Flameshot]()
- [LosslessCut]()

## net
- [cpolar]()

## editor
- [sublime_text]()

    ```batch
    git clone -b st3 https://github.com/rexdf/ChineseLocalization.git "D:\apps\notepad\sublime\Packages\ChineseLocalization"
    ```
    
- [notepad++]()
- [vs code]()
## code IDE
=== "nodejs"
- [node.js]()

        * npm install hexo-cli -g
            added 59 packages, and audited 60 packages in 13s
            15 packages are looking for funding
            run `npm fund` for details
            found 0 vulnerabilities
        * npm config get prefix
            C:\XUS\100-APPS\apps\node-js\node-v16.18.0-win-x64
        * npm root -g
            C:\XUS\100-APPS\apps\node-js\node-v16.18.0-win-x64\node_modules

- [hugo]()
- [jetbrains]()
- [Visual Studio]()

## terminal
- [tabby]()
- [WindTerm]()
- [MobaXterm](https://mobaxterm.mobatek.net/download-home-edition.html)
- [windows terminal]()
- [powershell]()


## systems

- [redhat](https://developers.redhat.com/products/rhel/download)
- [office-deployment-tool](https://learn.microsoft.com/zh-cn/deployoffice/overview-office-deployment-tool)
- [office-config-tool](https://config.office.com/)

        setup.exe /download downloadconfig.xml
        setup.exe /configure installconfig.xml




