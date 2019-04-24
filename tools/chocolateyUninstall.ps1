$PackageName = 'alacritty'
$InstallDir = Join-Path $(Get-ToolsLocation) $PackageName
$desktop = [System.Environment]::GetFolderPath("Desktop")

Uninstall-BinFile alacritty -path "$InstallDir\alacritty.exe"
Uninstall-ChocolateyZipPackage -PackageName 'alacritty' -ZipFileName 'Alacritty-v0.3.2-windows-portable.zip'

Remove-Item $InstallDir
Remove-Item "$desktop\Alacritty.lnk" -ErrorAction SilentlyContinue -Force | Out-Null