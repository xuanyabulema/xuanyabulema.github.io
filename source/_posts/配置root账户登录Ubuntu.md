---
title: 配置root账户登录Ubuntu
date: 2021-11-26 08:50:06
categories: 
- Linux
- Ubuntu
tags: Ubuntu
---

# 配置root登录Ubuntu流程

1、设置root密码：`sudo passwd`  

2、重启  

3、配置`sshd_config`文件`sudo vi /etc/ssh/sshd_config`

```shell
PermitRootLogin yes #（默认为#PermitRootLogin prohibit-password）
```

4、重启服务器 service ssh restart

