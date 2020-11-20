---
date: 2020-10-11T22:23:19+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "Powershll 常用命令"  # 文章标题
url:  "posts/ps/doc/skill"  # 设置网页永久链接
tags: [ "powershell", "skills"]  # 标签
series: [ "终端学习笔记"]  # 文章主题/文章系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

## Windows 服务相关

### 服务安装脚本

```cmd
@echo off
rem 强制以管理员身份运行
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

cd /d "%~dp0"

%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\installutil.exe XXXX.exe

Net Start XXXX

sc config XXXX start= auto
```

### 服务卸载脚本

```cmd
@echo off
rem 强制以管理员身份运行
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\installutil.exe /u  XXXX.exe
```

### 设置服务失败不断自启

程序异常退出会不断重启。

```shell
SC failure 服务名 reset= 0 actions= restart/0/restart/0/restart/0
SC failure AAAAAAAAA reset= 0 actions= restart/0/restart/0/restart/0
```

### 删除服务

```shell
SC delete 服务名
SC delete AAAAAAAAA
```

## 打开配置文件

```shell
code $profile
```

## 重载配置文件

```shell
& $profile
```

```shell
. $profile
```

## 允许执行脚本

```shell
set-ExecutionPolicy RemoteSigned
```

## 持续 ping

```shell
ping localhost /t
```

```shell

```

```shell

```

