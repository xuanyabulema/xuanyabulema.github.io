---
title: VMware Workstation Pro 17 for Windows 开机自启设置
tags:
  - VM
categories:
  - VM
abbrlink: ef4b0f78
date: 2023-02-19 15:57:36
hidden:
---

# 前言

VMware Workstation Pro 17.0 增添了“配置自动启动虚拟机”，但需要进行一些配置才能实现该功能，有些繁琐，可能会在17.1、17.2之类的版本中完善

参考

> [【老湿基】VMware Workstation Pro 17 开机自动启动虚拟机教程](https://www.bilibili.com/video/BV1o8411j7Pr?share_source=copy_web)

<!-- more -->

<img src="image-20230219160623782.png" alt="文件——配置自动启动虚拟机" style="width:40%;" />

# 设置方式

## 修改“VMware 自动启动服务”

当安装完成 VMware Workstation Pro 17.0 后，在 Windows 的服务中可以找到“VMware 自动启动服务”，显示的是手动启动

![修改“VMware 自动启动服务”](image-20230219160934933.png)



修改为如下

|        常规——启动类型——自动，再点击启动        |    登录——此账户——浏览，添加你用的账户    |
| :--------------------------------------------: | :--------------------------------------: |
| ![修改为自动启动](image-20230219161238939.png) | ![添加账户](image-20230219161443748.png) |



## 添加自动启动的虚拟机

以管理员权限运行 VMware Workstation Pro，选择“文件——配置自动启动虚拟机”，勾选需要自启动的虚拟机

![勾选需要自启动的虚拟机](image-20230219162628611.png)
