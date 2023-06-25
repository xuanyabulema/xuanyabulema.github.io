---
title: Python中逻辑运算and和or的短路特性
tags:
  - Python
categories:
  - Python
date: 2022-12-06 20:18:52
hidden:
---

# `Python`中`and`和`or`的短路特性

众所周知，`Python`中逻辑运算`and`可用于判断多个条件是否都符合要求，`or`可用于判断是否存在一个条件满足要求。为了加速运行，`Python`中的`and`和`or`具有短路特性

- `and`的短路特性

  - 当`and`左侧值判定为`False`后，则不会执行`and`右侧的内容，并将整体判定为`False`

  - 当`and`左侧值判定为`True`后，才会执行`and`右侧的内容，来最终判定整体

<!-- more -->

- `or`的短路特性
  - 当`or`左侧值判定为`True`后，则不会执行`or`右侧的内容，并将整体判定为`True`
  - 当`or`左侧值判定为`False`后，才会执行`or`右侧的内容，来最终判定整体

# 代码示例

先定义两个函数以便查看是否被执行到

```python
def printFalse():
    print("False函数执行")
    return False


def printTrue():
    print("True函数执行")
    return True
```

## `and`的短路特性

**当`and`左侧值判定为`False`后，则不会执行`and`右侧的内容，并将整体判定为`False`**

示例

```python
print('and左侧判定为False后，则不会执行and右侧的内容')
print('====================================')
if printFalse() and printTrue():
    print("Python and组合内容判断为True后执行")
print('====================================')
if printFalse() and printFalse():
    print("Python and组合内容判断为True后执行")
print('====================================')
```

输出结果

```python
and左侧判定为False后，则不会执行and右侧的内容
====================================
False函数执行
====================================
False函数执行
====================================
```

**当`and`左侧值判定为`True`后，才会执行`and`右侧的内容，来最终判定整体**

示例

```python
print('and左侧判定为True后，才会执行and右侧的内容')
print('====================================')
if printTrue() and printFalse():
    print("Python and组合内容判断为True后执行")
print('====================================')
if printTrue() and printTrue():
    print("Python and组合内容判断为True后执行")
print('====================================')
```

输出结果

```python
and左侧判定为True后，才会执行and右侧的内容
====================================
True函数执行
False函数执行
====================================
True函数执行
True函数执行
Python and组合内容判断为True后执行
====================================
```



## `or`的短路特性

**当`or`左侧值判定为`True`后，则不会执行`or`右侧的内容，并将整体判定为`True`**

示例

```python
print('or左侧判定为True后，则不会执行or右侧的内容')
print('====================================')
if printTrue() or printFalse():
    print("Python or组合内容判断为True后执行")
print('====================================')
if printTrue() or printTrue():
    print("Python or组合内容判断为True后执行")
print('====================================')
```

输出结果

```python
or左侧判定为True后，则不会执行or右侧的内容
====================================
True函数执行
Python or组合内容判断为True后执行
====================================
True函数执行
Python or组合内容判断为True后执行
====================================
```

**当`or`左侧值判定为`False`后，才会执行`or`右侧的内容，来最终判定整体**

示例

```python
print('or左侧判定为False后，才会执行or右侧的内容')
print('====================================')
if printFalse() or printTrue():
    print("Python or组合内容判断为True后执行")
print('====================================')
if printFalse() or printFalse():
    print("Python or组合内容判断为True后执行")
print('====================================')
```

输出结果

```
or左侧判定为False后，才会执行or右侧的内容
====================================
False函数执行
True函数执行
Python or组合内容判断为True后执行
====================================
False函数执行
False函数执行
====================================
```

