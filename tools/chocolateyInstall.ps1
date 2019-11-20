$PackageName = 'alacritty'
$Url64 = 'https://github.com/jwilm/alacritty/releases/download/v0.4.0-rc2/Alacritty-v0.4.0-rc2-windows-portable.zip'
$Checksum64 = 'DA087D821DD5D1AAB53D90BA06DD236A1B2E2D93AB0114D1B976564C9012B4D3EBC6BF031A1B8FDEB68D0B7260395C6BC846B3F8338EAE1A268531E406998CE3'
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
