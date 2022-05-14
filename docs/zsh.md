---
date: 2021-01-02T09:12:25+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "Zsh 安装与配置"  # 文章标题
url:  "posts/ps/docs/zsh"  # 设置网页永久链接
tags: [ "windows terminal", "ohmyzsh" ]  # 自定义标签
series: [ "终端学习笔记" ]  # 文章主题/文章系列
categories: [ "基础配置" ]  # 文章分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

> 兼容性确实好，但是提示功能不如 Fish。

```shell
apt install zsh -y
```

## 安装 oh-my-zsh

```shell
git config --global http.https://github.com.proxy http://192.168.0.12:7890

sh -c "$(curl -x http://192.168.0.12:7890 -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git config --global --unset http.https://github.com.proxy
```

## 插件

```shell
mkdir -p ~/.zsh/plugins
```

### Fish-Like 输入自动建议

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/plugins/zsh-autosuggestions
```

### 自动填补命令

```shell
git clone https://github.com/zsh-users/zsh-completions ~/.zsh/plugins/zsh-completions
```

### 语法高亮

```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting
```

## 让插件生效

设置 `.zshrc` 中的 `$ZSH_CUTOM` 变量

`~/.zshrc`


```ini
vim ~/.zshrc
```

```ini
ZSH_CUSTOM=~/.zsh
plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)
autoload -U compinit && compinit
```

------------------------------------------------------------------------------------------------

## 安装 Oh My Posh

```shell
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh

chmod +x /usr/local/bin/oh-my-posh
```

```shell
eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/themes/robbyrussel.omp.json)"

exec bash

. ~/.profile
```

## ZSH

```shell
vim ~/.zshrc

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/robbyrussel.omp.json)"

source ~/.zshrc
```
