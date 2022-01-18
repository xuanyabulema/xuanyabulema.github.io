---
title: Hexo隐藏文章
date: 2022-01-18 18:19:30
tags: Hexo
categories: Hexo
hidden: true
---



本 Hexo 插件可以隐藏指定的文章，并使它们仅可通过链接访问。

当一篇文章被设置为「隐藏」时，它不会出现在任何列表中（包括首页、存档、分类页面、标签页面、Feed、站点地图等），也不会被搜索引擎索引（前提是搜索引擎遵守 noindex 标签）。

只有知道文章链接的人才可以访问被隐藏的文章。

> https://github.com/prinsss/hexo-hide-posts/blob/master/README_ZH.md

<!-- more -->



# 安装

```shell
npm install hexo-hide-posts --save
```



# 配置

在站点目录下的`_config.yml`中如下配置：

```shell
# hexo-hide-posts
hide_posts:
  # 可以改成其他你喜欢的名字
  filter: hidden
  # 指定你想要传递隐藏文章的位置，比如让所有隐藏文章在存档页面可见
  # 常见的位置有：index, tag, category, archive, sitemap, feed, etc.
  # 留空则默认全部隐藏
  public_generators: []
  # 为隐藏的文章添加 noindex meta 标签，阻止搜索引擎收录
  noindex: true
```



