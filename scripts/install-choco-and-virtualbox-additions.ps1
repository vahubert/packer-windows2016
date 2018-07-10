$manufacturer=(gwmi Win32_BaseBoard).manufacturer
if ($manufacturer -eq "Oracle Corporation"){
  Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
  choco install vboxguestadditions.install -fy
}
else {
    Write-Host "Vmware not installed - no VMware detected"
}
