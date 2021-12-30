<#
 * FileName: Microsoft.PowerShell_profile.ps1
 * Author: Rustle Karl
 * Email: fu.jiawei@outlook.com
 * Date: 2020.08.07
 * Copyright: No copyright. You can use this code for anything with no warranty.
#>


#------------------------------- Import Modules BEGIN -------------------------------
# 引入 posh-git
Import-Module posh-git

# 引入 oh-my-posh
Import-Module oh-my-posh

# 设置 PowerShell 主题
# Set-Theme Paradox
# Set-Theme Sorin
Set-Theme robbyrussell
#------------------------------- Import Modules END   -------------------------------


#-------------------------------  Set Hot-keys BEGIN  -------------------------------
# 设置 Tab 键补全
Set-PSReadlineKeyHandler -Key "Tab" -Function Complete

# 设置 Tab 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete

# 设置 Ctrl+d 为退出 PowerShell
Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function ViExit

# 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo

# 设置向上键为后向搜索历史记录
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward

# 设置向下键为前向搜索历史纪录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# 类似 Fish Shell 的输入提示
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function ForwardWord
#-------------------------------  Set Hot-keys END    -------------------------------


#-------------------------------   Set Alias BEGIN     -------------------------------

# 查看目录 ls & ll
function ListDirectory {
    (Get-ChildItem).Name
    Write-Host("")
}
Set-Alias -Name ls -Value ListDirectory
Set-Alias -Name ll -Value Get-ChildItem

Set-Alias -Name py -Value python

# pwd 显示当前目录
Set-Alias -Name pwd -Value Get-Location

# ffmpeg 默认覆盖文件，不输出标语
function MFFmpeg { ffmpeg.exe $args -hide_banner -y }
Set-Alias -Name ffmpeg -Value MFFmpeg

function MFFprobe { ffprobe.exe -hide_banner $args }
Set-Alias -Name ffprobe -Value MFFprobe

# get git-repo
function GitClone { git.exe clone $args }
Set-Alias -Name get -Value GitClone

# gcmt git commit -m "args"
function GitCommit { git.exe commit -m $args }
Set-Alias -Name gcmt -Value GitCommit

# gst git status
function GitStatus { git.exe status }
Set-Alias -Name gst -Value GitStatus

# gh git hist
function GitHistory { git.exe hist }
Set-Alias -Name gh -Value GitHistory

# hugo new
function HugoNew { hugo.exe new -s D:\OneDrive\Repositories\notes $args }
Set-Alias -Name hn -Value HugoNew

# hugo server
function HugoServer {
    cd D:\OneDrive\Repositories\notes
    hugo.exe server
}
Set-Alias -Name hs -Value HugoServer

# MD5
function MD5File {
    certutil -hashfile $args MD5
}
Set-Alias -Name md5 -Value MD5File

#-------------------------------    Set Alias END     -------------------------------
