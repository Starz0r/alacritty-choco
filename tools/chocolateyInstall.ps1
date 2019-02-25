$PackageName = 'alacritty'
$Url64 = 'https://github.com/jwilm/alacritty/releases/download/v0.2.3/Alacritty-v0.2.3.exe'
$Checksum64 = '0f04ccff7902c603590b33c3b921cd3ca450df6932b745f048bb33eb9eb5db1e777f705c11afce5ef32171448d17bc10da6a53cd119f87eec5729b51e0c6d18a'
$ChecksumType64 = 'sha512'
$ToolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$InstallDir = Join-Path $(Get-ToolsLocation) $PackageName
$UrlExtra64 = 'https://github.com/jwilm/alacritty/releases/download/v0.2.3/winpty-agent.exe'

$desktop = [System.Environment]::GetFolderPath("Desktop")

$PackageArgs = @{
	PackageName = $PackageName
	Url64 = $Url64
	Checksum64 = $Checksum64
	ChecksumType64 = $ChecksumType64
	FileFullPath = Join-Path $InstallDir $([IO.Path]::GetFileName("alacritty.exe"))
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