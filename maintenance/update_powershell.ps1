<#
  Author: Steve Grimstead (Prohtius)
  Date: 08-20-2025
  Version: 1.0
  Target OS: Microsoft Windows
  Purpose: Creates new webclient, then uses webclient to download the MS Server 2025 ISO image and save it to the destination.
#>

#-----------------------------------------------------
#|  Change variables in this section as needed       |
#-----------------------------------------------------

#----- Change drive letter as needed         -----
$target_drive = "C:"

#----- Change destination as needed          -----
#----- default path is C:\tmp\isos\server-2022 folder -----
$folder_path = "tmp"

#-----------------------------------------------------
#|  End change variables section                     |
#-----------------------------------------------------

$source = "https://github.com/PowerShell/PowerShell/releases/download/v7.5.3/PowerShell-7.5.3-win-x64.msi"

$msi_name = ($source -split "/")[-1]

$save_destination = "$($target_drive)\$($folder_path)\$($msi_name)"

Write-Host "$($save_destination)"

if (!(Test-Path -Path "$($target_drive)\$($folder_path)")) 
{
  Write-Host -Message "$($target_drive)\$($folder_path) does not exist, creating" -ForegroundColor Yellow

  try
  {
    new-item -itemtype directory -path "$($target_drive)\" -name $folder_path
  }
  catch 
  {
    Write-Error $_.Exception.Message
  }
}

try
{
  $webclient = New-Object System.Net.WebClient
  
  $webClient.DownloadFile($source, $save_destination) 

  Write-Host "Download completed." -ForegroundColor Green

  try
  {
    Start-Process "msiexec.exe" /i $save_destination
  }
  catch
  {
    Write-Error $_.Error.Message
  }
}
catch 
{
  Write-Error $_.Exception.Message
}
