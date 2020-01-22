$PackageName = 'alacritty'
$Url64 = 'https://github.com/alacritty/alacritty/releases/download/v0.4.1-rc3/Alacritty-v0.4.1-rc3-windows-portable.zip'
$Checksum64 = 'C0B5777A65525BEB82C27481F5F9E8915C8D299DDD057E8BC2450C96ABBBBD6E3F4CC33EB1B5EAA8DFEC52A0AD9AA31906A27C26EE071B1E6D5DDCB4AF1E2A9B'
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
