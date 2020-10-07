---
date: 2020-09-19T18:01:31+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "PowerShell 自定义外观"  # 文章标题
description: "PowerShell 美化"
url:  "posts/2020/09/19/powershell"  # 设置网页链接，默认使用文件名
tags: [ "windows", "powershell", "config"]  # 自定义标签
series: [ "终端学习笔记"]  # 文章主题/文章系列
categories: [ "基础配置"]  # 文章分类

# 章节
weight: 20 # 文章在章节中的排序优先级，正序排序
chapter: false  # 将页面设置为章节

index: true  # 文章是否可以被索引
draft: false  # 草稿
---

## 暴力迁移

> 将用户目录下的 Powershell 文件夹复制即可将配置转移。

## Powershell 插件

```ps1
# 安装 PSReadline 包，该插件可以让命令行很好用，类似 zsh
Install-Module -Name PSReadLine -AllowPrerelease -Force

# 安装 posh-git 包，让你的 git 更好用
Install-Module posh-git -Scope CurrentUser

# 安装 oh-my-posh 包，让你的命令行更酷炫、优雅
Install-Module oh-my-posh -Scope CurrentUser
```

## 配置文件

`cfg/Microsoft.PowerShell_profile.ps1`

打开配置文件：

```shell
code $profile
```

重载配置文件：

```
& $profile
```

## 修改启动参数

打开或创建文件 `C:\Users\Admin\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`，也可以通过命令行打开：

```ps1
code $Profile
```

将配置文件内容复制进去即可。
