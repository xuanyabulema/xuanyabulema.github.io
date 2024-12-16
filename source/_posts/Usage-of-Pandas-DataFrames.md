---
title: Usage of Pandas DataFrame
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



## DataFrame 保留某列符合特定条件的数据所在行

### 实现1

在Python的Pandas库中，你可以使用布尔索引来保留DataFrame中某列符合特定条件的数据所在行。下面是一个简单的例子，假设我们有一个DataFrame `df` 和一个列 `column_name`，我们想要保留这个列中值大于2且小于等于4的行：

```python
import pandas as pd

# 假设这是你的DataFrame
data = {
    'column_name': [1, 3, 5, 2, 4, 0],
    'other_column': ['a', 'b', 'c', 'd', 'e', 'f']
}
df = pd.DataFrame(data)

# 保留column_name列中值大于2且小于等于4的行
filtered_df = df[(df['column_name'] > 2) & (df['column_name'] <= 4)]

print(filtered_df)
```

在这个例子中，`df['column_name'] > 2` 和 `df['column_name'] <= 4` 分别创建了两个布尔序列，然后使用 `&` 运算符将这两个条件结合起来，最终得到一个同时满足这两个条件的布尔序列。这个布尔序列被用作索引，来选择原始DataFrame中满足条件的行。

执行上述代码后，`filtered_df` 将只包含 `column_name` 列中值大于2且小于等于4的行。

### 实现2

或者使用`query`方法，这在处理复杂的条件时非常有用：

以下是如何使用`query`方法来实现你的需求，即保留某列（假设列名为`column_name`）中值大于2且小于等于4的行：

```python
import pandas as pd

# 假设这是你的DataFrame
data = {
    'column_name': [1, 3, 5, 2, 4, 0],
    'other_column': ['a', 'b', 'c', 'd', 'e', 'f']
}
df = pd.DataFrame(data)

# 使用query方法保留column_name列中值大于2且小于等于4的行
filtered_df = df.query('column_name > 2 & column_name <= 4')

print(filtered_df)
```

在这个例子中，`query`方法接受一个字符串参数`'column_name > 2 & column_name <= 4'`，这个字符串包含了筛选条件。`query`方法会解析这个字符串，并返回一个新的DataFrame，其中只包含满足这个条件的行。

使用`query`方法的好处是代码更简洁，易于阅读和编写，尤其是在处理复杂的查询条件时。不过，需要注意的是，`query`方法中的字符串表达式需要遵循Python的表达式语法，并且不能包含Python的关键字，如`in`、`and`、`or`等，而应该使用`&`、`|`（分别对应逻辑与和逻辑或）以及`~`（表示逻辑非）。

## 筛选指定列'A'中的整数行

```python
import pandas as pd

# 假设df是你的DataFrame
df = pd.DataFrame(
    {
        "A": [0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5],
        "B": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    }
)


filtered_df = df[df["A"].apply(lambda x: x.is_integer())]  # 只保留整数

print(filtered_df)
```

`apply(lambda x: x.is_integer())`：这部分代码对'A'列中的每个元素应用一个函数。`apply`函数允许你对DataFrame的列或行应用一个自定义函数。在这里，我们使用了一个`lambda`函数，这是一个匿名函数，它接受一个参数`x`（代表'A'列中的每个元素），并返回`x.is_integer()`的结果。

- `x.is_integer()`：这是一个Python内置的方法，用于检查一个浮点数`x`是否为整数。如果`x`是一个整数（即没有小数部分），那么`x.is_integer()`返回`True`；否则返回`False`。

## 包含多个DataFrame的list拼接成一个 DataFrame

在Python中，如果你有一个包含多个Pandas DataFrame的列表，并想要将它们拼接在一起，可以使用Pandas库中的`pd.concat()`函数。这个函数可以将多个DataFrame沿着一个轴拼接起来。

以下是一个示例，展示了如何将一个包含多个DataFrame的列表拼接成一个大的DataFrame：

```python
import pandas as pd

# 创建几个DataFrame作为示例
df1 = pd.DataFrame({'A': [1, 2], 'B': [3, 4]})
df2 = pd.DataFrame({'A': [5, 6], 'B': [7, 8]})
df3 = pd.DataFrame({'A': [9, 10], 'B': [11, 12]})

# 将DataFrame放入一个列表中
dataframes = [df1, df2, df3]

# 使用pd.concat()将列表中的DataFrame拼接起来
# 默认沿着axis=0（行）拼接
combined_df = pd.concat(dataframes, ignore_index=True)

print(combined_df)
```

在这个例子中，`pd.concat()`函数将列表`dataframes`中的所有DataFrame沿着行（axis=0）拼接在一起。参数`ignore_index=True`表示在拼接后的DataFrame中重新设置索引，否则它会保留原来的索引，可能会导致索引重复。

如果你想要沿着列（axis=1）拼接DataFrame，可以设置`axis`参数为1：

```python
# 沿着列拼接
combined_df = pd.concat(dataframes, axis=1)

print(combined_df)
```

请注意，沿着列拼接时，每个DataFrame必须有相同的索引。
