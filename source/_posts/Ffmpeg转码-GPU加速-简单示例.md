---
title: FFmpeg转码 GPU加速 简单示例
date: 2022-05-25 20:38:43
tags: FFmpeg
categories: FFmpeg
hidden: 
---

# FFmpeg转码 GPU加速 简单示例

> 常见的h264, hevc(h265)格式视频为例

<!-- more -->

## Nvidia GPU加速转码

通过 `h264_cuvid`、 `hevc_cuvid`和 `h264_nvenc`、 `hevc_nvenc`参数来加速`h264`和`hevc`解码和编码。

一、不指定原视频解码加速方式

`-c:v hevc_nvenc`加速`hevc`格式编码

```shell
ffmpeg -i input.mp4 -c:v hevc_nvenc -b:v 1024k output_265_gpu.mp4
```

二、指定原视频解码加速方式

`h264`编码格式转`hevc`编码格式示例

`-c:v h264_cuvid`指定加速`h264`格式视频解码，`-c:v hevc_nvenc`加速`hevc`格式编码

```shell
ffmpeg -c:v h264_cuvid -i input.mp4 -c:v hevc_nvenc -b:v 1024k output_265_gpu.mp4
```

`hevc`编码格式转`h264`编码格式示例

`-c:v hevc_cuvid`指定加速`hevc`格式视频解码，`-c:v h264_nvenc`加速`h264`格式编码

```shell
ffmpeg -c:v hevc_cuvid -i input.mp4 -c:v h264_nvenc -b:v 2048k output_264_gpu.mp4
```

## Intel GPU加速转码

通过 `h264_qsv`、 `hevc_qsv`来加速`h264`和`hevc`解码和编码。

不同于Nvidia GPU加速参数，Intel GPU加速解码与编码参数一样。

替换上述Nvidia GPU参数即可实现Intel GPU加速转码。
