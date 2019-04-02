$PackageName = 'alacritty'
$Url64 = 'https://github.com/jwilm/alacritty/releases/download/v0.3.0-rc1/Alacritty-v0.3.0-rc1-windows-portable.zip'
$Checksum64 = 'A14FF58F8FAC55140C3CB9EDED6E389415CE148EC3B98C1732AF9B38FFDAA569D11AC2EDD172490AEF98C9B8D3F36D8B28BD5A3AC204147F0B3FF686A8426469'
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
