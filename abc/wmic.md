---
date: 2020-11-21T21:24:34+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "wmic 命令"  # 文章标题
url:  "posts/ps/abc/wmic"  # 设置网页永久链接
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

## 编辑环境变量

> 尽可能用 cmd 终端运行

### 获取

```shell
wmic ENVIRONMENT where "name='OS'" get UserName, VariableValue
```

## 新增

```shell
wmic ENVIRONMENT create name="test", username="<system>", VariableValue="test"
```

## 修改

```shell
wmic ENVIRONMENT where "name='test' and username='<system>'" set VariableValue="%path%;e:\tools"
```

## 删除

```shell
wmic ENVIRONMENT where "name='test'" delete
```

```shell

```
