---
title: matplotlib.pyplot的使用
date: 2022-08-30 19:12:57
tags: 
- Python
- matplotlib.pyplot
categories:
- Python
- matplotlib.pyplot
hidden:
---

# matplotlib.pyplot的使用

```python
pass
```

<!-- more -->

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
