---
title: WinSW设置任意程序开机自启动
tags:
  - Windows
  - WinSW
categories:
  - Windows
  - WinSW
abbrlink: fe9c77db
date: 2022-09-30 20:26:10
hidden:
---

# 背景

在使用Windows系统时，会遇到希望有些软件（比如软件A）能够在开机后自动运行的情况，往往可惜的是软件A并不具备配置开机自启的功能。

<!-- more -->

我曾经使用过两种方法来实现这样的功能：

一、[在 Windows 10 中添加在启动时自动运行的应用](https://support.microsoft.com/zh-cn/windows/%E5%9C%A8-windows-10-%E4%B8%AD%E6%B7%BB%E5%8A%A0%E5%9C%A8%E5%90%AF%E5%8A%A8%E6%97%B6%E8%87%AA%E5%8A%A8%E8%BF%90%E8%A1%8C%E7%9A%84%E5%BA%94%E7%94%A8-150da165-dcd9-7230-517b-cf3c295d89dd)

写一个启动软件A的`start_program_A.bat`文件，然后将这个`bat`文件添加到`Windows的启动`目录`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`这个目录下。但是这个方法有个问题是，在开机后有些软件会需要`UAC`权限，后来有找到一个软件[UACWhitelistTool](https://github.com/XIU2/UACWhitelistTool)，先用其创建一个不需要`UAC`权限的软件A的快捷方式，然后在写一个启动这个快捷方式的`start_program_A_ink.bat`文件，然后再将其添加到`Windows的启动`目录下。总的来说还是有点麻烦的。

二、Windows计划任务

# WinSW(Windows Service Wrapper)的使用

后来发现一个更容易的方式，就是借助[WinSW](https://github.com/winsw/winsw)这个软件。

根据其GitHub上的介绍，WinSW能够将任意软件注册成一个Windows服务。

## 下载WinSW

在该项目[GitHub Releases](https://github.com/winsw/winsw/releases)下载`WinSW-x64.exe`并重命名成`winsw.exe`方便后续使用。

## 编写配置文件`winsw.xml`

配置格式模板：

```xml
<service>
  <id>jenkins</id>
  <name>Jenkins</name>
  <description>This service runs Jenkins continuous integration system.</description>
  <env name="JENKINS_HOME" value="%BASE%"/>
  <executable>java</executable>
  <arguments>-Xrs -Xmx256m -jar "%BASE%\jenkins.war" --httpPort=8080</arguments>
  <log mode="roll"></log>
</service>
```

我是希望开机自启`frpc`，使得我的电脑在开机后连上自建`frps`实现内网穿透，配置如下：

```xml
<service>
    <id>frp</id>
    <name>frpc(powered by WinSW)</name>
    <description>frp remote control</description>
    <executable>frpc</executable>
    <arguments>-c frpc.ini</arguments>
    <logmode>reset</logmode>
</service>
```

## 注册为服务

先将需要开机启动的软件、`winsw.exe`和`winsw.xml`文件放在一个文件目录下，然后在目录处打开`Windows PowerShell`运行如下命令进行安装

```powershell
./winsw.exe install
```

![任务管理器——服务——frp服务](image-20221001150729071.png)

然后重启电脑，该服务就会自行启动，也可以按照后面的命令手动启动该服务

![任务管理器——服务——frp服务](image-20221001151119711.png)

### 其他常用命令

立即启动

```powershell
./winsw.exe start
```

停止

```powershell
./winsw.exe stop
```

卸载

```powershell
./winsw.exe uninstall
```

#  参考

WinSW项目GitHub地址

> https://github.com/winsw/winsw

用winsw让任何Windows程序都能运行为服务

> https://www.jianshu.com/p/fc9e4ea61e13

WinSW(Windows service wrapper)开机自启动nginx配置

> https://www.jianshu.com/p/1097649fb6ce
