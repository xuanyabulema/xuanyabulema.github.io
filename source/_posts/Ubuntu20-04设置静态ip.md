---
title: Ubuntu20.04设置静态ip
date: 2022-07-05 20:29:03
tags: [Ubuntu]
categories:
- Ubuntu
hidden:
---

# 前言

Ubuntu 从 `17.10` 开始，已放弃在 `/etc/network/interfaces` 里固定 IP 的配置，`interfaces` 文件不复存在，即使配置也不会生效，而是改成 `netplan` 方式 ，配置写在 `/etc/netplan/00-installer-config.yaml` 或者类似名称的 `yaml` 文件里。

> https://ld246.com/article/1593929878472

<!-- more -->

## 配置静态IP

修改`yaml` 文件

```yaml
network:
  ethernets:
    eth0:   #配置的网卡的名称
      addresses:
      - 192.168.1.4/24  #配置的静态ip地址和掩码
      gateway4: 192.168.1.1
      nameservers:
        addresses: [192.168.1.1]  #DNS服务器地址，多个DNS服务器地址需要用英文逗号分隔开
        search: []
  version: 2
```

使得修改生效

```bash
sudo netplan apply
```

