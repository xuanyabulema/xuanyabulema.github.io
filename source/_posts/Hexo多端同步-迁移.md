---
title: Hexo多端同步|迁移
date: 2021-11-29 17:07:32
tags: [Hexo,git]
categories: 
- 折腾
- Hexo
---



# 新建GitHub分支以保存Hexo博客源文件

![image-20211205170753314](image-20211205170753314.png)

<!-- more -->

# 将本地Hexo目录与GitHub的Hexo分支关联上

先将`Hexo`分支文件clone到本地：

```shell
#git clone -b 分支名 仓库链接
git clone -b Hexo git@github.com:xuanyabulema/xuanyabulema.github.io.git
```

进入拷贝到本地的文件：

```shell
cd xuanyabulema.github.io/
```

用`ll`查看文件

![image-20211205171837598](image-20211205171837598.png)

删除`.git/`以外的所有文件

```shell
shopt -s extglob      #（打开extglob模式）
rm -fr !(.git/)  
# 如果是多个要排除的，可以这样：
# rm -rf !(file1|file2) 
```

将变化同步到GitHub

```shell
git add -A 
git commit -m "Hexo源文件同步"
git push origin 
```

将`.git/`移到你的本地Hexo源文件夹`blog`根目录下

```shell
mv xuanyabulema.github.io/.git/ blog/.git/
```

将博客目录下 themes 文件夹下每个主题文件夹里面的 .git .gitignore 删掉。

```shell
rm -rf .git/
rm -rf .gitignore
```

将变化同步到GitHub

```shell
git add -A 
git commit -m "Hexo源文件同步"
git push origin 
```

# 新环境配置与同步





