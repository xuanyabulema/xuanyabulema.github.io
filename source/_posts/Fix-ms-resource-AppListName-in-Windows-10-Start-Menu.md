---
title: '修复Windows10开始菜单里的ms-resource:AppListName'
tags:
  - Windows
  - bug
categories:
  - Windows
  - bug
date: 2022-01-24 14:58:51
---

# 修复Windows10开始菜单里的ms-resource:AppListName

<!-- more -->

![ms-resource:AppListName](Fix-ms-resource-AppListName-in-Windows-10-Start-Menu/image-20220124150605531.png)

# 解决方式

`ms-resource:AppListName`  是微软的「人脉」App

这两条命令会移除并重新安装「人脉」应用

```powershell
Get-AppXPackage *microsoft.people* | Remove-AppXPackage

Get-AppXPackage *microsoft.people* -AllUsers | Foreach {Add-AppXPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
```

PS:「人脉」这玩意根本没人用，所以在 Windows 11 里微软已经将其移除了。

搬运参考于下

> [修复 Windows 10 开始菜单里的 ms-resource:AppListName](https://sspai.com/post/67695#!)
