---
date: 2022-03-09T19:41:36+08:00
author: "Rustle Karl"

title: "Scoop 基本用法"
url:  "posts/ps/libraries/standard/scoop"  # 永久链接
tags: [ "Terminal", "README" ]  # 标签
series: [ "终端学习笔记" ]  # 系列
categories: [ "学习笔记" ]  # 分类

toc: true  # 目录
draft: false  # 草稿
---

## 安装

```shell
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

# or shorter
iwr -useb get.scoop.sh | iex
```

## 卸载

实在是污染环境变量，不好用

```shell
scoop uninstall scoop
```

### 多线程下载

```shell
scoop install sudo -g
scoop install aria2 -g
```

-g 表示全局安装

https://github.com/ScoopInstaller/Scoop/wiki/Using-Scoop-behind-a-proxy

```shell
scoop config proxy localhost:8118
```

```shell
scoop config rm proxy
```

```shell
scoop bucket add versions
scoop install tdm-gcc -g
```


### 三级


## 二级

### 三级

```shell
scoop update # 更新 Scoop 自身

scoop update appName1 appName2 # 更新某些app

# 更新所有 app （可能需要在apps目录下操作）
scoop update *

# 禁止某程序更新
scoop hold <app>
# 允许某程序更新
scoop unhold <app>
```


## 二级

### 三级

```shell

```

```shell

```


## 二级

### 三级

```shell

```

```shell

```


## 二级

### 三级

```shell

```

```shell

```


