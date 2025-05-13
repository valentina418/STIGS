<#
.SYNOPSIS
    This PowerShell script enables System Event Log maximum size policy by setting 'MaxSize' to at least 32768 KB (32 MB) under the correct registry path.

.NOTES
    Author          : Valentina Diaz
    LinkedIn        : https://www.linkedin.com/in/valentinadm/
    GitHub          : https://github.com/valentina418
    Date Created    : 2025-13-05
    Last Modified   : 2025-13-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000510

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
1. Save as Set-SystemPolicyLogSize.ps1
2. Run as Administrator:
   .\Set-SystemPolicyLogSize.ps1
3. Optionally, run `gpupdate /force` to apply Group Policy immediately.
#>

# Define registry path and values
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System"
$regName = "MaxSize"
$desiredSize = 32768  # 32 MB in KB

# Create the registry key path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the MaxSize DWORD value
Set-ItemProperty -Path $regPath -Name $regName -Value $desiredSize -Type DWord
