---
title: NumPy使用
date: 2022-11-08 22:29:24
tags:
- Python
- NumPy
categories:
- Python
- NumPy
hidden:
---

## NumPy使用

```python
import numpy as np
```

<!-- more -->

### 数据拷贝

`numpy`关于copy有三种情况，完全不复制、视图（view）或者叫浅复制（shallow copy）和深复制（deep copy）。

而` b = a[:]` 这种形式就属于第二种，即视图，这本质上是一种切片操作（slicing），所有的切片操作返回的都是视图。具体来说，`b = a[:]`会创建一个新的对象 b（所以 id(b) 和id(a) 返回的结果是不一样的），但是 b 的数据完全来自于a，和 a 保持完全一致，换句话说，b的数据完全由a保管，他们两个的数据变化是一致的，可以看下面的示例:

```python
a = np.arange(4)  # array([0, 1, 2, 3])
b = a[:]  # array([0, 1, 2, 3])
b.flags.owndata  # 返回 False，b 并不保管数据
a.flags.owndata  # 返回 True，数据由 a 保管
# 改变 a 同时也影响到 b
a[-1] = 10  # array([0, 1, 2, 10])
print(b)  #  array([0, 1, 2, 10])
# 改变 b 同时也影响到 a
b[0] = 10  # array([10, 1, 2, 10])
print(a)  # array([10, 1, 2, 10])
```

`b = a` 和 `b = a[:]` 的差别就在于后者会创建新的对象，前者不会。两种方式都会导致 `a` 和 `b` 的数据相互影响。

要想不让 `a` 的改动影响到 `b`，可以使用深复制：

```python
unique_b = a.copy()
```



### 矩阵运算

#### 矩阵乘法

```python
"""
元素乘法：np.multiply(a,b)   a*b
矩阵乘法：np.dot(a,b) 或 np.matmul(a,b) 或 a.dot(b) 或直接用 a @ b !
唯独注意：*，在 np.array 中重载为元素乘法，在 np.matrix 中重载为矩阵乘法!
"""
```

#### 矩阵取逆

```python
a = np.array([[1, 2], [3, 4]])  # 初始化一个非奇异矩阵(数组)
print(np.linalg.inv(a))  # 对应于MATLAB中 inv() 函数

# 矩阵对象可以通过 .I 更方便的求逆
A = np.matrix(a)
print(A.I)
```

### 正态分布的随机数数组

```python
# loc-（平均）钟声峰值所在的位置。
# scale-（标准偏差）图形分布的平坦程度。
# size-返回数组的形状。
x = np.random.normal(loc=1, scale=2, size=(2, 3))
```

###  从数值范围创建数组

#### numpy.arange

```python
numpy.arange(start, stop, step, dtype)
"""
start	起始值，默认为0
stop	终止值（不包含）
step	步长，默认为1
dtype	返回ndarray的数据类型，如果没有提供，则会使用输入数据的类型。"""
```

#### numpy.linspace

函数用于创建一个一维数组，数组是一个等差数列构成的，格式如下：

```python
np.linspace(start, stop, num=50, endpoint=True, retstep=False, dtype=None)
"""
start	序列的起始值
stop	序列的终止值，如果endpoint为true，该值包含于数列中
num	要生成的等步长的样本数量，默认为50
endpoint	该值为 true 时，数列中包含stop值，反之不包含，默认是True。
retstep	如果为 True 时，生成的数组中会显示间距，反之不显示。
dtype	ndarray 的数据类型"""
```

#### numpy.logspace

```python
np.logspace(start, stop, num=50, endpoint=True, base=10.0, dtype=None)
"""
start	序列的起始值为：base ** start
stop	序列的终止值为：base ** stop。如果endpoint为true，该值包含于数列中
num	要生成的等步长的样本数量，默认为50
endpoint	该值为 true 时，数列中中包含stop值，反之不包含，默认是True。
base	对数 log 的底数。 base 参数意思是取对数的时候 log 的下标。
dtype	ndarray 的数据类型"""
```

示例

```python
a = np.logspace(1.0,  2.0, num =  10)  # 默认底数是 10
print (a)
```

输出

```
[ 10.           12.91549665     16.68100537      21.5443469  27.82559402      
  35.93813664   46.41588834     59.94842503      77.42636827    100.    ]
```

### 更改数据类型

```python
import numpy as np
arr = np.array([1,2,3,4,5])
print(arr.dtype)
float_arr = arr.astype(np.float64)
print(float_arr.dtype)
```



### 交换行（列）

```python
test = np.array([[1, 2, 1], [3, 4, 5], [1, 2, 3]])
print(test)
test1 = test[(0, 2, 1), :]  # 交换行
print(test1)
test2 = test[:, (0, 2, 1)]  # 交换列
print(test2)
```



### 添加一行、一列

```python
# -*- coding: UTF-8 -*-
import numpy as np

# 创建数组arr
arr = np.array([[1, 2, 3, 4], [5, 6, 7, 8]])
print('第1个数组arr：', arr)
print('向arr数组添加元素：')
print(np.append(arr, [[9, 10], [11, 12]]))
print('原数组：', arr)
print('沿轴 0(行方向) 添加元素：')
print(np.append(arr, [[9, 10, 11, 12], [11, 11, 11, 11]], axis=0))
print('沿轴 1(列方向)添加元素：')
print(np.append(arr, [[9, 10], [11, 12]], axis=1))
```

### 获取一列、一行

```python
import numpy as np
a=np.arange(9).reshape(3,3)
print(a[1])  #某列
ptint(a[:,1]) #某列
```

### 删除某行，某列

```python
x = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
x1 = np.delete(x, 1, axis=0)  # axis=0 删除某行
print(x1)
x2 = np.delete(x, [1,2], axis=1)  # axis=1 删除多列
print(x2)
x3 = np.delete(x, 1, axis=None)  # axis = None：表示把数组按一维数组平铺在进行索引删除
print(x3)
```

### 行列拼接

```python
a = np.array([[1, 2, 3], [4, 5, 6]])
b = np.array([[11, 21, 31], [7, 8, 9]])
c1 = np.concatenate((a, b), axis=0)  # 合并行 默认情况下，axis=0可以不写
print(c1)
c2 = np.concatenate((a, b), axis=1)  # 合并列
print(c2)
```

### 转置

```python
arr = np.array([[1, 2, 3, 4], [5, 6, 7, 8]])
print(arr)
print(arr.T)  # 方式一
print(np.transpose(arr))  # 方式二
```

### 空数组

```	python
np.empty(shape=(0))
np.empty(shape=(0, 4))
```

