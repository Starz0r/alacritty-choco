$PackageName = 'alacritty'
$Url64 = 'https://github.com/jwilm/alacritty/releases/download/v0.3.2/Alacritty-v0.3.2-windows-portable.zip'
$Checksum64 = '66D97AC872842017C9A8F0FB25E6C626D8794E2AF3500A62BEFB9C1DEDCDABFF868A715DE6D5B305C704C5688CF21C0C3AE31316BA238B18FF53400EAF5897A9'
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
