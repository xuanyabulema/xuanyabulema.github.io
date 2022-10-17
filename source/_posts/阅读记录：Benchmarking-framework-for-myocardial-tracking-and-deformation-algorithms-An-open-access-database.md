---
title: >-
  阅读记录：Benchmarking framework for myocardial tracking and deformation
  algorithms: An open access database
date: 2022-10-15 21:52:54
tags:
- Notes
categories:
- Notes
hidden:
---

# 前言

阅读完的文献时间久了容易忘了，而且再次阅读时常因为原文是英文，回顾起来也没有那么顺利，于是想到在第一次阅读时，在翻译软件 的基础上进行修改并记录。

# DOI: [10.1016/j.media.2013.03.008](https://doi.org/10.1016/j.media.2013.03.008)

<!-- more -->

# **Abstract:**

In this paper we present a benchmarking framework for the validation of cardiac motion analysis algorithms. The reported methods are the response to an open challenge that was issued to the medical imaging community through a MICCAI workshop. The database included magnetic resonance (MR) and 3D ultrasound (3DUS) datasets from a dynamic phantom and 15 healthy volunteers. Participants processed 3D tagged MR datasets (3DTAG), cine steady state free precession MR datasets (SSFP) and 3DUS datasets, amounting to 1158 image volumes. Ground-truth for motion tracking was based on 12 landmarks (4 walls at 3 ventricular levels). They were manually tracked by two observers in the 3DTAG data over the whole cardiac cycle, using an in-house application with 4D visualization capabilities. The median of the inter-observer variability was computed for the phantom dataset (0.77 mm) and for the volunteer datasets (0.84 mm). The ground-truth was registered to 3DUS coordinates using a point based similarity transform. Four institutions responded to the challenge by providing motion estimates for the data: Fraunhofer MEVIS (MEVIS), Bremen, Germany; Imperial College London - University College London (IUCL), UK; Universitat Pompeu Fabra (UPF), Barcelona, Spain; Inria-Asclepios project (INRIA), France. Details on the implementation and evaluation of the four methodologies are presented in this manuscript. The manually tracked landmarks were used to evaluate tracking accuracy of all methodologies. For 3DTAG, median values were computed over all time frames for the phantom dataset (MEVIS = 1.20 mm, IUCL = 0.73 mm, UPF = 1.10 mm, INRIA = 1.09 mm) and for the volunteer datasets (MEVIS = 1.33 mm, IUCL = 1.52 mm, UPF = 1.09 mm, INRIA = 1.32 mm). For 3DUS, median values were computed at end diastole and end systole for the phantom dataset (MEVIS = 4.40 mm, UPF = 3.48 mm, INRIA = 4.78 mm) and for the volunteer datasets (MEVIS = 3.51 mm, UPF = 3.71 mm, INRIA = 4.07 mm). For SSFP, median values were computed at end diastole and end systole for the phantom dataset(UPF = 6.18 mm, INRIA = 3.93 mm) and for the volunteer datasets (UPF = 3.09 mm, INRIA = 4.78 mm). Finally, strain curves were generated and qualitatively compared. Good agreement was found between the different modalities and methodologies, except for radial strain that showed a high variability in cases of lower image quality.

在本文中，我们提出了一个用于验证心脏运动分析算法的基准框架。所报告的方法是对通过MICCAI研讨会向医学影像界发出的一项公开挑战的回应。该数据库包括来自一个动态模型和15名健康志愿者的磁共振（MR）和三维超声（3DUS）数据集。参与者处理了三维标记的磁共振数据集（3DTAG）、平扫稳态自由前行磁共振数据集（SSFP）和三维超声数据集，共1158个图像卷。运动追踪的Ground-truth是基于12个标记（landmarks）（3个心室水平的4个室壁）。它们是由两名观察者在整个心动周期的3DTAG数据中手动追踪的，使用的是具有4D可视化功能的内部应用程序。观察者之间的变异性（variability）的中位数被计算出来，用于模型数据集（0.77毫米）和志愿者数据集（0.84毫米）。使用基于点的相似性转换，将Ground-truth配准到3DUS的坐标上。四个机构响应挑战，提供了数据的运动估计。德国不来梅的Fraunhofer MEVIS（MEVIS）；英国伦敦帝国学院-伦敦大学学院（IUCL）；西班牙巴塞罗那庞培法布拉大学（UPF）；法国Inria-Asclepios项目（INRIA）。关于这四种方法的实施和评估的细节在本手稿中介绍。手动追踪的标记被用来评估所有方法的追踪准确性。对于3DTAG，在所有的时间框架内计算了模型数据集（MEVIS = 1.20 mm, IUCL = 0.73 mm, UPF = 1.10 mm, INRIA = 1.09 mm）和志愿者数据集（MEVIS = 1.33 mm, IUCL = 1.52 mm, UPF = 1.09 mm, INRIA = 1.32 mm）的中值。对于3DUS，在舒张末期和收缩末期计算了模型数据集（MEVIS=4.40 mm，UPF=3.48 mm，INRIA=4.78 mm）和志愿者数据集（MEVIS=3.51 mm，UPF=3.71 mm，INRIA=4.07 mm）的中值。对于SSFP，计算了模型数据集（UPF=6.18 mm，INRIA=3.93 mm）和志愿者数据集（UPF=3.09 mm，INRIA=4.78 mm）在舒张末期和收缩末期的中值。最后，生成了应变曲线并进行了定性比较。在不同的模式和方法之间发现了良好的一致性，除了在图像质量较低的情况下，径向应变显示出较高的变异性。

# **Highlights**

Benchmarking framework for cardiac motion analysis algorithms.

Multimodal database (MR and 3DUS) of a dynamic phantom and 15 volunteers.

Comparison of four groups who responded to an open challenge in MICCAI.

Ground-truth based on manually tracked landmarks.

All data are publicly available for download.

心脏运动分析算法的基准框架。

一个动态模型和15名志愿者的多模态数据库（MR和3DUS）。

对四组响应MICCAI公开挑战的人进行比较。

基于人工跟踪的地标的地面实况。

所有数据均可公开下载。

# State of the art

> State of the art 科技水平(在当前或某指定的时间，某一领域或某项工业的科学技术发展水平)，也即研究现状
>
> 本文中指 目前为止最好的（算法）

Direct methods: The first category includes all methods that first detect features and further quantify motion and strain (see first block of Fig. 3). These methods were applied to 3DTAG images by detecting tag lines and tag intersections. Fiducial markers can also be used in other modalities (e.g. cine MR) although the set of markers is likely to be too sparse for any detailed motion and strain analysis. 3DTAG images can be locally filtered to analyze the spatial frequencies and orientation of the tagging pattern. One example is the use of Gabor filters to derive strain directly. Although these methods avoid artifacts or excessive smoothing potentially induced by image registration, the computation of strain values per material points requires motion along the cycle to be quantified.

直接方法。第一类包括所有首先检测特征并进一步量化运动和应变的方法（见图3的第一块）。这些方法通过检测标记线和标记交叉点应用于3DTAG图像。靶标也可用于其他模式（如cine MR），尽管对于任何详细的运动和应变分析来说，靶标集可能过于稀疏。3DTAG图像可以被局部过滤以分析标记模式的空间频率和方向。一个例子是使用Gabor滤波器来直接得出应变。尽管这些方法避免了图像登记可能引起的伪影或过度平滑，但每个材料点的应变值的计算需要沿周期的运动进行量化。

Fourier-based methods: The second category is based on the property that a local shift in the spatial domain corresponds to a phase shift in the Fourier domain. Several methods (see second block of Fig. 3) exploit this property by moving to the Fourier domain for locally quantifying the displacement field. Harmonic phases (HARP)-based techniques are a subset of this category and are restricted to the processing of tagged MR images. HARP models tagged MR images as the result of an amplitude modulation by a set of harmonics. For each harmonic, the complex phase of one material point is constant over the cardiac cycle. By doing band-pass filtering in the Fourier domain and coming back to the spatial domain, HARP images are computed. Displacement can then be calculated by division of space shift over phase gradient. The sinMod algorithm (Arts et al., 2010) is based on a similar concept as HARP. Next to computing a local phase shift, sinMod also computes local spatial frequency. The latter can be used for strain estimation in a similar manner as Gabor-based techniques.

基于傅里叶的方法。第二类是基于空间域的局部移动对应于傅里叶域的相位移动这一特性。一些方法（见图3的第二部分）通过移动到傅里叶域对位移场进行局部量化来利用这一特性。基于谐波相位（HARP）的技术是这个类别的一个子集，仅限于处理有标签的MR图像。HARP将被标记的MR图像建模为一组谐波的振幅调制的结果。对于每个谐波，一个材料点的复数相位在整个心动周期内是恒定的。通过在傅里叶域做带通滤波并回到空间域，HARP图像被计算出来。然后可以通过空间位移除以相位梯度来计算位移。sinMod算法（Arts等人，2010）是基于与HARP类似的概念。除了计算局部相移，sinMod还计算局部空间频率。后者可以以类似于基于Gabor的技术的方式用于应变估计。

Tracking-based methods: The third category (tracking-based approaches) solves for the displacement in the spatial domain by optimizing similarity between frame-to-frame intensities. Fig. 3 (third block) orders tracking-based methods following their transformation model. Spatial derivatives of the transformation yield strain estimates. In the case of Demons-based or block matching approaches, a spatial regularization is performed at each step to ensure smooth strain results. For other transformation models, transformation spatial derivatives can be obtained analytically.

基于跟踪的方法。第三类（基于跟踪的方法）通过优化帧与帧之间的强度相似性来解决空间域的位移问题。图3（第三块）将基于跟踪的方法按照其变换模型排序。变换的空间导数产生应变估计。在基于Demons或块状匹配的方法中，每一步都要进行空间正则化以确保应变结果的平稳。对于其他转换模型，转换的空间导数可以通过分析得到。

![Classification of motion and strain quantification methods from cine MR, 3DTAG and 3DUS images. The methods evaluated in this paper are written in bold format. ](1-s2.0-S1361841513000388-gr3_lrg-16657543645012.jpg)
