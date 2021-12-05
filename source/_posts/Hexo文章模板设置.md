---
title: Hexo文章模板设置
date: 2021-11-29 17:05:13
tags: Hexo
categories: 
- 折腾
- Hexo
---

>[hexo文章模板设置](https://shmilybaozi.github.io/2018/11/05/hexo%E6%96%87%E7%AB%A0%E6%A8%A1%E6%9D%BF%E8%AE%BE%E7%BD%AE/)

模板文件信息位于`blog/scaffold `文件夹下的 `post.md` 和 `draft.md`

对应就是 `hexo new [layout] <title>` 中的 `layout` , 默认为 `post`, 草稿为 `draft`, 如果标题包含空格的话，请使用引号括起来。

```markdown
---
title: {{ title }}
date: {{ date }}
tags:
categories:
---


点击阅读前文前, 首页能看到的文章的简短描述

<!-- more -->

```







