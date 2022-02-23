---
title: Git使用
date: 2022-02-23 14:45:36
tags: Git
categories: Git
hidden:
---

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



