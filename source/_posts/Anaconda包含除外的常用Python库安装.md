---
title: Anaconda包含除外的常用Python库安装
date: 2022-06-22 22:11:21
tags: [Anaconda,Python]
categories:
hidden:
---

Anaconda已经包含不少的python库

除此之外个人使用还有一些常用的库的安装

在此记录，其中`Anaconda`, `pip`配置的是清华源进行安装

<!-- more -->

# OpenCV及其扩展模块

```shell
pip install opencv-python
pip install opencv-contrib-python
```

# PyTorch

1.11.0 cuda版

```
conda install pytorch=1.11.0 torchvision torchaudio cudatoolkit=11.3
```

# pydicom

```
pip install pydicom
```

# 安装指定版本的库

```
pip install matplotlib==3.4.1
```

