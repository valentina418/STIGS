<#
.SYNOPSIS
    This PowerShell script enables Security Event Log maximum size policy by setting 'MaxSize' to at least 1024000 KB (1 GB) under the correct registry path.

.NOTES
    Author          : Valentina Diaz
    LinkedIn        : https://www.linkedin.com/in/valentinadm/
    GitHub          : https://github.com/valentina418
    Date Created    : 2025-13-05
    Last Modified   : 2025-13-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000505

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
1. Save as Set-SecurityPolicyLogSize.ps1
2. Run as Administrator:
   .\Set-SecurityPolicyLogSize.ps1
3. Optionally, run `gpupdate /force` to apply Group Policy i
#>

# Set target registry path and values
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"
$regName = "MaxSize"
$desiredSize = 1024000  # Value in KB (1 GB)

# Check if the registry path exists, and create it if it doesn't
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the MaxSize DWORD value
Set-ItemProperty -Path $regPath -Name $regName -Value $desiredSize -Type DWord

# (Optional) Force Group Policy to update
# gpupdate /force
