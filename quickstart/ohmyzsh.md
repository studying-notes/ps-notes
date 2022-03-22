---
date: 2021-01-02T09:12:25+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "ZSH 实现 Fish Shell 的效果"  # 文章标题
# description: "文章描述"
url:  "posts/ps/doc/ohmyzsh"  # 设置网页永久链接
tags: [ "windows terminal", "msys2", "ohmyzsh"]  # 自定义标签
series: [ "终端学习笔记"]  # 文章主题/文章系列
categories: [ "基础配置"]  # 文章分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

## 插件

### 根据类似情况显示提示

```shell
mkdir -p ~/.zsh/plugins
```

```shell
git clone https://gitee.com/fujiawei/zsh-autosuggestions.git ~/.zsh/plugins/zsh-autosuggestions
```

设置 `.zshrc` 中的 `$ZSH_CUTOM` 变量

`~/.zshrc`

```ini
ZSH_CUSTOM=~/.zsh
plugins=(git zsh-autosuggestions)
```

### 自动填补命令

```shell
git clone https://gitee.com/fujiawei/zsh-completions.git ~/.zsh/plugins/zsh-completions
```

```ini
ZSH_CUSTOM=~/.zsh
plugins=(git zsh-autosuggestions zsh-completions)
```

### 语法高亮

```shell
git clone https://gitee.com/fujiawei/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting
```

```ini
ZSH_CUSTOM=~/.zsh
plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)
autoload -U compinit && compinit
```
