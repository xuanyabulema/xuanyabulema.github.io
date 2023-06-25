---
title: 寻找指定文件夹下所有指定类型的文件（Python）
tags:
  - Python
categories:
  - Python
date: 2022-11-06 15:50:47
hidden:
---

寻找指定文件夹下所有指定类型的文件（Python）

<!-- more -->

利用[Python正则表达式](https://www.liaoxuefeng.com/wiki/1016959663602400/1017639890281664)进行匹寻找配

```python
import os
import re


# 获得指定目录下所有指定后缀文件的路径
class GetFile:

    def __init__(self, path, file_extensions):
        self.file_list = []  # 保存路径
        self.get_files_path(path, file_extensions)

    def get_files_path(self, path, file_extensions):
        file_list = os.listdir(path)  # 获取所有子路径
        for file_name in file_list:
            new_path = os.path.join(path, file_name)
            if os.path.isdir(new_path):  # 判断，是文件夹，则递归
                self.get_files_path(new_path, file_extensions)
            elif os.path.isfile(new_path):  # 判断是否为文件
                result = re.match(".+\." + file_extensions + "$", new_path)  # 判断是否为所需后缀的文件
                if result:
                    self.file_list.append(new_path)
            else:
                print("It's not a directory or a file.")


# 使用示例
path = r'D:\下载'
file_extensions = 'exe'  # 单类文件匹配
file_list = GetFile(path, file_extensions).file_list

file_extensions = '(md|mp4|jpg)'  # 多类文件匹配
file_list = GetFile(path, file_extensions).file_list
```





