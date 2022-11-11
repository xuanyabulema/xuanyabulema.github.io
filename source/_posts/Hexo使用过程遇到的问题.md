---
title: Hexo使用过程遇到的问题
date: 2022-10-05 17:12:27
tags:
- Hexo
- bug
categories: 
- Hexo
- bug
hidden:
---

# 前言

对在使用Hexo的过程中遇到的问题进行记录

<!-- more -->

# Hexo一级标题不跳转问题解决

> [hexo文章目录点击不跳转，html没有生成href](https://blog.csdn.net/weixin_45149481/article/details/116794535)

遇到奇怪的问题，点击一级标题竟然无法跳转。按照上面链接说的操作，发现`node_modules`目录下竟然没有`hexo-toc`，于是首先生成该目录

```shell
npm install hexo-toc
```

<!-- more -->

然后修改该目录下的`node_modules\hexo-toc\lib\filter.js`的“28-31行”为如下

```js
$title.attr('id', id);
// $title.children('a').remove();
// $title.html( '<span id="' + id + '">' + $title.html() + '</span>' );
// $title.removeAttr('id');
```

## 版本信息

```
NexT version 8.13.1
Documentation: https://theme-next.js.org
========================================
hexo: 6.3.0
hexo-cli: 4.3.0
os: linux 5.4.0-126-generic Ubuntu 20.04.5 LTS (Focal Fossa)
node: 16.17.1
v8: 9.4.146.26-node.22
uv: 1.43.0
zlib: 1.2.11
brotli: 1.0.9
ares: 1.18.1
modules: 93
nghttp2: 1.47.0
napi: 8
llhttp: 6.0.9
openssl: 1.1.1q+quic
cldr: 41.0
icu: 71.1
tz: 2022a
unicode: 14.0
ngtcp2: 0.1.0-DEV
nghttp3: 0.1.0-DEV
```

# PowerShell无法执行hexo命令

将Hexo环境从GitHub上同步过来后，`npm`命令可用，用`hexo`时却报错

```powershell
hexo : 无法将“hexo”项识别为 cmdlet、函数、脚本文件或可运行程序的名称。请检查名称的拼写，如果包括路径，请确保路径正确，然后再试一次。
```

## 设置用户策略权限

以管理员权限打开`PowerShell`运行以下内容

```powershell
set-executionpolicy remotesigned 
```

![设置用户策略权限](image-20221111180832176.png)

## 重装hexo-cli

在`PowerShell`中输入`npm install -g hexo-cli # -g为全局安装` 再装一遍即可解决

