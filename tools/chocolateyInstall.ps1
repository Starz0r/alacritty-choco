$PackageName = 'alacritty'
$Url64 = 'https://github.com/jwilm/alacritty/releases/download/v0.3.3/Alacritty-v0.3.3-windows-portable.zip'
$Checksum64 = 'a93a588b0121cfad6ae28ed6812e0a16171429fb69493953b2a1ab17a263225684f2ed1b4989673e1b5d5c454455280283015f056573451854c39fc77f470e47'
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
