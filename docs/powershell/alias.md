---
date: 2020-11-21T21:24:34+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "设置 PowerShell 别名"  # 文章标题
url:  "posts/ps/docs/powershell/alias"  # 设置网页永久链接
tags: [ "powershell", "script"]  # 标签
series: [ "终端学习笔记"]  # 文章主题/文章系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

## 设置别名

显示全部\别名 - `get-alias` / `gal`

```powershell
? -> Where-Object
cat -> Get-Content
cd -> Set-Location
chdir -> Set-Location
clear -> Clear-Host
cls -> Clear-Host
copy -> Copy-Item
cp -> Copy-Item
del -> Remove-Item
diff -> Compare-Object
ls -> Get-ChildItem
md -> mkdir
move -> Move-Item
mv -> Move-Item
rd -> Remove-Item
rm -> Remove-Item
rmdir -> Remove-Item
sleep -> Start-Sleep
sort -> Sort-Object
where -> Where-Object
```

## 创建永久别名

1. 找到配置文件位置

```powershell
> $profile
C:\Users\Admin\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

# 没有就创建
> New-Item -Type file -Force $profile
```

2. 创建别名

```powershell
function GetFileName {
    Get-ChildItem -Name
}

Set-Alias ll GetFileName
```
