---
title: PyCharm python控制台中文乱码解决
date: 2022-08-02 16:09:37
tags: [PyCharm]
categories: 
hidden:
---

# 解决方案

2022-08-02

在win系统中添加如下环境变量`PYTHONIOENCODING=UTF8`，然后重启`PyCharm`。

<!-- more -->

![image-20220802163528902](image-20220802163528902.png)

```python
# -*- coding: utf-8 -*-

import os

if __name__ == '__main__':
    text = '我是UTF-8编码字符串'
    print(text)
```

解决前

![image-20220802163535635](image-20220802163535635.png)

解决后

![image-20220802163556447](image-20220802163556447.png)

## 其他方案（未有效）

修改`PyCharm`的`Encoding`为`UTF-8`等方式，未能解决我遇到的问题

https://blog.csdn.net/weixin_42260102/article/details/97538605

https://blog.csdn.net/pfm685757/article/details/53330531

