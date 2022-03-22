---
date: 2022-03-07T16:28:36+08:00
author: "Rustle Karl"

title: "Chocolatey 基本用法"
url:  "posts/ps/libraries/standard/choco"  # 永久链接
tags: [ "Terminal", "README" ]  # 标签
series: [ "终端学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

Chocolatey 是一款 Windows 软件包管理工具 (可简称为choco)，类似于 macOS 的 [Homebrew](https://mayanote.com/mark/post/homebrew-cheat-sheet)，Ubuntu 的 apt-get。Chocolatey 基于 PowerShell 脚本和 NuGet（微软开发平台的软件包管理器），便于开发者快速安装应用程序和工具，便于开发团队统一开发环境。

- [安装](#安装)
- [使用](#使用)
  - [特性配置](#特性配置)
- [常用软件](#常用软件)
  - [安装目录](#安装目录)
  - [网络代理](#网络代理)
  - [查找软件](#查找软件)
  - [软件管理](#软件管理)
- [结束语](#结束语)

## 安装

首先，使用管理员模式启动 PowerShell。

```shell
Get-ExecutionPolicy
# 如果返回 Restricted 则运行
Set-ExecutionPolicy AllSigned  # 或
Set-ExecutionPolicy Bypass -Scope Process
```

然后，粘贴以下命令到 PowerShell 命令行，按回车键执行安装：

```shell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## 使用

### 特性配置

```shell
choco feature enable -n allowGlobalConfirmation  # 避免每次回答 Y
choco feature enable -name=exitOnRebootDetected  # 不执行重启检测
```

## 常用软件

```shell
choco install -y dart
choco install -y rust
choco install -y nginx
choco install -y msys2
choco install potplayer --proxy=http://localhost:8118

choco install -y curl git nodejs pwsh wget chocolateygui chromedriver golang msys2 cmake 7zip iobit-uninstaller jetbrainstoolbox powertoys

choco install -y powertoys everything

choco uninstall -y msys2

choco upgrade chocolatey  # 升级自身
choco upgrade all  # 全部升级
```

### 安装目录

```shell
# Chocolatey 安装目录
C:\ProgramData\chocolatey

# 通过环境变量设置软件安装目录
[environment]::setEnvironmentVariable('ChocolateyInstall','C:\ProgramData\chocolatey','Machine')
[environment]::setEnvironmentVariable('ChocolateyToolsLocation','D:\Choco','Machine')

# 非管理员安装默认路径是 C:\ProgramData\chocoportable
$env:path += ";C:\ProgramData\chocoportable"
$InstallDir='C:\ProgramData\chocoportable'
$env:ChocolateyInstall="$InstallDir"
```

### 网络代理

Chocolatey 能够自动识别系统代理，或：

```shell
# 通过命令行参数 --proxy 指定代理
choco outdated --proxy=http://localhost:8118
```

```powershell
choco config set proxy http://localhost:8118
choco config set proxyUser root
choco config set proxyPassword root

code C:\ProgramData\chocolatey\config\chocolatey.config
```

### 查找软件

```shell
# 查找软件
choco search 7zip
choco search 7zip.install -all  # 所有版本
```

### 软件管理

```shell
# 安装软件
choco search peazip
choco info peazip  # 查看软件信息
choco install peazip  # 自动安装依赖包 peazip.install
choco install peazip.install  # 安装 peazip.install 最新版
choco install peazip.install --version 7.2.0  # 安装指定版本

# 指定安装位置
choco install fiddler --install-arguments "/D=D:\Choco\fiddler"

# 安装命令行工具与刷新环境变量
choco install nodejs.install  # 缺省安装最新版本
refreshenv  # 刷新环境变量，避免重启终端
node -v  # 确认安装成功

# 一次安装多个包
choco install <package1 package2 package3...>

# 升级安装软件
choco list -l  # 查看已安装软件列表
choco outdated  # 检查是否有可升级版本
choco upgrade nodejs.instlll  # 升级 nodejs
choco upgrade chocolatey  # 升级自身
choco upgrade all  # 全部升级

# 卸载软件
choco uninstall peazip  # 选择 n 保留 peazip.install
choco uninstall peazip.install  # 卸载 peazip.install
```

choco 常用命令的缩写形式：

```shell
cinst ...  # 相当于 choco install ...
cuninst ...  # 相当于 choco uninstall ...
cup <pkg|all>  # 相当于 choco upgrade ...
```

补充：常见的 Chocolatey 软件包有三种类型：

- 无后缀：默认安装 .install 后缀的最新版本的包, 若已安装则跳过。
- .install 后缀: 软件安装后出现在控制面板 “卸载或更改程序” 中。
- .portable 后缀: 软件安装后不会出现在 “卸载或更改程序” 中。

## 结束语

Chocolatey 的安装脚本默认要求管理员权限，对于非高权限用户来说不太友好；通过 Chocolatey 安装程序时，安装目录散落各地，非常乱也不好管理。建议搭配 [Scoop](https://mayanote.com/mark/post/scoop-cheat-sheet) 使用。
