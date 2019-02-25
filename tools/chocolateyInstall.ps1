$PackageName = 'alacritty'
$Url64 = 'https://github.com/jwilm/alacritty/releases/download/binaries/Alacritty.exe'
$Checksum64 = 'D7498878DC5B964C8DAED02F4821FFB844F1204B395FB5E96F1E44638FE0317B1D541FFAC303C57A3C8F6C0591F561080459CB205F9C084626BCDA009DB07EC6'
$ChecksumType64 = 'sha512'
$ToolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$InstallDir = Join-Path $(Get-ToolsLocation) $PackageName
$UrlExtra64 = 'https://github.com/jwilm/alacritty/releases/download/binaries/winpty-agent.exe'

$desktop = [System.Environment]::GetFolderPath("Desktop")

$PackageArgs = @{
	PackageName = $PackageName
	Url64 = $Url64
	Checksum64 = $Checksum64
	ChecksumType64 = $ChecksumType64
	FileFullPath = Join-Path $InstallDir $([IO.Path]::GetFileName($Url64))
}
Get-ChocolateyWebFile @PackageArgs

$PackageArgs = @{
	PackageName = $PackageName
	Url64 = $UrlExtra64
	FileFullPath = Join-Path $InstallDir $([IO.Path]::GetFileName($UrlExtra64))
}
Get-ChocolateyWebFile @PackageArgs

Install-BinFile alacritty -path "$InstallDir\alacritty.exe" -UseStart
Install-ChocolateyShortcut -ShortcutFilePath "$desktop\Alacritty.lnk" -TargetPath "$InstallDir\alacritty.exe" -WorkingDirectory "$InstallDir" -WindowStyle 1