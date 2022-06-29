---
date: 2022-03-10T09:12:21+08:00
author: "Rustle Karl"

title: "Windows 启动 OpenSSH 服务"
url:  "posts/ps/tools/openssh"
tags: [ "Terminal", "README" ]
categories: [ "终端学习笔记" ]

toc: true  # 目录
draft: false  # 草稿
---

## Windows

https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse

### Install OpenSSH using PowerShell

```shell
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'
```

```shell
# Install the OpenSSH Client
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

# Install the OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
```

### Start and configure OpenSSH Server

```shell
# Start the sshd service
Start-Service sshd

# OPTIONAL but recommended:
Set-Service -Name sshd -StartupType 'Automatic'

# Confirm the Firewall rule is configured. It should be created automatically by setup. Run the following to verify
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
}
```
邮箱登录的联网账号，用户为邮箱@之前的字符串，密码为账号密码。
