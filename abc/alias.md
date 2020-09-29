# PowerShell 别名

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
