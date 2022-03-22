---
date: 2020-10-05T18:01:31+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "Windows Terminal 配置"  # 文章标题
description: "Windows Terminal 配置文件、在当前文件夹下打开 Windows Terminal"
url:  "posts/2020/10/05/wtconfig"  # 设置网页链接，默认使用文件名
tags: [ "windows terminal", "config"]  # 自定义标签
series: [ "终端学习笔记"]  # 文章主题/文章系列
categories: [ "基础配置"]  # 文章分类

# 章节
weight: 20 # 文章在章节中的排序优先级，正序排序
chapter: false  # 将页面设置为章节

index: true  # 文章是否可以被索引
draft: false  # 草稿
---

## 分栏的打开和关闭快捷键

左右分屏：Alt+Shift+=

上下分屏：Alt+Shift+-

取消分屏：Ctrl+Shift+w

## 在当前文件夹下打开 WT

以**管理员身份**启动 **PowerShell 7** 控制台，然后运行 `reg` 目录下的 `install.ps1` 脚本。

> 如果只运行 `install.ps1` 而不加参数，那么菜单项将以 `Mini` 布局组织，其他布局（ `Default` 和 `Flat`）具有不同的外观，要应用其他布局，只需运行 `install.ps1 Flat`。

以管理员身份，在 PowerShell Core 7 中，执行 `uninstall.ps1 [Default | Flat]` 即可删除该配置。
