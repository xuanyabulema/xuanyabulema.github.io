---
title: Usage of Pandas DataFrames
date: 2024-10-10 20:27:37
tags:
- Python
- pandas
- DataFrame
categories:
- Python
- pandas
- DataFrame
hidden:
---



##  pandas 的一些使用案例





<!-- more -->



## DataFrame 删除指定列中的包含 nan 数据所在行

在Python的Pandas库中，如果你想要删除DataFrame中包含`NaN`值的行，可以使用`dropna()`方法。如果你只想删除指定列中包含`NaN`值的行，可以设置`subset`参数。下面是一个例子：

```python
import pandas as pd
import numpy as np

# 假设我们有以下DataFrame
df = pd.DataFrame({
    'A': [1, 2, np.nan, 4],
    'B': [np.nan, 2, 3, 4],
    'C': [1, 2, 3, np.nan]
})

# 删除列'A'中包含NaN的行
df_cleaned = df.dropna(subset=['A'])

print(df_cleaned)
```

在这个例子中，`dropna(subset=['A'])`会删除列`A`中包含`NaN`值的行。`subset`参数接受一个列名列表，你可以指定多个列名来删除这些列中包含`NaN`的行。

如果你想要在原DataFrame上直接进行修改，而不是创建一个新的DataFrame，可以使用`inplace=True`参数：

如果你想要在原DataFrame上直接进行修改，而不是创建一个新的DataFrame，可以使用`inplace=True`参数：

```python
df.dropna(subset=['A'], inplace=True)
```

这样就会直接在`df`上删除列`A`中包含`NaN`的行，而不会返回一个新的DataFrame。



## DataFrame 删除指定列中的 符合特定条件 的数据所在行

在Pandas中，如果你想删除DataFrame中特定列符合某个条件的行，你可以使用布尔索引来实现。这里有一个例子，假设我们想要删除列`A`中值大于2的行：

```python
import pandas as pd

# 假设我们有以下DataFrame
df = pd.DataFrame({
    'A': [1, 3, 2, 4],
    'B': [5, 6, 7, 8],
    'C': [9, 10, 11, 12]
})

# 删除列'A'中值大于2的行
df_cleaned = df[df['A'] <= 2]

print(df_cleaned)
```

在这个例子中，`df['A'] <= 2`创建了一个布尔序列，表示列`A`中每个元素是否小于或等于2。然后，这个布尔序列被用作索引来选择不满足条件的行。

或者使用`query`方法，这在处理复杂的条件时非常有用：

```python
# 使用query方法删除列'A'中值大于2的行
df_cleaned = df.query('A <= 2')

print(df_cleaned)
```

`query`方法允许你使用字符串表达式来过滤行，这在处理复杂的条件时非常有用，尤其是当条件难以用简单的布尔索引表达时。
