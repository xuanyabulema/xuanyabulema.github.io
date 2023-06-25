---
title: Windows 网络重置
tags:
  - Windows
date: 2023-06-25 18:45:20
categories:
  - Windows
hidden:
---

# 前言

记录一些 Windows 网络重置相关的内容。

个人常用，使用管理员权限下的 powershell 运行：

```powershell
netsh int ip reset; netsh winsock reset; ipconfig /flushdns
```

<!-- more -->

# 使用系统自带的网络重置

## Win11

设置——网络和 Internet ——高级选项设置——网络重置

## Win10

设置——网络和 Internet ——状态——网络重置

# 使用命令

## 清理 NDS 缓存

```powershell
ipconfig /flushdns
```

## 重置 Winsock 目录

```powershell
netsh winsock reset
```

# 重置 TCP/IP 网络协议栈的配置

```powershell
netsh int ip reset
```

