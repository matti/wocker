$ChocoInstallPath = "$env:SystemDrive\ProgramData\Chocolatey\bin"

if (!(Test-Path $ChocoInstallPath)) {
  iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}

choco feature disable --name showDownloadProgress
$env:Path += ";C:\ProgramData\Chocolatey\bin"
