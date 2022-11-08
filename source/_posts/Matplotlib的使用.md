---
title: Matplotlib的使用
date: 2022-08-30 19:12:57
tags: 
- Python
- Matplotlib
categories:
- Python
- Matplotlib
hidden:
---

# Matplotlib使用

```python
import matplotlib
```
<!-- more -->

# matplotlib.pyplot使用

```python
import matplotlib.pyplot as plt
```

```python
matpltlib.pyplot.figure(
num = None,               # 设定figure名称。系统默认按数字升序命名的figure_num（透视表输出窗口）e.g. “figure1”。可自行设定figure名称，名称或是INT，或是str类型；
figsize=None,             # 设定figure尺寸。系统默认命令是rcParams["figure.fig.size"] = [6.4, 4.8]，即figure长宽为6.4 * 4.8；
dpi=None,                 # 设定figure像素密度。系统默命令是rcParams["sigure.dpi"] = 100；
facecolor=None,           # 设定figure背景色。系统默认命令是rcParams["figure.facecolor"] = 'w'，即白色white；
# 设定要不要绘制轮廓&轮廓颜色。系统默认绘制轮廓，轮廓染色rcParams["figure.edgecolor"]='w',即白色white；
edgecolor=None, frameon=True,    
FigureClass=<class 'matplotlib.figure.Figure'>,   # 设定使不使用一个figure模板。系统默认不使用；
clear=False,                     # 设定当同名figure存在时，是否替换它。系统默认False，即不替换。
**kwargs)
```





## Figure  AxesImage  AxesSubplot 区别

```python
import matplotlib.pyplot as plt
import numpy as np

# Fixing random state for reproducibility
np.random.seed(19680801)
img = np.random.random((100, 100))
fig = plt.figure(dpi=200)
im = plt.imshow(img, cmap='gray')
ax = plt.gca()
print(fig, im, ax)
```

输出

```python
Figure(1280x960) AxesImage(160,105.6;992x739.2) AxesSubplot(0.125,0.11;0.775x0.77)
```

## pyplot.rcParams属性设置

查看属性

```python
import matplotlib.pyplot as plt

print(plt.rcParams.keys())
```

设置rcParams属性

```python
import matplotlib.pyplot as plt

print(plt.rcParams.keys())
plt.rcParams.update({
    'font.family': 'STSong',  # 用宋体显示中文
    'axes.unicode_minus': 'False',  # 正常显示负号
    'figure.dpi': 200,
    # 'mathtext.fontset': 'stix'
})
```

## 示例

示例一

```python
import matplotlib.pyplot as plt

f, axes = plt.subplots(2, 3, num=f'图片标题')
ax1 = axes[0, 0]
ax2 = axes[0, 1]
ax3 = axes[0, 2]
ax4 = axes[1, 0]
ax5 = axes[1, 1]
ax6 = axes[1, 2]
axes = [ax1, ax2, ax3, ax4, ax5, ax6]
for ax in axes:  # 每个子图设置
    ax.set_xticks([]), ax.set_yticks([])  # 隐藏坐标轴数值
    ax.set_xlim([0, 1])  # s
    ax.set_title('image_title', fontsize=16, fontfamily='sans-serif')
    ax.set_xlabel('image_label', fontsize=14, fontfamily='sans-serif', fontstyle='italic')
```

![示例一](image-20221108225937630.png)

示例二

```python
import numpy as np
import matplotlib.pyplot as plt

# First create some toy data:
x = np.linspace(0, 2 * np.pi, 400)
y = np.sin(x ** 2)
# Create just a figure and only one subplot
fig, ax = plt.subplots()
ax.plot(x, y)
ax.set_title('Simple plot')
# Create two subplots and unpack the output array immediately
f, (ax1, ax2) = plt.subplots(1, 2, sharey=True)
ax1.plot(x, y)
ax1.set_title('Sharing Y axis')
ax2.scatter(x, y)
# Create four polar axes and access them through the returned array
fig, axs = plt.subplots(2, 2, subplot_kw=dict(projection="polar"))
axs[0, 0].plot(x, y)
axs[1, 1].scatter(x, y)
# Share a X axis with each column of subplots
plt.subplots(2, 2, sharex='col')
# Share a Y axis with each row of subplots
plt.subplots(2, 2, sharey='row')
# Share both X and Y axes with all subplots
plt.subplots(2, 2, sharex='all', sharey='all')
# Note that this is the same as
plt.subplots(2, 2, sharex=True, sharey=True)
# Create figure number 10 with a single subplot
# and clears it if it already exists.
fig, ax = plt.subplots(num=10, clear=True)

```

### 散点图

```python
import matplotlib.pyplot as plt

# 分别存放所有点的横坐标和纵坐标，一一对应
x_list = [1, 2, 3, 2]
y_list = [2, 1, 2, 3]
# 创建图并命名
plt.figure('Scatter fig')
ax = plt.gca()
# 设置x轴、y轴名称
ax.set_xlabel('x')
ax.set_ylabel('y')
# 画散点图，以x_list中的值为横坐标，以y_list中的值为纵坐标
# 参数c指定点的颜色，s指定点的大小,alpha指定点的透明度
ax.scatter(x_list, y_list, c='r', s=20, alpha=0.5)
plt.show()
```

<img src="image-20221108230249302.png" alt="散点图" style="zoom: 50%;" />

### 连线图

```python
import matplotlib.pyplot as plt

#分别存放所有点的横坐标和纵坐标，一一对应
x_list = [1, 2, 3, 2]
y_list = [2, 1, 2, 3]
#创建图并命名
plt.figure('Line fig')
ax = plt.gca()
#设置x轴、y轴名称
ax.set_xlabel('x')
ax.set_ylabel('y')
#画连线图，以x_list中的值为横坐标，以y_list中的值为纵坐标
#参数c指定连线的颜色，linewidth指定连线宽度，alpha指定连线的透明度
ax.plot(x_list, y_list, color='r', linewidth=1, alpha=0.6)
plt.show()
```

<img src="image-20221108230326796.png" alt="连线图" style="zoom: 50%;" />

### 直方图

```python
import matplotlib.pyplot as plt
import numpy as np
#数据
x_list = [1, 2, 3, 2]
y_list = [2, 1, 2, 3]
plt.figure('Bar fig')
ax = plt.gca()
ax.set_xlabel('value')
ax.set_ylabel('count')
#每个直方在x轴上的位置，代表着在x轴上的一个（些）绝对的位置，可以是整数或浮点数
xticks = np.arange(1, len(x_list)+1)
#每个直方的宽度
bar_width=0.5
#在xticks指定的位置画y_list指定高度的、width指定宽度的直方图
#edgecolor指定每个直方的边框颜色
#传入的xticks与y_list的长度必须相等！
ax.bar(xticks, y_list, width=bar_width, edgecolor='none')
ax.set_xticks(xticks)
#每个直方下边显示的label，传入的参数为一个列表，列表里可以是数字也可以是字符串
ax.set_xticklabels(x_list)
#横轴的显示范围，该范围小于xticks的范围会造成一部分直方显示不出来
ax.set_xlim(0,len(xticks)+1)
plt.show()
```

<img src="image-20210706201916373.png" alt="直方图" style="zoom: 50%;" />
