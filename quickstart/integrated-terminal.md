---
date: 2020-10-07T15:43:56+08:00  # 创建日期
author: "Rustle Karl"  # 作者
# cover: "/examples/imgs"  # 封面图，可以是相对于 static 的路径，也可以是相对于当前的路径

# 文章
title: "在 Windows Terminal 中集成各种终端"  # 文章标题
description: "包括 Git 等"
url:  "posts/2020/10/07/integrated-terminal"  # 设置网页链接，默认使用文件名
tags: [ "windows terminal", "config"]  # 自定义标签
series: [ "终端学习笔记"]  # 文章主题/文章系列
categories: [ "基础配置"]  # 文章分类

# 章节
weight: 20 # 文章在章节中的排序优先级，正序排序
chapter: false  # 将页面设置为章节

index: true  # 文章是否可以被索引
draft: false  # 草稿
toc: true  # 是否自动生成目录
---

## Git Bash

```json
        {
            "guid": "{b453ae62-4e3d-5e58-b989-0a998ec441b7}",
            "hidden": false,
            "name": "Git Bash",
            "commandline": "c:/program files/git/bin/bash.exe",
            "icon": "c:/program files/git/git_logo.png",
            // 启动菜单，让新建标签页在当前目录
            "startingDirectory": "C:/Users/Admin",
            // 字体及字体大小
            "fontSize": 11,
            "fontFace": "Fira Code Medium"
        },
```
