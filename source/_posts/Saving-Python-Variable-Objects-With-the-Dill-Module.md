---
title: 利用dill模块保存Python变量对象
tags:
  - Python
  - dill
categories:
  - Python
  - dill
abbrlink: 1a485fb5
date: 2022-12-08 14:40:10
hidden:
---

# 前言

> 内容参考：[（数据科学学习手札142）dill：Python中增强版的pickle](https://www.cnblogs.com/feffery/p/16703398.html)

`Python`自带`pickle`库可以保存程序运行过程中的变量对象信息至文件，但用起来遇到一个问题，

```python
_pickle.PicklingError: Can't pickle <class 'TPS_torch.TPS'>: it's not the same object as TPS_torch.TPS
```

在网上寻找解决办法，尝试无果后，发现了`dill`，于是改用`dill`模块，不再出现上述问题。

`dill`可以认为是增强版的`pickle`，不仅包括`pickle`的功能，而且基础使用一致，而且dill包括一些pickle不具备的功能，如

- 保存解释器状态（state of an interpreter session），即可保存运行后整个内存中所有对象信息
- 保存lambda函数
- 保存源码

<!-- more -->

# 基础使用

备用代码

```python
import dill
import numpy as np


class A:
    def __init__(self):
        print("class A init")
        self.a = 66666666
```

## 保存变量对象至文件

使用方式

```python
dill.dump(obj, file)
# obj 要保存的变量对象
# file 要保存至的文件
```

示例

```python
a = A()
b = np.ones((3, 4))

with open('./pickle/dill_test.pkl', 'wb') as f:
    dill.dump([a, b], f) # dill.dump(obj, file)
```

## 从文件中读取变量对象

使用方式

```python
obj = dill.load(file)
```

示例

```python
with open('./pickle/dill_test.pkl', 'rb') as f:
    a, b = dill.load(f)  # obj = dill.load(file)
```

# 保存和加载解释器状态

`dill.dump_module()`（旧为`dill.dump_session()`）可以将解释器状态保存至文件，即可保存运行后整个内存中所有对象信息

`dill.load_module()`（旧为`dill.load_session()`）可以从文件中加载保存的解释器状态

示例

```python
a = A()
b = np.ones((3, 4))

dill.dump_module('./pickle/state.pkl')

del a, b  # 删除内存中的变量
print('a' in dir())  # 判断 a 是否存在
dill.load_module('./pickle/state.pkl')
print('a' in dir())  # 判断 a 是否存在
```

运行结果

```python
class A init
False
True
```

# 保存lambda函数

```python
pass
```

# 保存源码

```python
pass
```

