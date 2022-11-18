---
title: Python3基础
date: 2022-07-01 20:30:42
tags:
- Python
categories:
- Python
hidden:
---

# Python3基础使用

<!-- more -->

# 内置函数

## range()

Python3 range() 函数返回的是一个可迭代对象（类型是对象），而不是列表类型， 所以打印的时候不会打印列表。

Python3 list() 函数是对象迭代器，可以把range()返回的可迭代对象转为一个列表，返回的变量类型为列表。

```python
### 函数语法
range(stop)
range(start, stop[, step])
```

参数说明：

- start: 计数从 start 开始。默认是从 0 开始。例如range(5)等价于range(0, 5);
- stop: 计数到 stop 结束，但不包括 stop。例如：range(0, 5)是[0, 1, 2, 3, 4]没有5
- step: 步长，默认为1。例如：range(0, 5) 等价于 range(0, 5, 1)

```python
>>> range(5)
range(0, 5)
>>> list(range(5))
[0, 1, 2, 3, 4]
>>> list(range(0, 30, 5))
[0, 5, 10, 15, 20, 25]
>>> list(range(0, 10, 2))
[0, 2, 4, 6, 8]
>>> list(range(0, -10, -1))
[0, -1, -2, -3, -4, -5, -6, -7, -8, -9]
```

# Numpy Pytorch中的数据拷贝

## Numpy数据拷贝

`numpy`关于copy有三种情况，完全不复制、视图（view）或者叫浅复制（shallow copy）和深复制（deep copy）。

而` b = a[:]` 这种形式就属于第二种，即视图，这本质上是一种切片操作（slicing），所有的切片操作返回的都是视图。具体来说，`b = a[:]`会创建一个新的对象 `b`（所以 id(b) 和id(a) 返回的结果是不一样的），但是 `b` 的数据完全来自于`a`，和`a`保持完全一致，换句话说，`b`的数据完全由`a`保管，他们两个的数据变化是一致的，可以看下面的示例:

```python
import numpy as np

a = np.arange(4)  # array([0, 1, 2, 3])
b = a[:]  # array([0, 1, 2, 3])
print(b.flags.owndata)  # 返回 False，b 并不保管数据
print(a.flags.owndata)  # 返回 True，数据由 a 保管
# 改变 a 同时也影响到 b
a[-1] = 10  # array([0, 1, 2, 10])
print(b)  # array([0, 1, 2, 10])
# 改变 b 同时也影响到 a
b[0] = 10  # array([10, 1, 2, 10])
print(a)  # array([10, 1, 2, 10])
```

`b = a` 和 `b = a[:]` 的差别就在于后者会创建新的对象，前者不会。两种方式都会导致 `a` 和 `b` 的数据相互影响。

要想不让 `a` 的改动影响到 `b`，可以使用深复制：

```python
unique_b = a.copy()
```



## Pytorch数据拷贝

类似上面的`numpy`，`ten_b = ten_a`这样是复制的地址，应该使用`clone()`实现裸复制

还有其他函数`copy()`, `detach()`等，待补充

```python
import torch

a = np.array([1, 2, 3])
ten_a = torch.from_numpy(a)
ten_b = ten_a  # 复制的是地址
ten_c = ten_a.clone()  #
print(f'ten_a = {ten_a}')  # ten_a = tensor([1, 2, 3], dtype=torch.int32)
print(f'ten_b = {ten_b}')  # ten_b = tensor([1, 2, 3], dtype=torch.int32)
print(f'ten_c = {ten_c}')  # ten_c = tensor([1, 2, 3], dtype=torch.int32)
print("修改 ten_b[1] = 6")
ten_b[1] = 6
print(f'ten_a = {ten_a}')  # ten_a = tensor([1, 6, 3], dtype=torch.int32)
print(f'ten_b = {ten_b}')  # ten_b = tensor([1, 6, 3], dtype=torch.int32)
print(f'ten_c = {ten_c}')  # ten_c = tensor([1, 2, 3], dtype=torch.int32)
print("修改 ten_c[1] = 9")
ten_c[1] = 9
print(f'ten_a = {ten_a}')  # ten_a = tensor([1, 6, 3], dtype=torch.int32)
print(f'ten_b = {ten_b}')  # ten_b = tensor([1, 6, 3], dtype=torch.int32)
print(f'ten_c = {ten_c}')  # ten_c = tensor([1, 9, 3], dtype=torch.int32)
```
