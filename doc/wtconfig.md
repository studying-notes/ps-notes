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

## 在当前文件夹下打开 WT

以**管理员身份**启动 PowerShell 7 控制台，然后运行目录下的 `install.ps1` 脚本。

> 如果只运行 `install.ps1` 而不加参数，那么菜单项将以 `Mini` 布局组织，其他布局（ `Default` 和 `Flat`）具有不同的外观，要应用其他布局，只需运行 `install.ps1 Flat`。

以管理员身份，在 PowerShell Core 7 中，执行 `uninstall.ps1 [Default | Flat]` 即可删除该配置。

## WT 配置文件

{{< code language="json" title="部分展示 cfg/Windows.Terminal_profile.json" id="1" expand="" collapse="" isCollapsed="true" >}}
{
    "$schema": "https://aka.ms/terminal-profiles-schema",
    // 关闭多行粘贴警告
    "multiLinePasteWarning": false,
    // 确认关闭全部标签页
    "confirmCloseAllTabs": false,
    "alwaysShowTabs": true,
    "defaultProfile": "{2c4de342-38b7-51cf-b940-2309a097f518}",
    // "defaultProfile": "{574e775e-4f2a-5b96-ac1e-a2962a402336}",
    "theme": "dark",
    // 窗口大小调整行为
    "snapToGridOnResize": true,
    "initialCols": 90, //终端窗口初始宽度
    "initialRows": 30, //终端窗口初始高度
    // "tabWidthMode": "titleLength", // 选项卡宽度模式
    "profiles": [
        {
            "guid": "{2c4de342-38b7-51cf-b940-2309a097f518}",
            "hidden": false,
            "name": "Ubuntu",
            "source": "Windows.Terminal.Wsl",
            // 启动菜单，让新建标签页在当前目录
            "startingDirectory": "D:/Dropbox/reps",
            // 字体及字体大小
            "fontSize": 11,
            "fontFace": "Fira Code Medium"
        },
        {
            "guid": "{8fc27f7a-7532-4e48-97cf-7d5df4cc40f0}",
            "hidden": false,
            "acrylicOpacity": 0.5,
            "closeOnExit": true,
            "commandline": "c:/developer/msys64/msys2_shell.cmd -defterm -no-start -use-full-path -here",
            // "commandline" : "c:/developer/msys64/msys2_shell.cmd -defterm -no-start -use-full-path -here -mingw64",
            "cursorColor": "#FD9D4F",
            "cursorShape": "filledBox",
            "fontSize": 12,
            "historySize": 9001,
            "icon": "c:/developer/msys64/msys2.ico",
            "name": "MSYS2",
            "snapOnInput": true,
            "startingDirectory": "D:/Dropbox/reps",
            "useAcrylic": true,
            "fontFace": "Fira Code Medium"
        },
        {
            "guid": "{574e775e-4f2a-5b96-ac1e-a2962a402336}",
            "hidden": false,
            "name": "PowerShell Core",
            // -nologo，防止开启时输出一段话
            "commandline": "C:/Program Files/PowerShell/7/pwsh.exe -nolog",
            "source": "Windows.Terminal.PowershellCore",
            // 启动菜单，让新建标签页在当前目录
            "startingDirectory": "D:/OneDrive/Repositories",
            // 字体
            "fontFace": "Fira Code Medium",
            "fontSize": 11,
            "historySize": 9001,
            // "padding": "5, 5, 20, 25",
            "snapOnInput": true,
            // "colorScheme": "Mathias",
            "useAcrylic": false
        },
    "keybindings": [
        {
            "command": "closeTab",
            "keys": [
                "alt+w"
            ]
        }
    ]
}
{{< /code >}}
