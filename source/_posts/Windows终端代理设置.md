---
title: Windows终端代理设置
tags:
  - Windows
  - Terminal
categories:
  - Windows
  - Terminal
abbrlink: 99ac490b
date: 2022-11-27 13:45:48
hidden:
---

# PowerShell

> 参考：[在 Windows 终端中设置代理](https://www.yixuju.cn/other/talking-about-proxy/)

## 临时设置

```powershell
$Env:http_proxy="http://127.0.0.1:7890";
$Env:https_proxy="http://127.0.0.1:7890";
```

<!-- more -->

## 永久设置代理

即每次代理 `PowerShell` 窗口时，运行如上命令。

1. 在 `PowerShell` 窗口中运行如下指令：

   ```powershell
   if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
   notepad $PROFILE
   ```

2. 默认会使用记事本打开一个文件，在文件中加入上面设置代理的命令，保存关闭即可。

上面的配置文件在 `此电脑\文档\WindowsPowerShell` 下，文件名为：`Microsoft.PowerShell_profile.ps1`， 这个文件的内容会在 `PowerShell` 的每次运行时使用。（注意不要修改文件位置，除非你明白这样操作的目的）

# cmd

临时设置

```batch
set http_proxy=http://127.0.0.1:7890
set https_proxy=http://127.0.0.1:7890
```

