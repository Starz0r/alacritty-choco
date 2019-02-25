$PackageName = 'alacritty'
$Url64 = 'https://github.com/jwilm/alacritty/releases/download/v0.2.7/Alacritty-v0.2.7.exe'
$Checksum64 = 'c8cb52a482660d2931b80aeefeba06579a79a1fc7a1a9c4bfce15fbdfe2bdeac4310680870184befe24fc84b7425064c37544dd1f55cb34c69b27defce6a3311'
$ChecksumType64 = 'sha512'
$ToolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$InstallDir = Join-Path $(Get-ToolsLocation) $PackageName
$UrlExtra64 = 'https://github.com/jwilm/alacritty/releases/download/v0.2.7/winpty-agent.exe'

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
