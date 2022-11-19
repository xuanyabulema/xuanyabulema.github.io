---
title: Hexo渲染数学公式
date: 2022-11-05 18:13:51
tags:
- Hexo
categories:
- Hexo
hidden:
---

# 前言

`Hexo`默认的`Markdown`渲染器是`hexo-renderer-marked`，并不支持`Mathjax`，不支持`emoji`表情，之前为了<a href="{% post_path Hexo站点配置（补充） %}#让hexo博客支持emoji显示">让网页显示emoji</a>, 将渲染器更换为`hexo-renderer-markdown-it`, 最近发现该渲染器也不支持`Mathjax`，为了让网页显示数学公式，再次更换渲染器。

`Hexo`常见的`Markdown`渲染器有：`hexo-renderer-marked`，`hexo-renderer-kramed`，`hexo-renderer-pandoc`，`hexo-renderer-markdown-it`，`hexo-renderer-markdown-it-plus`，其简单对比如下（参考于：[Hexo的多种Markdown渲染器对比分析](https://bugwz.com/2019/09/17/hexo-markdown-renderer/)），

|                            渲染器                            |     Mathjax     | 插件扩展 | emoji表情 |
| :----------------------------------------------------------: | :-------------: | :------: | :-------: |
| [hexo-renderer-marked](https://github.com/hexojs/hexo-renderer-marked) |        ❌        |    ❌     |     ❌     |
| [hexo-renderer-kramed](https://github.com/sun11/hexo-renderer-kramed) |        ✔️        |    ❌     |     ❌     |
| [hexo-renderer-pandoc](https://github.com/wzpan/hexo-renderer-pandoc) |        ✔️        |          |     ❌     |
| [hexo-renderer-markdown-it](https://github.com/hexojs/hexo-renderer-markdown-it) | ✔️（支持不太好） |    ✔️     |     ✔️     |
| [hexo-renderer-markdown-it-plus](https://github.com/CHENXCHEN/hexo-renderer-markdown-it-plus) |        ✔️        |    ✔️     |     ✔️     |

<!-- more -->

# 安装过程

## 卸载已有渲染器

```sh
npm un 渲染器名称 --save
```

以我的为例

```sh
npm un hexo-renderer-markdown-it --save
```

## 安装新渲染器

```sh
npm i hexo-renderer-markdown-it-plus --save
```

配置站点文件`_config.yml`, 添加如下内容

```yaml
markdown_it_plus:
    highlight: true
    html: true
    xhtmlOut: true
    breaks: true
    langPrefix: 
    linkify: true
    typographer: false # 改为false解决“英文的引号会被渲染为中文的引号”的问题
    quotes: “”‘’
    pre_class: highlight
```

配置`Next`主题文件`themes\next\_config.yml`, 启用`mathjax`

```yaml
math:
  # Default (false) will load mathjax / katex script on demand.
  # That is it only render those page which has `mathjax: true` in front-matter.
  # If you set it to true, it will load mathjax / katex script EVERY PAGE.
  every_page: false

  mathjax:
    enable: true
    # Available values: none | ams | all
    tags: none

  katex:
    enable: false
    # See: https://github.com/KaTeX/KaTeX/tree/master/contrib/copy-tex
    copy_tex: false
```

安装自动部署MathJax的[hexo插件](http://catx.me/2014/03/09/hexo-mathjax-plugin/)

```sh
npm install hexo-math --save
```

## 配置成功后公式示例

单行公式

```tex
$$
\nabla\cdot\vec{E} = \frac{\rho}{\epsilon_0}
$$
```


$$
\nabla\cdot\vec{E} = \frac{\rho}{\epsilon_0}
$$
~~多行公式失败~~

```latex
$$
\begin{align}
\nabla\cdot\vec{E} &= \frac{\rho}{\epsilon_0} \\
\nabla\cdot\vec{B} &= 0 \\
\nabla\times\vec{E} &= -\frac{\partial B}{\partial t} \\
\nabla\times\vec{B} &= \mu_0\left(\vec{J}+\epsilon_0\frac{\partial E}{\partial t} \right)
\end{align}
$$
```

$$
\begin{align}
\nabla\cdot\vec{E} &= \frac{\rho}{\epsilon_0} \\
\nabla\cdot\vec{B} &= 0 \\
\nabla\times\vec{E} &= -\frac{\partial B}{\partial t} \\
\nabla\times\vec{B} &= \mu_0\left(\vec{J}+\epsilon_0\frac{\partial E}{\partial t} \right)
\end{align}
$$

## 安装完成后所有npm包

查看命令

```sh
npm list --depth=0
```

输出结果

```
hexo-site@0.0.0 D:\GitHub\Hexo
+-- @waline/hexo-next@3.0.1
+-- bindings@1.5.0 extraneous
+-- file-uri-to-path@1.0.0 extraneous
+-- hexo-baidu-url-submit@0.0.6
+-- hexo-deployer-git@3.0.0
+-- hexo-generator-archive@1.0.0
+-- hexo-generator-baidu-sitemap@0.1.9
+-- hexo-generator-category@1.0.0
+-- hexo-generator-index@2.0.0
+-- hexo-generator-searchdb@1.4.1
+-- hexo-generator-sitemap@3.0.1
+-- hexo-generator-tag@1.0.0
+-- hexo-helper-live2d@3.1.1
+-- hexo-hide-posts@0.2.0
+-- hexo-math@4.0.0
+-- hexo-renderer-ejs@2.0.0
+-- hexo-renderer-markdown-it-plus@1.0.6
+-- hexo-renderer-stylus@2.1.0
+-- hexo-server@3.0.0
+-- hexo-symbols-count-time@0.7.1
+-- hexo-tag-mmedia@1.1.7
+-- hexo-theme-landscape@0.0.3
+-- hexo-toc@1.1.0
+-- hexo@6.3.0
+-- live2d-widget-model-hijiki@1.0.5
+-- markdown-it-emoji@2.0.2
`-- nan@2.17.0 extraneous
```

