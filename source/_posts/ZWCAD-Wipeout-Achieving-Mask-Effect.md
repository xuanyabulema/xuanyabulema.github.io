---
title: 中望 CAD wipeout：实现遮罩效果
date: 2026-04-07 16:07:43
tags:
categories:
hidden:
---



# 前言

通常 CAD 中的各图案无相互遮挡效果，但有时为了更好的呈现实际效果，需要图形之间的相互遮挡效果。

<!-- more -->

# wipeout 命令的使用

> [CAD﻿的遮罩功能怎么用](https://www.zwsoft.cn/tutorial-gc/12431.html)
>
> [怎么用CAD实现图形遮挡效果](https://www.zwsoft.cn/tutorial-gc/15636.html)

如图所示，一排线段与一个近矩形多段线。

<img src="./ZWCAD-Wipeout-Achieving-Mask-Effect/image-20260407161441483.png" alt="image-20260407161441483" style="zoom:50%;" />

现需要使得矩形有遮挡线段的效果，可使用 `wipeout` 功能，在命令窗口输入`wipeout`后，在输入`p`，选择矩形的多段线

![image-20260407161937216](./ZWCAD-Wipeout-Achieving-Mask-Effect/image-20260407161937216.png)

再根据需求，是否保留原有的多段线

![image-20260407162044900](./ZWCAD-Wipeout-Achieving-Mask-Effect/image-20260407162044900.png)

最终获得有遮罩效果的图形

<img src="./ZWCAD-Wipeout-Achieving-Mask-Effect/image-20260407162118545.png" alt="image-20260407162118545" style="zoom:50%;" />
