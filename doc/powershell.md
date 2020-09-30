# PowerShell 自定义外观

> 将用户目录下的 Powershell 文件夹复制即可将配置转移。

## Powershell 插件

```ps1
# 安装 PSReadline 包，该插件可以让命令行很好用，类似 zsh
Install-Module -Name PSReadLine -AllowPrerelease -Force

# 安装 posh-git 包，让你的 git 更好用
Install-Module posh-git -Scope CurrentUser

# 安装 oh-my-posh 包，让你的命令行更酷炫、优雅
Install-Module oh-my-posh -Scope CurrentUser
```

## 配置文件

`cfg/Microsoft.PowerShell_profile.ps1`

## 修改启动参数

打开或创建文件 `C:\Users\Admin\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`，也可以通过命令行打开：

```ps1
code $Profile
```

将配置文件内容复制进去即可。
