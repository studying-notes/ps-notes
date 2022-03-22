---
date: 2020-10-11T22:23:19+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "PowerShell 常用命令"  # 文章标题
url:  "posts/ps/docs/windows_scripts"  # 设置网页永久链接
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

## 打开休眠功能

```shell
powercfg -h on
powercfg /a
```

## 获取文件的 MD5 码

```shell
certutil -hashfile file_path MD5
```

## 重启资源管理器

```shell
taskkill /f /im explorer.exe
explorer.exe
```

## 快速删除大量文件

> cmd 下有效

```shell
DEL /F/Q/S *.*
```

## 正则匹配删除文件

```shell
rmdir -r "c:/path/to/folder/*/*/*.url"
rmdir -r "./*/*.url"
```

```shell
rmdir -r "c:/path/to/folder/*/*/*.txt"
```

## 复制文件夹

```shell
robocopy "e:/OneDrive" "h:/OneDrive" /s /mt:32
```

- /s 复制子目录，但不复制空的子目录
- /e 复制子目录，包括空的子目录
- /b 在备份模式下复制文件
- /xf 排除与给定名称/路径/通配符匹配的文件
- /xd 排除与给定名称/路径匹配的目录
- /mov 移动文件
- /move 移动文件和目录
- /r:3 失败副本的重试次数
- /w:3 两次重试间的等待时间
- /eta 显示复制文件的预期到达时间
- /mt:32 启动多线程任务

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
