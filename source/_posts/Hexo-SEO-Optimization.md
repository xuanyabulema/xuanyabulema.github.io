---
title: Hexo SEO优化
tags:
  - Hexo
categories:
  - Hexo
abbrlink: 87345d74
date: 2022-12-11 13:48:22
hidden:
---

# 前言

谷歌搜索提示“已发现 - 尚未编入索引”，进行优化

<!-- more -->

![已发现 - 尚未编入索引](image-20221211134956046.png)

> 参考
>
> [GOOGLE 提示 "已发现 - 尚未编入索引" 怎么办](https://www.zhidaow.com/post/google-discovered-but-currently-not-indexed)
>
> [Hexo博客SEO优化，添加robots.txt](https://mikolaje.github.io/2019/hexo_seo.html#comments)

# 配置`robots.txt`

在`hexo`根目录下的 `source` 目录下新建一个`robots.txt`文件，内容如下：

```
# 允许所有用户代理的浏览器爬虫进行访问（爬起数据）
User-agent: *

# 允许访问的内容
Allow: /
Allow: /about/
Allow: /archives/
Allow: /book/
Allow: /categories/
Allow: /microchip/
Allow: /page/
Allow: /posts/
Allow: /surfing/
Allow: /tags/

# 网站地图Sitemap
Sitemap: https://xuanyabulema.github.io/sitemap.xml
Sitemap: https://xuanyabulema.github.io/baidusitemap.xml
Sitemap: https://xuanyabulema.github.io/sitemap.txt
```

# URL优化

> 一般来说，网站的最佳结构是 **用户从首页点击三次就可以到达任何一个页面**，但是`Hexo`编译的是：`域名/年/月/日/文章标题` 这样五层的结构。这样的结构很不利于`SEO`，爬虫会经常爬不到我们的文章，所以我们需要优化一下URL。

## 方案一

```yaml
url: https://xuanyabulema.github.io
# permalink: :year/:month/:day/:title/
permalink: :title.html    # 修改  两层结构
permalink: posts/:title.html    # 修改  三层结构  于 posts/ 下
```

但若文章标题是中文，网址会被转义成一堆特别长的数字符号。

## 方案二

安装插件 `npm install hexo-abbrlink --save`, 使得网站结构变 `域名/posts/xxx.html`

修改站点配置文件：

```yaml
permalink: posts/:abbrlink.html    # 修改
# 上下两行选一                       # 若改完Hexo博客无法显示图片的话换为下一行试试
permalink: posts/:abbrlink/         

# abbrlink config
abbrlink:
  alg: crc32      #support crc16(default) and crc32
  rep: hex        #support dec(default) and hex
  drafts: false   #(true)Process draft,(false)Do not process draft. false(default) 
  # Generate categories from directory-tree
  # depth: the max_depth of directory-tree you want to generate, should > 0
  auto_category:
     enable: true  #true(default)
     depth:        #3(default)
     over_write: false 
  auto_title: false #enable auto title, it can auto fill the title by path
  auto_date: false #enable auto date, it can auto fill the date by time today
  force: false #enable force mode,in this mode, the plugin will ignore the cache, and calc the abbrlink for every post even it already had abbrlink. This only updates abbrlink rather than other front variables.
```

