---
date: 2022-05-14T09:12:25+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "WSL2 安装与配置"  # 文章标题
# description: "文章描述"
url:  "posts/ps/docs/wsl2"  # 设置网页永久链接
tags: [ "windows terminal", "wsl2" ]  # 自定义标签
series: [ "终端学习笔记" ]  # 文章主题/文章系列
categories: [ "基础配置" ]  # 文章分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

## 打开功能

```ps1
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

## 关闭功能

```ps1
DISM /online /disable-feature /featurename:VirtualMachinePlatform /norestart
DISM /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /norestart
```

## 启动虚拟机服务

```ps1
sc config vmms start=auto
sc start vmms
```

## 保持默认值

千万别关了，折腾半天，都想重装系统了。

![](../assets/images/exploit_protection.png)

# WSL2 更新包

```ps1
https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
```

```ps1
wsl --update
```

```ps1
wsl --set-default-version 2
```

其他见 Linux 学习笔记部分 WSL 相关。
