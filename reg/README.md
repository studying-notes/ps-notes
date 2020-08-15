# 在当前文件夹下打开 Windows Terminal

## 安装

1. [安装 Windows Terminal](https://github.com/microsoft/terminal).
2. [安装 PowerShell 7](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-windows?view=powershell-7).
3. 以**管理员身份**启动 PowerShell 7 控制台，然后运行目录下的 `install.ps1` 脚本，将【上下文菜单项】安装到 Windows 资源管理器。现在，菜单项已添加到 Windows 资源管理器上下文菜单了。

> 如果只运行 `install.ps1` 而不加参数，那么菜单项将以 `Mini` 布局组织，其他布局（ `Default` 和 `Flat`）具有不同的外观，要应用其他布局，只需运行 `install.ps1 Flat`。

## 卸载

以管理员身份，在 PowerShell Core 7 中，执行 `uninstall.ps1 [Default | Flat]` 即可删除该配置。
