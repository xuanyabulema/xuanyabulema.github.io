---
title: 为Hexo文章添加时效性提醒
date: 2022-10-15 20:31:12
tags:
- Hexo
categories:
- Hexo
hidden:
---

# 前言

随着时间的推移，很多程序都会更新，网上很多关于对程序记录的内容往往会过时，出现不能在复现的问题。因此根据文章发布时间设置时效性提醒，有助于读者辨别信息的可靠性。

<!-- more -->

> 参考：[Hexo博客进阶：为 Next 主题的 Hexo 博客内容添加文章过期/时效提示](https://qianfanguojin.top/2022/09/07/Hexo%E5%8D%9A%E5%AE%A2%E8%BF%9B%E9%98%B6%EF%BC%9A%E4%B8%BA-Next-%E4%B8%BB%E9%A2%98%E7%9A%84-Hexo-%E5%8D%9A%E5%AE%A2%E5%86%85%E5%AE%B9%E6%B7%BB%E5%8A%A0%E6%96%87%E7%AB%A0%E8%BF%87%E6%9C%9F-%E6%97%B6%E6%95%88%E6%8F%90%E7%A4%BA/)

效果图如下

![文章时效性提示](image-20221015203829818.png)

# 添加注入器

`Hexo`提供了 [注入器（Injector）](https://hexo.io/zh-cn/api/injector)，可以**将指定的静态代码片段注入到生成的静态页面中**。

在主题的 `scripts` 目录（没有则新建一个）下新建一个名为 `injector.js` 的文件，

![新建injector.js](image-20221015204435886.png)

内容如下：

```js
//注入文章过期提示
hexo.extend.injector.register('body_end', `<script src="/js/outdate.js"></script>`, 'post')
```

- `body_end` 代表注入到文章开头。
- 由于注入的代码有点长，我们就用一个 `Javascript` 文件单独处理，作为注入的代码片段引入
- `post` 代表只注入到文章详情页面中。

# 添加静态代码片段

在主题的 `source` 目录下新建 `js` 文件夹，新建一个名为 `outdate.js` 的文件，

![新建outdate.js](image-20221015204541482.png)

添加以下代码：

```js
(function() {
    //不同的日期显示不同的样式，200 天为黄色提示，400天为红色提示，可以自己定义。
    let warningDay = 200;
    let errorDay = 400;
    // 确保能够获取到文章时间以及在文章详情页
    let times = document.getElementsByTagName('time');
    if (times.length === 0) { return; }
    let posts = document.getElementsByClassName('post-body');
    if (posts.length === 0) { return; }

    // 获取系统当前的时间
    let pubTime = new Date(times[0].dateTime); /* 文章发布时间戳 */
    let now = Date.now() /* 当前时间戳 */
    let interval = parseInt(now - pubTime)
    let days = parseInt(interval / 86400000)
        /* 发布时间超过指定时间（毫秒） */
        //note warning 以及 note danger 是 Next 主题的自定义模板语法，如果使用其他主题，请自行更改样式以达到最佳显示效果
    if (interval > warningDay * 3600 * 24 * 1000 && interval < errorDay * 3600 * 24 * 1000) {
        posts[0].innerHTML = '<div class="note warning">' +
            '<h5>文章时效性提示</h5><p>这是一篇发布于 ' + days + ' 天前的文章，部分信息可能已发生改变，请注意甄别。</p>' +
            '</div>' + posts[0].innerHTML;
    } else if (interval >= errorDay * 3600 * 24 * 1000) {
        posts[0].innerHTML = '<div class="note danger">' +
            '<h5>文章时效性提示</h5><p>这是一篇发布于 ' + days + ' 天前的文章，部分信息可能已发生改变，请注意甄别。</p>' +
            '</div>' + posts[0].innerHTML;
    }
})();
```

