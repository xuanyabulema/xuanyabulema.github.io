---
title: Git使用
tags: Git
categories: Git
abbrlink: ca675cd4
date: 2022-02-23 14:45:36
hidden:
---

# 基础使用

Git查看分支信息

```shell
git branch
```

<!-- more -->

更换分支

```shell
git checkout <branch> # <branch>为分支名
git switch <branch> # <branch>为分支名
```

创建并切换到新分支

```shell
git checkout -b <branch> # <branch>为分支名
git switch -c <branch> # <branch>为分支名
```

相当于以下两条命令：

```shell
git branch <branch> # <branch>为分支名
git checkout <branch> # <branch>为分支名
```

删除分支

```shell
git branch -d <branch> # <branch>为分支名
```

合并分支：合并指定分支到当前分支

```shell
git merge <branch> # <branch>为分支名
```

## .gitignore文件配置

```
# dir 不需要提交的目录
/node_modules
.idea/

# file 不需要提交的文件
config.ini

# log 不需要提交的任意包含后缀名为log的文件
*.log

# Package Files 不需要提交的任意包含后缀名为jar的文件
*.jar

# 仅包含文件夹下指定类型文件，以 ".py" 文件为例
# 先除去该文件夹下所有文件
/folder/*
!/folder/*.py 
```



# 配置Git

## 配置用户名、邮箱等信息

以我的为例

```shell
git config --global user.name "xuanyabulema"
git config --global user.email "xuanyabulema@qq.com"
```

使用方式

```shell
# git config命令的--global参数，用了这个参数，表示你这台机器上所有的Git仓库都会使用这个配置，当然也可以对某个仓库指定不同的用户名和Email地址。

# 1.查看git配置信息
git config --list
  
# 2.查看git用户名、密码、邮箱的配置
git config user.name
git config user.password
git config user.email
 
# 3.设置git用户名、密码、邮箱的配置
git config user.name "yourName"
git config user.password "yourPassword"
git config user.email "your@email.com"
# 3.设置git用户名、密码、邮箱的配置（全局配置）
git config --global user.name "yourName"
git config --global user.password "yourPassword"
git config --global user.email "your@email.com"
 
# 4.修改git用户名、密码、邮箱的配置（跟设置语法一样，没有用户名就添加，有了用户名就修改）
git config user.name "yourName"
# 4.修改git用户名、密码、邮箱的配置（全局配置）
git config --global user.name "yourName"
 
# 5.删除git用户名、密码、邮箱的配置
git config --global --unset user.name "yourName"
git config --global --unset user.email "your@email.com"
```

## 连接GitHub

```shell
sudo ssh-keygen -t rsa -C "your@email.com"
```

以我的为例

```shell
sudo ssh-keygen -t rsa -C "xuanyabulema@qq.com"
```

[查看秘钥并添加至GitHub](https://docs.github.com/cn/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

```shell
cat /root/.ssh/id_rsa.pub
```

然后将`cat`获取到的结果存至GitHub

验证是否连接成功

```shell
ssh -T git@github.com
```



# 强制**远程覆盖本地**

1、从远程拉取所有内容

```sh
git fetch --all
```

2、reset 本地代码

```sh
git reset --hard origin/master
```

 或者如果你在其他分支上：

```sh
git reset --hard origin/<branch_name>
```

3、重新拉取对齐

```sh
git pull
```

