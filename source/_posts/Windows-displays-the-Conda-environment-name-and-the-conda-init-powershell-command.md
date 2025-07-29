---
title: Windows 显示 Conda 环境名称和“conda init powershell”命令
date: 2025-07-29 14:49:03
tags:
- Windows
- Conda
categories:
- Windows
- Conda
hidden:
---



# Windows 显示 Conda 环境名称

Windows 下安装完成 Conda 后，打开`PowerShell`，并不能像 Linux 下那样显示当前的 Conda 环境名称（安装后默认是`base`）。

<!-- more -->

![Windows 默认情况](./Windows-displays-the-Conda-environment-name-and-the-conda-init-powershell-command/image-20250729150148704.png)

## 实现方式

为了实现显示当前环境的效果，在 Windows 的终端上需要执行：

```powershell
conda init powershell
```

执行后，重新打开PowerShell，就能像 Linux 下那样显示当前的 Conda 环境名称。

![执行 conda init powershell 后，重新打开PowerShell](./Windows-displays-the-Conda-environment-name-and-the-conda-init-powershell-command/image-20250729205000629.png)

## 注意事项⚠️

- 确保可执行 Conda 命令，即你的 Conda 程序路径已添加到 Windows 环境变量。

  当下包含 Conda 的安装程序，在安装时勾选 "Add xxx to my PATH environment variable"即可，xxx 代表你的安装程序，我用的是miniforge，当然还有miniconda，Anaconda之类，可能存在些许差异。

![已添加至环境变量](./Windows-displays-the-Conda-environment-name-and-the-conda-init-powershell-command/image-20250729211041670.png)

- 确保可运行脚本

  `conda init powershell` 命令会修改 PowerShell 的启动配置文件 (`profile.ps1`)，使得每次打开 PowerShell 时自动初始化 Conda。Windows 默认情况是下是禁止运行脚本的，需使用如下命令修改策略

  ```powershell
  set-executionpolicy remotesigned
  ```

![修改执行策略](./Windows-displays-the-Conda-environment-name-and-the-conda-init-powershell-command/image-20250729211547257.png)

# 实现原理

执行 `conda init powershell` 时，Conda 会进行以下操作：

1. **配置文件的修改**：Conda 会在 PowerShell 的配置文件（一般是 `$PROFILE`）里添加一段初始化代码。你可以通过在 PowerShell 中输入 `$PROFILE` 来查看该文件的路径。
2. **钩子函数的注册**：添加的初始化代码主要包含一个钩子函数，其作用是在 PowerShell 启动时，自动设置 Conda 的运行环境。
3. **环境变量的动态设置**：当你激活或者退出某个环境时，钩子函数会动态地修改系统的环境变量，确保各种命令能够正确运行。

## 配置文件示例

执行 `conda init powershell` 后，PowerShell 配置文件中会新增类似下面的代码：

```powershell
#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
If (Test-Path "C:\Users\你的用户名\miniforge3\Scripts\conda.exe") {
    (& "C:\Users\你的用户名\miniforge3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | ?{$_} | Invoke-Expression
}
#endregion
```

这段代码的作用是在 PowerShell 启动时，调用 Conda 的钩子函数，从而完成环境的初始化工作。

