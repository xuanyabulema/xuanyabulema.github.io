---
title: Hexo 常用命令
tags:
  - Hexo
categories:
  - Hexo
date: 2021-12-17 21:42:37
---

## 重新生成 Hexo 网页文件并在本地预览

```shell
hexo clean && hexo g && hexo s
```

## 重新生成 Hexo 网页文件并部署到 Github

```shell
hexo clean && hexo g && hexo d
```

## 同步整个 Hexo 源文件至 Github

```shell
git add -A && git commit -m "Hexo源文件同步" && git push origin 
```

