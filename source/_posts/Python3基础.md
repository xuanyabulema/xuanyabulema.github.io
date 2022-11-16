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

