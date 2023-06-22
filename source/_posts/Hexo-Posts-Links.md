---
title: Hexo文章跳转（链接）
categories:
  - Hexo
tags:
  - Hexo
abbrlink: 38bd2c25
date: 2022-10-06 21:24:01
hidden:
---

# 前言

> 参考：[hexo 链接到站内文章指定锚点](https://blog.jijian.link/2020-01-08/hexo-anchor-link/#hexo-%E6%A0%87%E9%A2%98%E4%B8%8E-id-%E5%85%B3%E7%B3%BB)

由于我比较懒，对于已经写过的内容，往往不想再赘述任何一点内容。所以我希望有这么一个功能，在我点击后，能够进行跳转，使得我能看到之前写过的内容。

根据分类，存在三种跳转类型

|         种类         |             简单说明             |
| :------------------: | :------------------------------: |
|   当前文章锚点跳转   |    跳转到当前文章的某个标题处    |
|     站内文章跳转     |       跳转到站内的其他文章       |
| 站内其他文章锚点跳转 | 跳转到站内的其他文章的某个标题处 |

<!-- more -->

# `Hexo`标题与`id`关系

Hexo Markdown文章的标题会自动生成对应的`id`，注意：

1、如果标题中间有 `半角空格` 或者 `全角空格` ，空格都会变成连字符，多个空格会合并成一个连字符；

2、大写字母会变成小写字母；

3、多级序号需要去除 `.`

4、`——`等字符去除

## 示例

|              标题              |                id                 |             锚点             |
| :----------------------------: | :-------------------------------: | :--------------------------: |
|     `## 我是一个二级标题`      |      `id="我是一个二级标题"`      |      #我是一个二级标题       |
|     `## 部署Hexo到GitHub`      |      `id="部署hexo到github"`      |      #部署hexo到github       |
|      `## Hello　　World`       |        `id="hello-world"`         |         #hello-world         |
| `修改并配置Hexo主题——NexT主题` | `id="修改并配置hexo主题next主题"` | \#修改并配置hexo主题next主题 |
|     `### 2.3. Github 标题`     |       `id="23-github-标题"`       |       #23-github-标题        |

# 当前文章锚点跳转

使用 Markdown内置的链接方式即可，其中如果有空格，需要把空格换成连字符 `-` ，如下：

```markdown
[跳转到本文的“站内其他文章锚点跳转“章节](#站内其他文章锚点跳转)
```

示例：

[跳转到本文的”站内其他文章锚点跳转“章节](#站内其他文章锚点跳转)



# 站内文章跳转

[官方使用说明](https://hexo.io/zh-cn/docs/tag-plugins#%E5%BC%95%E7%94%A8%E6%96%87%E7%AB%A0)，如下：

```markdown
{% post_link filename [title] [escape] %}
```

即

```markdown
{% post_link 文章文件名（不要后缀） 文章标题（可选） %}
```

示例：跳转到站内之前的文章——Hexo安装日志

{% post_link Hexo-Installation-Log %}



# 站内其他文章锚点跳转

上面的 `post_link` 方式并不支持跳转到站内其他文章锚点，此外有一点不好的是：目前该方式并不能在`Typora`这个`Mrakdown`编辑器中渲染。官方文档还有一个 `post_path` ，用于获取文章路径。

## 方式二

目前可行的方式，使用`HTML`的`a标签`实现，如下：

```markdown
<a href="{% post_path 文章文件名（不要后缀） %}#章节名">显示的文字</a>
```

<a href="{% post_path 文章文件名（不要后缀） %}#章节名">显示的文字</a>

### 注意事项

> `#章节名`处英文字母要全小写，空格要转换为`-`
>
> 锚点格式看示例：[点击跳转到示例](#示例)

举例如下

```markdown
<a href="{% post_path Hexo安装日志 %}#部署hexo到github">点击跳转到“Hexo安装日志”的“部署Hexo到GitHub”章节</a>
```

<a href="{% post_path Hexo-Installation-Log %}#部署hexo到github">点击跳转到“Hexo安装日志”的“部署Hexo到GitHub”章节</a>

```markdown
<a href="{% post_path Hexo安装日志 %}#参考链接">点击跳转到“Hexo安装日志”的“参考链接”章节</a>
```

<a href="{% post_path Hexo-Installation-Log %}#参考链接">点击跳转到“Hexo安装日志”的“参考链接”章节</a>

## 方式一配置未成功

~~方式一：~~

~~结合 markdown 内置的链接方式，即可实现锚点超链接，使用方式如下：~~

```markdown
[跳转到Hexo安装日志的参考链接章节]({% post_path Hexo安装日志 %}#参考链接)
```

[跳转到Hexo安装日志的参考链接章节]({% post_path Hexo安装日志 %}#参考链接)

```markdown
[跳转到Hexo安装日志的参考链接章节]({% post_path ‘Hexo安装日志’ %}#参考链接)
```

[跳转到Hexo安装日志的参考链接章节]({% post_path ‘Hexo安装日志’ %}#参考链接)



