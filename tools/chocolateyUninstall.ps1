$PackageName = 'alacritty'
$InstallDir = Join-Path $(Get-ToolsLocation) $PackageName
$desktop = [System.Environment]::GetFolderPath("Desktop")

Uninstall-BinFile alacritty -path "$InstallDir\alacritty.exe"
Uninstall-ChocolateyZipPackage -PackageName 'alacritty' -ZipFileName 'Alacritty-v0.2.9-windows.zip'

Remove-Item $InstallDir
Remove-Item "$desktop\Alacritty.lnk" -ErrorAction SilentlyContinue -Force | Out-Null