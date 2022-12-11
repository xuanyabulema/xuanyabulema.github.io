---
title: Hexo安装日志
categories:
  - Hexo
tags:
  - Hexo
  - Ubuntu
  - GitHub
  - NexT
abbrlink: 5d64f657
date: 2021-11-26 07:39:29
hidden:
---

# 在Ubuntu server 20.04LTS上安装Hexo

## 建议先用`su`切换为管理员账户，或用root账户登录

这样子后续需要`sudo`的地方就不需要在打了，而且全程`su`能避免不必要的错误。

<a href="{% post_path '个人腾讯云轻量应用服务器基础配置' %}#启用root用户登录">启用root用户登录</a>

## Hexo简介

[Hexo](https://hexo.io/zh-cn/docs/) 是一个快速、简洁且高效的框架。Hexo 使用 [Markdown](https://www.zhihu.com/topic/19590742/hot)（或其他渲染引擎）解析文章，在几秒内，即可利用靓丽的主题生成静态网页。

>[Hexo中文文档](https://hexo.io/zh-cn/docs/)

<!-- more -->

## Hexo安装

### 安装前提一：安装git

```shell
sudo apt-get install git-core
```

### 安装前提二：安装Nodejs

>[安装Nodejs](https://github.com/nodesource/distributions#deb)

```shell
# Using Ubuntu
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
```

验证安装结果：

```shell
node -v 
npm -v
```

**可安装cnpm替代npm，从而使用国内的淘宝源（可选）**

```shell
npm install -g cnpm --registry=https://registry.npm.taobao.org
```

此安装方式，npm和cnpm不冲突，都可使用。

### 正式安装Hexo

```shell
sudo npm install -g hexo-cli 
```

可使用`cnpm`代替安装`sudo cnpm install -g hexo-cli `。

验证安装结果：

```shell
hexo -v
```



## 新建一个Blog

### 创建Blog存放目录并进行初始化

```shell
mkdir blog # 新建一个目录，来保存blog文件，出问题删除该文件夹即可进行重建
cd blog 
sudo hexo init # 初始化
```

### 启动并预览

```shell
sudo hexo s
```

在浏览器输入`ip:4000`即可查看

`ip`为你搭建Hexo的系统的ip地址，以我为例，即我的Ubuntu系统ip

### 新建一片文章

```shell
sudo hexo n "新的文章"
```

会在你建立的`your_blog_directory`路径下的`/source/_posts/`里创建`新的文章.md`，便可用[Markdown](https://daringfireball.net/projects/markdown/syntax)写文章了

以我为例`新的文章.md`在目录`blog/source/_posts/`下

### 添加文章后清除缓存文件并重新生成静态文件

```shell
sudo hexo clean && sudo hexo g
```

# Hexo配置

在 Hexo 中有两份主要的配置文件，其名称都是` _config.yml`。 其中，一份位于站点根目录下，主要包含 Hexo 本身的站点配置；另一份位于主题目录下，这份配置由主题作者提供，主要用于配置主题相关的选项。

```
/hexo/_config.yml
/hexo/themes/next/_config.yml
```

>[Hexo-Next 主题个性化配置超详细，超全面(两万字)](https://blog.csdn.net/as480133937/article/details/100138838)

## Hexo基础配置

### 作者、语言、时区等设置

```yaml
# Site
title: 悬崖不勒马的小站
subtitle: ''
description: ''
keywords:
author: 悬崖不勒马
language: zh-CN
timezone: Asia/Shanghai

# URL
## Set your site url here. For example, if you use GitHub Page, set url as 'https://username.github.io/project'
url: https://xuanyabulema.github.io
```



## 修改并配置Hexo主题——NexT主题

### 替换主题

以我安装[NexT](https://github.com/next-theme/hexo-theme-next)主题为例

### 版本

在 [【必读】更新说明及常见问题](https://github.com/next-theme/hexo-theme-next/issues/4) 中有相关说明，NexT 一共有三个不同的仓库：

| 版本            | 年份        | 仓库                                          |
| --------------- | ----------- | --------------------------------------------- |
| v5.1.4 或更低   | 2014 ~ 2017 | https://github.com/iissnan/hexo-theme-next    |
| v6.0.0 ~ v7.8.0 | 2018 ~ 2019 | https://github.com/theme-next/hexo-theme-next |
| v8.0.0 或更高   | 2020        | https://github.com/next-theme/hexo-theme-next |

旧的仓库基本上已经不再更新，因此推荐选择最新的 https://github.com/next-theme/hexo-theme-next仓库的 NexT 主题

```shell
cd blog
git clone https://github.com/theme-next/hexo-theme-next themes/next # next 7
git clone https://github.com/next-theme/hexo-theme-next themes/next # next 8
```

更改主题，修改站点配置文件`_config.yml`，找到如下代码：

```yaml
## Themes: https://hexo.io/themes/
theme: landscape
```

将`theme: landscape`改为

```yaml
theme: next
```

### 设置头像

>https://theme-next.iissnan.com/getting-started.html#avatar-setting

编辑 **主题配置文件**

修改字段 `avatar`， 值设置成头像的链接地址。其中，头像的链接地址可以是：

| 地址             | 值                                                           |
| :--------------- | :----------------------------------------------------------- |
| 完整的互联网 URI | `http://example.com/avatar.png`                              |
| 站点内的地址     | 将头像放置主题目录下的 source/uploads/ （新建 uploads 目录若不存在）<br>配置为：avatar: /uploads/avatar.png<br>或者 放置在 source/images/ 目录下<br>配置为：avatar: /images/avatar.png |

### 设置网站的图标Favicon

把图标放在`/themes/next/source/images`里，并且修改主题配置文件_config.yml：

```yaml
favicon:
  small: /images/favicon_16x16.ico
  medium: /images/favicon_32x32.ico
  #apple_touch_icon: /images/apple-touch-icon-next.png
  #safari_pinned_tab: /images/logo.svg
  #android_manifest: /images/manifest.json
  #ms_browserconfig: /images/browserconfig.xml
```



### 添加分类界面

> [Hexo添加分类及标签（在Next主题下）](https://tohugo.com/2021/01/26/%E5%B7%A5%E5%85%B7%E9%85%8D%E7%BD%AE/Hexo%E6%B7%BB%E5%8A%A0%E5%88%86%E7%B1%BB%E5%8F%8A%E6%A0%87%E7%AD%BE%EF%BC%88%E5%9C%A8Next%E4%B8%BB%E9%A2%98%E4%B8%8B%EF%BC%89/)

#### 新建分类界面

```shell
hexo new page categories
```

成功后会提示：

```shell
INFO  Created: ~/blog/source/categories/index.md
```

这样就创建了分类页面，但是这个时候主题还不会识别这个页面为分类页，需要编辑这个新建的页面，让主题识别这个页面，并自动为这个页面显示分类。

修改`index.md`为：

```shell
---
title: 文章分类
date: 2021-01-25 22:37:25
type: "categories"
---
```

#### 修改主题配置文件

在`themes/next/_config.yml`，找到如下代码：

```yaml
menu:
  home: / || home
  #about: /about/ || user
  #tags: /tags/ || tags
  #categories: /categories/ || th
  archives: /archives/ || archive
  #schedule: /schedule/ || calendar
  #sitemap: /sitemap.xml || sitemap
  #commonweal: /404/ || heartbeat
```

把 categories 前面的 # 删除，因为默认页面是没有标签界面与分类界面，所以需要我们手动创建添加。

#### 给文章添加分类信息

```markdown
---
title: Hexo安装日志
date: 2021-11-26 07:39:29
categories: 
- 折腾
- Hexo
tags: [Hexo,ubuntu]
---
```

如上设置二级分类则该篇文章为 折腾分类下的 Hexo分类下。

### 添加标签界面

同分类界面，类似的

#### 新建标签界面

```shell
hexo new page tags
```

修改`index.md`为：

```shell
---
title: 标签
date: 2021-01-25 22:37:25
type: "tags"
---
```

#### 修改主题配置文件

在`themes/next/_config.yml`，找到如下代码：

```yaml
menu:
  home: / || home
  #about: /about/ || user
  #tags: /tags/ || tags
  #categories: /categories/ || th
  archives: /archives/ || archive
  #schedule: /schedule/ || calendar
  #sitemap: /sitemap.xml || sitemap
  #commonweal: /404/ || heartbeat
```

把 tags 前面的 # 删除

#### 给文章添加标签信息

```markdown
---
title: Hexo安装日志
date: 2021-11-26 07:39:29
categories: 
- 折腾
- Hexo
tags: [Hexo,ubuntu]
---
```

则标签为"Hexo"和"ubuntu"

### 添加关于页面

```shell
hexo new page "about"
```

在`themes/next/_config.yml`，找到如下代码：

```yaml
menu:
  home: / || home
  #about: /about/ || user
  #tags: /tags/ || tags
  #categories: /categories/ || th
  archives: /archives/ || archive
  #schedule: /schedule/ || calendar
  #sitemap: /sitemap.xml || sitemap
  #commonweal: /404/ || heartbeat
```

把about前面的 # 删除

编辑`source/about/`目录中的`index.md`文件即可



## 配置Markdown与Typora搭配添加图片

>[hexo中如何插入图片](https://juejin.cn/post/6882619951857811469)

安装插件：

```shell
sudo npm install hexo-renderer-marked
```

修改`_config.yaml`站点配置文件：

```yaml
post_asset_folder: true
marked:
  prependRoot: true
  postAsset: true
```

当该配置被应用后，使用`hexo new`命令创建新文章时，会生成相同名字的文件夹，也就是文章资源文件夹。

修改Typora配置

![Typora设置——图像](image-20211126143949809.png)

如复制网络路径的图片`https://...../image.jpg`粘贴到Typora中叫`文章名`的文章后，图片会自动变为`![](文章名/image.jpg)`。

但我们知道部署后，文件路径是不同的，所以当我们插入完所有的图片后，我们还需要删除每个图片路径中的`文件名/`。不慌，也很简单。

在Typora编辑器中，使用`<C-f>`快捷键，将所有的`文章名/`替换为空即可删除。

![Typora替换](image-20211126144204257.png)

## 浏览页面显示当前浏览进度

打开 `themes/next/_config.yml`，搜索关键字 `scrollpercent`，把 `false` 改为 `true`。

## Local Search本地搜索

安装插件`hexo-generator-searchdb`

```shell
npm install hexo-generator-searchdb --save
```

修改`_config.yml`站点配置文件，新增以下内容到任意位置：

```yaml
search:
path: search.xml
field: post
format: html
limit: 10000
```

编辑  `themes/next/_config.yml`，启用本地搜索功能：

```yaml
# Local search
local_search:
enable: true
```

## 增加文章字数统计及阅读时常功能

>https://github.com/theme-next/hexo-symbols-count-time

安装插件`hexo-symbols-count-time`,执行以下命令:

```shell
npm install hexo-symbols-count-time
```

修改`_config.yml`站点配置文件

```yaml
symbols_count_time:
  symbols: true
  time: true
  total_symbols: true
  total_time: true
  exclude_codeblock: false
  awl: 4
  wpm: 275
  suffix: "mins."
```

字数统计严重不对，感觉统计的是字符数

## 添加阅读全文

>https://theme-next.iissnan.com/faqs.html#read-more

将下述内容添加到项添加的范围即可

```
<!-- more -->
```

## 加上妹子

> https://blog.csdn.net/as480133937/article/details/100138838#t26

```shell
npm install -save hexo-helper-live2d
```

然后在`_config.yml`中添加参数

```yaml
live2d:
  enable: true
  scriptFrom: local
  pluginRootPath: live2dw/
  pluginJsPath: lib/
  pluginModelPath: assets/
  tagMode: false
  log: false
  model:
    use: live2d-widget-model-<你喜欢的模型名字>
  display:
    position: right
    width: 150
    height: 300
  mobile:
    show: true
```

在站点目录下建文件夹`live2d_models`，

再在`live2d_models`下建文件夹`<你喜欢的模型名字>`,

再在`<你喜欢的模型名字>`下建`json`文件：`<你喜欢的模型名字>.model.json`

最后安装

```shell
npm install --save live2d-widget-model-<你喜欢的模型名字>
```

## 设置文章模板

>[hexo文章模板设置](https://shmilybaozi.github.io/2018/11/05/hexo%E6%96%87%E7%AB%A0%E6%A8%A1%E6%9D%BF%E8%AE%BE%E7%BD%AE/)

模板文件信息位于`./scaffold `文件夹下的 `post.md` 和 `draft.md`

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

## 添加备案号

修改主题配置文件`_config.yml`

参考修改如下

```yaml
# Beian ICP and gongan information for Chinese users. See: https://beian.miit.gov.cn, http://www.beian.gov.cn
  beian:
    enable: true
    icp: 浙ICP备2022000215号-1
    # The digit in the num of gongan beian.
    gongan_id: 
    # The full num of gongan beian.
    gongan_num: 
    # The icon for gongan beian. See: http://www.beian.gov.cn/portal/download
    gongan_icon_url: /images/beian_logo.png
```

## 让Google搜索到GitHub上的个人博客

安装扩展

```shell
npm install hexo-generator-sitemap --save
```

配置站点`_config.yml`文件

```yaml
# 自动生成sitemap
sitemap:
  path: sitemap.xml
```




# 部署Hexo到GitHub

## 生成ssh key以配置和使用GitHub

```shell
sudo ssh-keygen -t rsa -C "XXXX@email.com"
```

以我的为例

```shell
sudo ssh-keygen -t rsa -C "xuanyabulema@qq.com"
```

[查看秘钥并添加至GitHub](https://docs.github.com/cn/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

```shell
cat .ssh/id_rsa.qub
```

然后将`cat`获取到的结果存至GitHub

验证是否连接成功

```shell
ssh -T git@github.com
```

![shell](image-20211126124826456.png)

## 安装插件

```shell
sudo npm install --save hexo-deployer-git
```

## 新建一个GitHub仓库来保存网页

格式为`<你的 GitHub 用户名>.github.io`

![GitHub仓库保存网页](image-20211126125502218.png)

## 修改`_config.yml`

修改末尾为

```yaml
deploy:
  type: git
  repo: 创建的仓库地址
  branch: 创建的仓库地址的默认分支
```

以我的为例子

```yaml
deploy:
  type: git
  repo: git@github.com:xuanyabulema/xuanyabulema.github.io.git
  branch: master
```

## 推送到GitHub

```shell
sudo hexo clean && sudo hexo d
```

浏览器输入`<你的 GitHub 用户名>.github.io`，即可访问

欢迎访问我的`xuanyabulema.github.io`

## 一个坑

### `err: Error: Spawn failed`

如果用非root用户`ssh-keygen -t rsa -C "XXXX@email.com"`，创建将会可以连接的上GitHub，但是在`hexo d`部署到GitHub时总是失败。

```shell
Please make sure you have the correct access rights
and the repository exists.
FATAL {
  err: Error: Spawn failed
      at ChildProcess.<anonymous> (/home/zekuan/blog/node_modules/hexo-util/lib/spawn.js:51:21)
      at ChildProcess.emit (node:events:390:28)
      at Process.ChildProcess._handle.onexit (node:internal/child_process:290:12) {
    code: 128
  }
} Something's wrong. Maybe you can find the solution here: %s https://hexo.io/docs/troubleshooting.html
```

### [解决方式](https://bababadboy.github.io/2017/07/15/%E8%BF%9B%E9%80%80%E4%B8%A4%E9%9A%BE-%E7%94%A8%E6%88%B7%E6%9D%83%E9%99%90%E4%B8%8E%E6%AE%B5%E9%94%99%E8%AF%AF/)

删除当前已有的`.ssh/`下的文件

使用

```shell
sudo ssh-keygen -t rsa -C "XXXX@email.com"
```

然后将`/root/.ssh/id_rsa.pub`下的秘钥添加至GitHub，并进行重新推送`sudo hexo clean && sudo hexo d`



# 参考链接

[Hexo中文文档](https://hexo.io/zh-cn/docs/)

[安装Nodejs](https://github.com/nodesource/distributions#deb)

[hexo中如何插入图片](https://juejin.cn/post/6882619951857811469)

[Hexo-Next 主题个性化配置超详细，超全面(两万字)](https://blog.csdn.net/as480133937/article/details/100138838)    
