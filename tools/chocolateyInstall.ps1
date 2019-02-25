$PackageName = 'alacritty'
$Url64 = 'https://github.com/jwilm/alacritty/releases/download/v0.2.5/Alacritty-v0.2.5.exe'
$Checksum64 = 'c386b7a3442f4e2615d9a588d90fbf693b95c0ab720aa52ebb40b70c6e72405bc6e8186629220d010ab57f5272fdf87d8c047c1612c91445b34d6e78b7825ac2'
$ChecksumType64 = 'sha512'
$ToolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$InstallDir = Join-Path $(Get-ToolsLocation) $PackageName
$UrlExtra64 = 'https://github.com/jwilm/alacritty/releases/download/v0.2.5/winpty-agent.exe'

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
