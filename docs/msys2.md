---
date: 2020-10-05T18:01:31+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "MSYS2 安装与配置"  # 文章标题
url:  "posts/ps/docs/msys2"  # 设置网页永久链接
tags: [ "windows terminal", "msys2", "config" ]  # 自定义标签
series: [ "终端学习笔记" ]  # 文章主题/文章系列
categories: [ "基础配置" ]  # 文章分类

# 章节
weight: 20 # 文章在章节中的排序优先级，正序排序
chapter: false  # 将页面设置为章节

index: true  # 文章是否可以被索引
draft: false  # 草稿
---

```shell
choco install --force msys2
```

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

## MSYS2 启用原生链接

code C:\tools\msys64

同样，编辑 `msys2_shell.cmd`，找到 `rem To activate windows native symlinks uncomment next line `这一行， 即去掉 `set MSYS=winsymlinks:nativestrict` 前面的 `rem` 注释：

```
set MSYS=winsymlinks:nativestrict
```

### 创建用户目录链接

```
rm -rf /home/Admin

ln -s /c/Users/Admin /home
```

## MinGW Toolchain

```
pacman -S --needed git base-devel mingw-w64-x86_64-toolchain
```

非原生 Shell 总有一种卡顿的感觉。

## 设置 Fish 为默认 Shell

```shell
pacman -S fish
```

### 卸载

```shell
pacman -R fish
```

```shell
git config --global http.https://github.com.proxy http://127.0.0.1:8118

curl -x localhost:8118 https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

git config --global --unset http.https://github.com.proxy
```

```shell
omf install eclm
omf theme eclm
```

https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md

## 设置 ZSH 为默认 Shell

```shell
pacman -Sy zsh
```

```shell
pacman -R zsh
```

由于 MSYS2 指定 MSYSCON 为 defterm 时默认是执行 `bash`，我们简单地把 `msys2_shell.cmd` 第 5 行的 `bash` 改成 `zsh` 即可：

```shell
set "LOGINSHELL=fish"
```

```shell
sh -c "$(curl -fsSL https://gitee.com/fujiawei/ohmyzsh/raw/master/tools/install.sh)"
```
