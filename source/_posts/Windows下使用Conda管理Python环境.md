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

## 查看已安装的库

```shell
conda list
```

## 安装指定库

```shell
conda install xxx
```

- 示例：安装`numpy`和指定`3.4.3`版本的`matplotlib `, `conda`会自动从远程搜索相关信息和依赖项目

  ```shell
  conda install numpy matplotlib=3.4.3
  ```

  ![conda install numpy matplotlib=3.4.3](image-20221214160239444.png)

## 删除指定库

```shell
conda uninstall xxx
```

## 搜索库

```shell
conda search xxx
```

## 检查更新当前conda

```shell
conda update conda
```

## 检查并更新所有内容

```shell
conda update --all
```

# Conda虚拟环境管理

## 查看已有虚拟环境

```shell
conda env list
# 或
conda info -e
```

![查看虚拟环境](image-20221214155735469.png)

## 创建新环境

```shell
conda create -n your_env_name python=x.x
```

- 示例

  ```shell
  conda create -n test_env python=3.7
  ```

## 激活（切换）环境

```shell
conda activate your_env_name
```

- 示例

  ```shell
  conda activate test_env
  ```

  ![激活（切换）环境](image-20221214155922958.png)

## 关闭虚拟环境（回主环境）

```shell
conda deactivate your_env_name
```

- 示例

  ```shell
  conda deactivate test_env
  ```

## 删除虚拟环境

```text
conda remove -n your_env_name --all
```

- 示例

  ```shell
  conda remove -n test_env --all
  ```

# Conda环境复制（备份）与迁移

## 复制（备份）

```shell
conda create --name myclone --clone myenv
```

 `myclone` 复制（备份）产生的新环境的名称

 `myenv` 想复制的现有环境的名称

## 迁移

在新电脑上安装旧电脑的环境步骤如下

1. 切换到想要迁移的环境

   ```shell
   conda activate env_name
   ```

2. 到处为`.yaml`文件

   ```shell
   conda env export > environment.yaml
   ```

   会在当前命令执行目录下生成一个`environment.yaml`文件，

3. 将其复制到新电脑上后执行导入环境操作

   ```shell
   conda env create -f environment.yaml
   ```

   <span style="color:rgb(255, 0, 0);font-weight:bold;">注意</span>：若导出base环境，则在目标机上会提示已存在（而且base环境无法删除）

   若希望迁移到base环境应该使用如下命令

   ```py
   conda env update -n base --file environment.yaml
   ```



