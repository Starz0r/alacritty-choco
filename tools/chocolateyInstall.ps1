$PackageName = 'alacritty'
$Url64 = 'https://github.com/jwilm/alacritty/releases/download/v0.2.4/Alacritty-v0.2.4.exe'
$Checksum64 = '23a0a23ca41a7c9e274cc5c081b6f5c8558e1d826b374bed001c05dbb964fb301eba73e45b39b43652d57216e96fa8560576d8ced8cd76faa9d66b3db4d7a4f8'
$ChecksumType64 = 'sha512'
$ToolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$InstallDir = Join-Path $(Get-ToolsLocation) $PackageName
$UrlExtra64 = 'https://github.com/jwilm/alacritty/releases/download/v0.2.4/winpty-agent.exe'

$desktop = [System.Environment]::GetFolderPath("Desktop")

$PackageArgs = @{
	PackageName = $PackageName
	Url64 = $Url64
	Checksum64 = $Checksum64
	ChecksumType64 = $ChecksumType64
	FileFullPath = Join-Path $InstallDir $([IO.Path]::GetFileName("alacritty.exe"))
}
Get-ChocolateyWebFile @PackageArgs

Remove-Item $InstallDir\winpty-agent.exe
$PackageArgs = @{
	PackageName = $PackageName
	Url64 = $UrlExtra64
	FileFullPath = Join-Path $InstallDir $([IO.Path]::GetFileName($UrlExtra64))
}
Get-ChocolateyWebFile @PackageArgs

Install-BinFile alacritty -path "$InstallDir\alacritty.exe" -UseStart
Install-ChocolateyShortcut -ShortcutFilePath "$desktop\Alacritty.lnk" -TargetPath "$InstallDir\alacritty.exe" -WorkingDirectory "$InstallDir" -WindowStyle 1