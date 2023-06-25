---
title: Hexo常用命令
tags:
  - Hexo
categories:
  - Hexo
date: 2021-12-17 21:42:37
---

## 重新生成Hexo网页文件并在本地预览

```shell
hexo clean && hexo g && hexo s
```

## 重新生成Hexo网页文件并部署到Github

```shell
hexo clean && hexo g && hexo d
```

## 同步整个Hexo源文件至Github

```shell
git add -A && git commit -m "Hexo源文件同步" && git push origin 
```

