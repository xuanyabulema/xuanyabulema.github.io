---
title: Pydicom使用
date: 2022-11-04 15:54:07
tags:
- Python
- Pydicom
categories:
- Python
- Pydicom
hidden:
---

# 简介

Pydicom是一个用于处理[DICOM](https://www.dicomstandard.org/)文件的纯Python包。它可以以一种简单的 "pythonic "方式读取、修改和写入DICOM数据。作为一个纯Python包，Pydicom可以在任何Python运行的地方运行，没有任何其他要求，不过要事先安装[NumPy](http://www.numpy.org/)。

<!-- more -->

# 安装

使用pip

```sh
pip install pydicom
```

使用conda

```sh
conda install -c conda-forge pydicom
```

# *Pixel Data*读取

```python
import pydicom
from pydicom.data import get_testdata_file
import matplotlib.pyplot as plt

path = get_testdata_file("CT_small.dcm")  # 测试数据
ds = pydicom.dcmread(path)
arr = ds.pixel_array  # Pixel Data读取
print(arr.shape)
plt.figure(dpi=200)
plt.imshow(arr, cmap='gray')  # 查看Pixel Data图像
```

# pat属性查询

```python
import pydicom
from pydicom.data import get_testdata_file

path = get_testdata_file("CT_small.dcm")  # 测试数据
dcm = pydicom.dcmread(path)
patient_info = dcm.dir("pat")
print(patient_info)
```

输出

```
['AdditionalPatientHistory', 'DistanceSourceToPatient', 'ImageOrientationPatient', 'ImagePositionPatient', 'OtherPatientIDsSequence', 'PatientAge', 'PatientBirthDate', 'PatientID', 'PatientName', 'PatientPosition', 'PatientSex', 'PatientWeight']
```

# 信息读取

```python
# 通过字典关键字来获取图像的数据元信息（当然也可以根据TAG号）
# 这里获取几种常用信息
import pydicom
from pydicom.data import get_testdata_file

path = get_testdata_file("CT_small.dcm")  # 测试数据
dcm = pydicom.dcmread(path)
info = {}
info["PatientID"] = dcm.PatientID  # 患者ID
info["PatientName"] = dcm.PatientName  # 患者姓名
info["PatientAge"] = dcm.PatientAge  # 患者年龄
# info["PatientBirthData"] = dcm.PatientBirthData # 患者出生日期//测试文件无此项数据 AttributeError: 'FileDataset' object has no attribute 'PatientBirthData'
info['PatientSex'] = dcm.PatientSex  # 患者性别
info['StudyID'] = dcm.StudyID  # 检查ID
info['StudyDate'] = dcm.StudyDate  # 检查日期
info['StudyTime'] = dcm.StudyTime  # 检查时间
info['InstitutionName'] = dcm.InstitutionName  # 机构名称
info['Manufacturer'] = dcm.Manufacturer  # 设备制造商
info['StudyDescription'] = dcm.StudyDescription  # 检查项目描述
print(info)
```

TAG号对应信息查询网站

https://dicom.innolitics.com/ciods/mr-image

```python
# 通过根据TAG号来获取图像的数据元信息
import pydicom
from pydicom.data import get_testdata_file

path = get_testdata_file("CT_small.dcm")  # 测试数据
dcm = pydicom.dcmread(path)
print(dcm[0x0018, 0x0088].value)  # Spacing Between Slices层与层之间的间距，单位：mm
print(dcm[0x0018, 0x0050].value)  # Slice Thickness 单位:mm
print(dcm[0x0020, 0x1041].value)  # 实际的相对位置，单位：mm
print(dcm[0x0008, 0x0060].value)  # Modality  检查的方式（MR/CT/DR/CR）
print(dcm[0x0008, 0x0050].value)  # 检查号（RIS的生成序号，用以识别做检查的次序）
print(dcm[0x0020, 0x0010].value)  # 检查ID
print(dcm[0x0020, 0x000D].value)  # 检查实例号：唯一标记不同的检查号码
print(dcm[0x0008, 0x0020].value)  # 检查日期
print(dcm[0x0008, 0x0030].value)  # 检查时间
# print(dcm[0x0008, 0x103e].value)  # Series Description 检查描述和说明
print(dcm[0x0028, 0x0004].value)  # Photometric Interpretation 色彩空间
print(dcm[0x0028, 0x0100].value)  # Bits Allocated 分配的比特，一个像素所占的空间
print(dcm[0x0028, 0x0030].value)  # Pixel Spacing
print(dcm[0x0028, 0x0010].value)  # Rows
print(dcm[0x0028, 0x0011].value)  # Columns
print(dcm[0x0028, 0x0102].value)  # High Bit
# print(dcm[0x0028, 0x1050].value)  # Window Center
# print(dcm[0x0028, 0x1051].value)  # Window width
# print(dcm[0x0018, 0x0089].value)  # Number of Phase Encoding Steps
# print(dcm[0x0018, 0x0094].value)  # Percent Phase Field of View
# print(dcm[0x0018, 0x1312].value)  # In-plane Phase Encoding Direction
# print(dcm[0x0018, 0x9014].value)  # Phase Contrast
print(dcm[0x0020, 0x0011].value)  #
```
