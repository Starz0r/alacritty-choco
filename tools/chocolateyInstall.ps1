$PackageName = 'alacritty'
$Url64 = 'https://github.com/alacritty/alacritty/releases/download/v0.4.1/Alacritty-v0.4.1-windows-portable.zip'
$Checksum64 = '4B98774DB42AEAF6782A20F11E5A4ADD6B133873CDE1D03D76B45AD2F9397A169E3BEE10DA8F11108965CF5F1FF63646C1C2254D567BEA79213686155FF9C6A3'
$ChecksumType64 = 'sha512'
$ToolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$InstallDir = Join-Path $(Get-ToolsLocation) $PackageName

$desktop = [System.Environment]::GetFolderPath("Desktop")

$PackageArgs = @{
	PackageName = $PackageName
	Url64 = $Url64
	Checksum64 = $Checksum64
	ChecksumType64 = $ChecksumType64
	UnzipLocation = $InstallDir
}
Install-ChocolateyZipPackage @PackageArgs

Install-BinFile alacritty -path "$InstallDir\alacritty.exe" -UseStart
Install-ChocolateyShortcut -ShortcutFilePath "$desktop\Alacritty.lnk" -TargetPath "$InstallDir\alacritty.exe" -WorkingDirectory "$InstallDir" -WindowStyle 1
