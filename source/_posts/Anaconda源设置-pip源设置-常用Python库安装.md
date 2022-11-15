---
title: Anaconda源设置|pip源设置|常用Python库安装
date: 2022-09-18 17:12:26
tags:
- Anaconda
- pip
- Python
categories:
- Python
hidden:
---

# Anaconda配置源

## [清华大学开源软件镜像站](https://mirrors.tuna.tsinghua.edu.cn/)

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

## [北京外国语大学开源软件镜像站](https://mirrors.bfsu.edu.cn/)

> https://mirrors.tuna.tsinghua.edu.cn/news/bfsu-mirror/
>
> 北外镜像站作为 TUNA 镜像的姊妹站，由北外信息技术中心支持创办、清华 TUNA 协会运行维护，提供和 TUNA 镜像站基本一致的镜像内容，网络接入 CERNET2 IPv6 和中国移动 IPv4 线路，支持 HTTP/HTTPS/RSYNC 访问。如果您在使用 TUNA 镜像时遇到负载过高、速度过慢等问题，可以尝试切换至北外镜像站以获得更佳的体验。
>
> 对于在镜像使用中遇到的问题，您可以提交 [issue](https://github.com/tuna/issues/issues/new?labels=BFSU) 提出反馈或通过发送邮件到 [support@tuna.tsinghua.edu.cn](mailto:support@tuna.tsinghua.edu.cn) 联系我们。

> https://mirrors.bfsu.edu.cn/help/anaconda/

我的配置如下

```
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.bfsu.edu.cn/anaconda/pkgs/main
  - https://mirrors.bfsu.edu.cn/anaconda/pkgs/r
  - https://mirrors.bfsu.edu.cn/anaconda/pkgs/msys2
  - https://mirrors.bfsu.edu.cn/anaconda/cloud/pytorch
  - https://mirrors.bfsu.edu.cn/anaconda/cloud/msys2
  - https://mirrors.bfsu.edu.cn/anaconda/cloud/bioconda
  - https://mirrors.bfsu.edu.cn/anaconda/cloud/menpo
  - https://mirrors.bfsu.edu.cn/anaconda/cloud/pytorch-lts
  - https://mirrors.bfsu.edu.cn/anaconda/cloud/simpleitk
custom_channels:
  conda-forge: https://mirrors.bfsu.edu.cn/anaconda/cloud
```

## Mamba替代加速Conda

安装

```sh
conda install -c conda-forge mamba
```

使用`Mamba`时其实只要将原有的`Conda`语句中的`conda`替换为`mamba`即可

以安装`conda install numpy`，使用以下命令则可替代

```sh
mamba install numpy
```



# pip配置源

清华源

> https://mirrors.tuna.tsinghua.edu.cn/help/pypi/

北外源

> https://mirrors.bfsu.edu.cn/help/pypi/

## pip安装指定版本的库

```shell
pip install matplotlib==3.4.3
```



# Pytorch安装

Pytorch官网的conda安装命令为（安装1.11.0版本的pytorch）

```shell
conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch
```

`-c pytorch`参数指定为Pytorch官网进行安装

在上述配置清华源后可以删除，从而使得从清华源上下，使用如下

```shell
conda install pytorch torchvision torchaudio cudatoolkit=11.3
```

有时安装不上cuda版的

可以指定一下`pytorch`版本，比如安装1.11.0 cuda版

```shell
conda install pytorch=1.11.0 torchvision torchaudio cudatoolkit=11.3
```

# 个人常用库

pip安装

```sh
pip install opencv-python opencv-contrib-python pydicom nibabel numpy matplotlib
```

conda安装

```sh
conda install opencv-python opencv-contrib-python pydicom nibabel numpy matplotlib
```



# OpenCV及其扩展模块

```shell
pip install opencv-python
pip install opencv-contrib-python
```



# pydicom

```shell
pip install pydicom
```



