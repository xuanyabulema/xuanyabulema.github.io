---
title: Matplotlib 绘图效果改进
date: 2023-08-23 16:07:29
tags:
- Python
- Matplotlib
categories:
- Python
- Matplotlib
hidden:
---



# 前言

众所周知 Matplotlib 是个优秀的可视化工具，同时在 Matplotlib 中慢慢调细节也是件耗费精力的事。例如，中文的正常显示（而不是方块）、样式的细致调节等。

针对上述问题，包 [mplfonts](http://clarmy.net/2022/04/10/how-to-solve-tofu-in-matplotlib/) 优雅的解决了中文显示问题，包 [SciencePlots ](https://github.com/garrettj403/SciencePlots) 提供了优美的科研绘图样式。

<!-- more -->

# 借助 [mplfonts](http://clarmy.net/2022/04/10/how-to-solve-tofu-in-matplotlib/) 优雅解决中文显示问题

## 安装

```sh
pip install mplfonts
```

## 快速设置

安装完成之后，你只需要执行一条简单的命令就可以快速解决中文渲染出现“豆腐块”的问题：

```sh
mplfonts init
```

## 使用示例

```python
import matplotlib.pyplot as plt
from mplfonts import use_font

FONT_NAMES = {
    'Noto Sans Mono CJK SC': 'Noto等宽',
    'Noto Serif CJK SC': 'Noto宋体',
    'Noto Sans CJK SC': 'Noto黑体',
    'Source Han Serif SC': '思源宋体',
    'Source Han Mono SC': '思源等宽',
    'SimHei': '微软雅黑'
}

def test_chinese():
    for font_name, desc in FONT_NAMES.items():
        use_font(font_name)  # 使用use_font设置
        fig = plt.figure(figsize=(4, 1))
        
        ax = plt.Axes(fig, [0., 0., 1., 1.]) 
        ax.set_axis_off()  
        fig.add_axes(ax)
        
        plt.text(.1, .6, font_name, fontsize=20)
        plt.text(.1, .2, desc, fontsize=20)

        plt.show()

test_chinese()
```



# 借助 [SciencePlots](https://github.com/garrettj403/SciencePlots) 进行优美的科研绘图

