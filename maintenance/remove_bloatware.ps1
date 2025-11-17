<#
  Author: Steve Grimstead (Prohtius)
  Date: 11-17-2025
  Version: 1.0  
  Purpose: Removes basic Microsoft bloatware.    

  Link: https://raw.githubusercontent.com/Prohtius/PowerShell/refs/heads/main/active%20directory/add_1st_domain_controller..ps1
#>

$bloatapps = @(
"*WindowsMaps",
"MSTeams",
"*YourPhone",
"*Zune*",
"*WindowsMaps",
"*WindowsCamera",
"*WindowsAlarms",
"*Todos",
"*People",
"*MicrosoftOfficeHub",
"*MicrosoftSolitaireCollection",
"*Bing*",
"*windowscommunicationsapps",
"*Clipchamp",
"*OutlookForWindows",
"*Windows.Photos",
"*WindowsSoundRecorder",
"*MicrosoftStickyNotes",
"*Copilot",
"*WindowsFeedbackHub",
"Microsoft.StartExperiencesApp",
"*Widget*",
"*family*"
)

foreach ($bloatapp in $bloatapps)
{
Get-AppxProvisionedPackage -Online | Where "DisplayName" -like $bloatapp | Remove-AppxProvisionedPackage -Online -Verbose
Get-AppxPackage -Name $bloatapp -AllUsers | Remove-AppxPackage -AllUsers -Verbose
}
