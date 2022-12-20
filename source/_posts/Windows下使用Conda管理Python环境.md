---
title: Windows下使用Conda管理Python环境
tags:
  - Python
  - Conda
  - Windows
categories:
  - Python
  - Conda
abbrlink: 6f3659c4
date: 2022-12-14 14:35:13
hidden:
---

# 前言

按照固有思维，`Windows`下应该使用`PowerShell`或`CMD`来执行`Conda`相关命令来管理`Python`环境。

- <span style="color:rgb(255, 0, 0);font-weight:bold;">注意</span>：在使用`PowerShell`前应先检查`Anaconda3/Scripts/`已经添加到了系统环境变量下，然后执行

  ```powershell
  conda init powershell
  ```

  否则会出现无法激活切换`conda`环境，[参考](https://stackoverflow.com/a/54811138)

<!-- more -->

# 源配置

> [北外源](https://mirrors.bfsu.edu.cn/help/anaconda/)

# Conda常用命令

查看已安装的库

```shell
conda list
```

安装指定库

```shell
conda install xxx
```

- 示例：安装`numpy`和指定`3.4.3`版本的`matplotlib `, `conda`会自动从远程搜索相关信息和依赖项目

  ```shell
  conda install numpy matplotlib=3.4.3
  ```

  ![conda install numpy matplotlib=3.4.3](image-20221214160239444.png)

删除指定库

```shell
conda uninstall xxx
```

搜索库

```shell
conda search xxx
```

检查更新当前conda

```shell
conda update conda
```

检查并更新所有内容

```shell
conda update --all
```

# Conda虚拟环境管理

查看当前存在哪些虚拟环境

```shell
conda env list
# 或
conda info -e
```

![查看虚拟环境](image-20221214155735469.png)

创建环境

```shell
conda create -n your_env_name python=x.x
```

- 示例

  ```shell
  conda create -n test_env python=3.7
  ```

激活（切换）环境

```shell
conda activate your_env_name
```

- 示例

  ```shell
  conda activate test_env
  ```

  ![激活（切换）环境](image-20221214155922958.png)

关闭虚拟环境（回主环境）

```shell
conda deactivate your_env_name
```

- 示例

  ```shell
  conda deactivate test_env
  ```

删除虚拟环境

```text
conda remove -n your_env_name --all
```

- 示例

  ```shell
  conda remove -n test_env --all
  ```

