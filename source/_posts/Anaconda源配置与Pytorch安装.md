---
title: Anaconda源配置与Pytorch安装
date: 2022-06-22 21:51:24
tags: [Anaconda,Pytorch,cuda]
categories:
hidden:
---

# Anaconda配置清华源

> https://mirrors.tuna.tsinghua.edu.cn/help/anaconda/

<!-- more -->

我的配置如下

```
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/menpo
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch-lts
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/simpleitk
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
```

# Pytorch安装

Pytorch官网的conda安装命令为（安装1.11.0版本的pytorch）

```
conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch
```

`-c pytorch`参数指定为Pytorch官网进行安装

在上述配置清华源后可以删除，从而使得从清华源上下，使用如下

```
conda install pytorch torchvision torchaudio cudatoolkit=11.3
```

有时安装不上cuda版的

可以指定一下`pytorch`版本

```
conda install pytorch=1.11.0 torchvision torchaudio cudatoolkit=11.3
```

# pip配置清华源

> https://mirrors.tuna.tsinghua.edu.cn/help/pypi/
