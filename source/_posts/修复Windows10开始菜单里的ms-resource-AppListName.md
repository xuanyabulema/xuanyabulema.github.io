---
title: '修复Windows10开始菜单里的ms-resource:AppListName'
date: 2022-01-24 14:58:51
tags: [Windows,bug]
categories: 
- Windows
---

# 修复Windows10开始菜单里的ms-resource:AppListName

![image-20220124150119917](修复Windows10开始菜单里的ms-resource-AppListName/image-20220124150119917.png)



<!-- more -->

# 解决方式

`ms-resource:AppListName` 的玩意，就是微软的「人脉」App

这两条命令会移除并重新安装「人脉」应用，之后开始菜单里就不再会有恼人的 `ms-resource:AppListName` 了。

```powershell
Get-AppXPackage *microsoft.people* | Remove-AppXPackage

Get-AppXPackage *microsoft.people* -AllUsers | Foreach {Add-AppXPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
```

PS:「人脉」这玩意根本没人用，所以在 Windows 11 里微软已经将其移除了。

搬运参考于下

> [修复 Windows 10 开始菜单里的 ms-resource:AppListName](https://sspai.com/post/67695#!)
