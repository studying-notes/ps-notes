---
date: 2020-09-19T18:01:31+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "PowerShell 基本配置"  # 文章标题
description: "PowerShell 基本配置"
url:  "posts/ps/docs/powershell"  # 设置网页链接，默认使用文件名
tags: [ "windows", "powershell", "config" ]  # 自定义标签
series: [ "终端学习笔记" ]  # 文章主题/文章系列
categories: [ "基础配置" ]  # 文章分类

# 章节
weight: 20 # 文章在章节中的排序优先级，正序排序
chapter: false  # 将页面设置为章节

index: true  # 文章是否可以被索引
draft: false  # 草稿
---

- [支持 ANSI 颜色显示](#支持-ansi-颜色显示)
  - [Powershell](#powershell)
  - [Cmd](#cmd)
- [暴力迁移](#暴力迁移)
- [Powershell 插件](#powershell-插件)
- [oh my posh](#oh-my-posh)
  - [列出全部主题](#列出全部主题)
  - [设置主题](#设置主题)
- [配置文件](#配置文件)
- [修改启动参数](#修改启动参数)

## 支持 ANSI 颜色显示

### Powershell

```shell
Set-ItemProperty HKCU:\Console VirtualTerminalLevel -Type DWORD 1
```

### Cmd

```shell
reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1
```

## 暴力迁移

> 将用户文档目录中的 Powershell 文件夹复制即可将配置转移。

## Powershell 插件

```ps1
# 安装 PSReadline 包，该插件可以让命令行很好用，类似 zsh
Install-Module -Name PSReadLine -AllowPrerelease -Force

# 安装 posh-git 包，让你的 git 更好用
Install-Module posh-git -Scope CurrentUser
```

## oh my posh

https://ohmyposh.dev/docs/windows

```shell
# choco
cinst oh-my-posh poshgit
cuninst oh-my-posh poshgit
```

### 列出全部主题

```
Get-PoshThemes
```

### 设置主题

```
cd ~/.config
```

```
git clone https://github.com/JanDeDobbeleer/oh-my-posh.git
```

```
oh-my-posh init pwsh --config ~/.config/oh-my-posh/themes/robbyrussel.omp.json | Invoke-Expression
```

```
. $PROFILE
```

## 配置文件

打开配置文件：

```shell
code $profile
```

重载配置文件：

```shell
& $profile
```

## 修改启动参数

打开或创建文件 `C:\Users\Admin\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`，也可以通过命令行打开：

```ps1
code $Profile
```

将配置文件内容复制进去即可。
