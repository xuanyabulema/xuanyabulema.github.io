---
title: Matplotlib 的使用2
tags:
  - Python
  - Matplotlib
categories:
  - Python
  - Matplotlib
date: 2023-04-01 16:34:18
hidden:
---

# 前言



<!-- more -->

```python
import matplotlib.pyplot as plt
```



#  常用参数设置



```python
config = {
    'font.family': 'Times New Roman',
    'figure.dpi': 200,
    "font.size": 10,
}
plt.rcParams.update(config)  # 全局样式

font_style = {  # 用 dict 单独指定 font 样式 : 使用latex 'usetex': True, 防止影响其他字体
    'family': 'Times New Roman',
    'weight': 'normal',
    'size': 12,
    'usetex': True,
}

np.set_printoptions(precision=4, suppress=True)
```



```python
ax = plt.gca()
ax.set_aspect(1)

# 调整整体空白，紧凑布局
plt.tight_layout()

# 调整子图间距
plt.subplots_adjust(wspace=0, hspace=0, left=0.1, right=0.9, bottom=0.1, top=0.9)

# 关闭坐标刻度
plt.xticks([])
plt.yticks([])

# 关闭坐标轴
plt.axis('off')

# 保存图像
image_format = 'svg'  # e.g .png, .svg, etc.
image_name = r'name.' + image_format
plt.savefig(image_name, format=image_format, dpi=200, bbox_inches='tight', pad_inches=0.05, transparent=True)

使用 axis() 方法在 Matplotlib 中设置轴的限制
我们还可以使用 matplotlib.pyplot.axis() 来设置轴的范围限制。语法如下：
plt.axis([xmin, xmax, ymin, ymax])
该方法避免了需要单独控制 X 轴和 Y 轴范围的麻烦。
```





```python
# 字体

weights = ['light', 'normal', 'medium', 'semibold', 'bold', 'heavy', 'black']
styles = ['normal', 'italic', 'oblique']
```

