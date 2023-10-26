---
title: How to Import DP Data in the 3DExp Platform with FBDI
keywords: dp,fbdi,import
desc: teedoc 大小, 第一篇博客
author: designer
date: 2021-03-14
tags: dp,fbdi,import
---



# How to Import DP Data in the 3DExp Platform with FBDI

## Download file

Please download the attached file and refer to the content of the PPT

[PPT Material](How_to_Import_DP_Data_in_the_3DExp\DPtoV6.7z)


- Create an xml file.named  Declaratif.xml

```xml
<CAADataForFBDI>
  <CAAContainers>
    <container Type="GTCAttContainer" DocType="CATPart" Mode="Keep"></container>
    <container Type="GTCAttContainer" DocType="CATProduct" Mode="Remove"></container>

  </CAAContainers>
</CAADataForFBDI>
```

- Copy the 2 following CATFCT files under the following folder of your 3DEXP Install:

    GTCArcCatalog.CATfct
    
    GTCBaseGeometry.CATfct

    
C:\Program Files\Dassault Systemes\B425_Cloud\win_b64\resources\graphic\

![](How_to_Import_DP_Data_in_the_3DExp\pic1.png)

- Add the following variables to the system.

__DBDI_ForceCycleMigration=1__

![](How_to_Import_DP_Data_in_the_3DExp\pic2.0.png)
![](How_to_Import_DP_Data_in_the_3DExp\pic2.png)

- In the Preferences, Activate the following option and select the Folder under which you have the Declaratif xml file.

![](How_to_Import_DP_Data_in_the_3DExp\pic3.png)

![](How_to_Import_DP_Data_in_the_3DExp\pic4.png)

![](How_to_Import_DP_Data_in_the_3DExp\pic5.png)

