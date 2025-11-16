# PowerShell
PowerShell scripts for doing the things.

# Quick Scripts
## Install Winget
### PowerShell
Invoke-WebRequest can be used instead of WebClient, but to me, it feels slower.
```powershell
<#
  Author: Steve Grimstead (Prohtius)
  Date: 08-20-2025
  Version: 1.0
  Target OS: Microsoft Windows
  Purpose: Creates new webclient, then uses webclient to download the winget msixbundle and save it to the destination.
    Currently no error checking or verifying that folder structure exists!
#>

$webclient = New-Object System.Net.WebClient

$source = "https://github.com/microsoft/winget-cli/releases/download/v1.10.390/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"

$destination = "C:\tmp\winget\winget.msixbundle"

$webClient.DownloadFile($source,$destination) 

Write-Host "Download complete." -ForegroundColor Green

add-appxpackage -path "c:\tmp\winget\winget.msixbundle"
```
### Curl and PowerShell
Using Curl for the download also works, however, Curl in PowerShell is an alias for "Invoke-WebRequest" which is obviously not the same. 😄
From a Command Prompt (No "PS" before prompt)
```batch
curl -L "https://github.com/microsoft/winget-cli/releases/download/v1.10.390/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" --output "C:\tmp\winget-install.msxibundle"
```
In PowerShell
```powershell
add-appxpackage -path "c:\tmp\winget-install.msixbundle"
```

## Download System Setup Installer for VSCode
```
curl -L "https://go.microsoft.com/fwlink/?linkid=852157" --output C:\tmp\vscode.exe
```
