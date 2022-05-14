---
date: 2020-10-05T18:01:31+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "Windows Terminal 配置"  # 文章标题
url:  "posts/docs/windows_terminal"  # 设置网页链接，默认使用文件名
tags: [ "windows terminal", "config" ]  # 自定义标签
series: [ "终端学习笔记" ]  # 文章主题/文章系列
categories: [ "基础配置" ]  # 文章分类

# 章节
weight: 20 # 文章在章节中的排序优先级，正序排序
chapter: false  # 将页面设置为章节

index: true  # 文章是否可以被索引
draft: false  # 草稿
---

## 集成各种终端

### Git Bash

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

### MSYS2

```json
{
    "guid": "{8fc27f7a-7532-4e48-97cf-7d5df4cc40f0}",
    "hidden": false,
    "acrylicOpacity": 0.5,
    "closeOnExit": true,
    "commandline": "c:/tools/msys64/msys2_shell.cmd -defterm -no-start -use-full-path -here",
    // "commandline" : "c:/tools/msys64/msys2_shell.cmd -defterm -no-start -use-full-path -here -mingw64",
    "cursorColor": "#FD9D4F",
    "cursorShape": "filledBox",
    "fontSize": 12,
    "historySize": 9001,
    "icon": "c:/tools/msys64/msys2.ico",
    "name": "MSYS2",
    "snapOnInput": true,
    "startingDirectory": "C:/Users/Admin",
    "useAcrylic": true,
    "fontFace": "Fira Code Medium"
},
```

- `-mingw64` 指定启动 mingw64，默认 msys2
- `-defterm` 表示启动 bash
- `-no-start` 表示不通过 `start` 命令来启动，我们的目的是要在 Windows Terminal 里输出
- `-use-full-path` 或 `set MSYS2_PATH_TYPE = inherit` 表示，我们在 mingw64 下面的时候, PATH 环境变量的值继承自 Windows 系统的环境变量
- `-here` 就是 `set CHERE_INVOKING = 1`，用于设置默认启动目录参数生效

## 配置文件参考

`src\docs\windows_terminal\Windows.Terminal_profile.json`

## 分栏的打开和关闭快捷键

左右分屏：Alt+Shift+=

上下分屏：Alt+Shift+-

取消分屏：Ctrl+Shift+w

## 在当前文件夹下打开 WT

> Windows 11 之后不打算折腾，直接从任务栏启动

以**管理员身份**启动 **PowerShell 7** 控制台，然后运行 `reg` 目录下的 `install.ps1` 脚本。

> 如果只运行 `install.ps1` 而不加参数，那么菜单项将以 `Mini` 布局组织，其他布局（ `Default` 和 `Flat`）具有不同的外观，要应用其他布局，只需运行 `install.ps1 Flat`。

以管理员身份，在 PowerShell Core 7 中，执行 `uninstall.ps1 [Default | Flat]` 即可删除该配置。
