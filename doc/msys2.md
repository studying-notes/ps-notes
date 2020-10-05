---
date: 2020-10-05T18:01:31+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "Windows Terminal 集成 MSYS2"  # 文章标题
description: "在 Windows Terminal 集成各类终端"
url:  "posts/2020/10/05/msys2"  # 设置网页链接，默认使用文件名
tags: [ "windows terminal", "msys2", "config"]  # 自定义标签
series: [ "终端学习笔记"]  # 文章主题/文章系列
categories: [ "基础配置"]  # 文章分类

# 章节
weight: 20 # 文章在章节中的排序优先级，正序排序
chapter: false  # 将页面设置为章节

index: true  # 文章是否可以被索引
draft: false  # 草稿
---

```url
https://repo.msys2.org/distrib/x86_64/msys2-x86_64-20200903.exe
```

## 新建 MSYS2 配置

{{< code language="json" title="配置示例" id="1" expand="" collapse="" isCollapsed="false" >}}
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
{{< /code >}}

- `-mingw64` 指定启动 mingw64，默认 msys2
- `-defterm` 表示启动 bash
- `-no-start` 表示不通过 `start` 命令来启动，我们的目的是要在 Windows Terminal 里输出
- `-use-full-path` 或 `set MSYS2_PATH_TYPE = inherit` 表示，我们在 mingw64 下面的时候, PATH 环境变量的值继承自 Windows 系统的环境变量
- `-here` 就是 `set CHERE_INVOKING = 1`，用于设置默认启动目录参数生效

## MSYS2 镜像配置

进入安装目录的 `etc/pacman.d` 修改其中的三个文件：

`mirrorlist.mingw32`

```ini
##
## 32-bit Mingw-w64 repository mirrorlist
##

## Primary
## 清华大学软件镜像
Server = https://mirrors.tuna.tsinghua.edu.cn/msys2/mingw/i686/
## 中科大镜像
Server = http://mirrors.ustc.edu.cn/msys2/mingw/i686/
## msys2.org
Server = http://repo.msys2.org/mingw/i686/
Server = https://sourceforge.net/projects/msys2/files/REPOS/MINGW/i686/
Server = https://www2.futureware.at/~nickoe/msys2-mirror/mingw/i686/
Server = https://mirror.yandex.ru/mirrors/msys2/mingw/i686/
Server = https://mirrors.tuna.tsinghua.edu.cn/msys2/mingw/i686
Server = http://mirrors.ustc.edu.cn/msys2/mingw/i686
Server = http://mirror.bit.edu.cn/msys2/REPOS/MINGW/i686
```

`mirrorlist.mingw64`

```ini
##
## 64-bit Mingw-w64 repository mirrorlist
##

## Primary
## 清华大学软件镜像
Server = https://mirrors.tuna.tsinghua.edu.cn/msys2/mingw/x86_64/
## 中科大镜像
Server = http://mirrors.ustc.edu.cn/msys2/mingw/x86_64/
## msys2.org
Server = http://repo.msys2.org/mingw/x86_64/
Server = https://sourceforge.net/projects/msys2/files/REPOS/MINGW/x86_64/
Server = https://www2.futureware.at/~nickoe/msys2-mirror/mingw/x86_64/
Server = https://mirror.yandex.ru/mirrors/msys2/mingw/x86_64/
Server = https://mirrors.tuna.tsinghua.edu.cn/msys2/mingw/x86_64
Server = http://mirrors.ustc.edu.cn/msys2/mingw/x86_64
Server = http://mirror.bit.edu.cn/msys2/REPOS/MINGW/x86_64
```

`mirrorlist.msys`

```ini
##
## MSYS2 repository mirrorlist
##

## Primary
## 清华大学软件镜像
Server = https://mirrors.tuna.tsinghua.edu.cn/msys2/msys/$arch
## 中科大镜像
Server = http://mirrors.ustc.edu.cn/msys2/msys/$arch
## msys2.org
Server = http://repo.msys2.org/msys/$arch/
Server = https://sourceforge.net/projects/msys2/files/REPOS/MSYS2/$arch/
Server = https://www2.futureware.at/~nickoe/msys2-mirror/msys/$arch/
Server = https://mirror.yandex.ru/mirrors/msys2/msys/$arch/
Server = https://mirrors.tuna.tsinghua.edu.cn/msys2/mingw/$arch/
Server = http://mirrors.ustc.edu.cn/msys2/msys/$arch
Server = http://mirror.bit.edu.cn/msys2/REPOS/MSYS2/$arch
```

然后更新系统：

```shell
pacman -Syu
```

## 设置 ZSH 为默认 Shell

```shell
pacman -S zsh
```

由于 MSYS2 指定 MSYSCON 为 defterm 时默认是执行 `bash`，我们简单地把 `msys2_shell.cmd` 第 5 行的 `bash` 改成 `zsh` 即可：

```shell
set "LOGINSHELL=zsh"
```

```shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## MSYS2 启用原生链接

同样，编辑 `msys2_shell.cmd`，找到 `rem To activate windows native symlinks uncomment next line `这一行， 即去掉 `set MSYS=winsymlinks:nativestrict` 前面的 `rem` 注释：

```
set MSYS=winsymlinks:nativestrict
```

## ZSH 实现 Fish Shell 的效果

```shell
mkdir -p ~/.zsh/plugins
```

```shell
git clone git://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/plugins/zsh-autosuggestions
```

设置 `.zshrc` 中的 `$ZSH_CUTOM` 变量

```ini
ZSH_CUSTOM=~/.zsh
plugins=(git zsh-autosuggestions)
```
