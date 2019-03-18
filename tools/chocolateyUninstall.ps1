$PackageName = 'alacritty'
$InstallDir = Join-Path $(Get-ToolsLocation) $PackageName
$desktop = [System.Environment]::GetFolderPath("Desktop")

Uninstall-BinFile alacritty -path "$InstallDir\alacritty.exe"

Remove-Item $InstallDir
Remove-Item "$desktop\Alacritty.lnk" -ErrorAction SilentlyContinue -Force | Out-Null