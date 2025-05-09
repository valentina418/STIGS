<#
.SYNOPSIS
    This PowerShell script disables SMBv1 client by setting the 'Start' value of the mrxsmb10 service to 4.


.NOTES
    Author          : Valentina Diaz
    LinkedIn        : https://www.linkedin.com/in/valentinadm/
    GitHub          : https://github.com/valentina418
    Date Created    : 2025-09-05
    Last Modified   : 2025-09-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000170

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
 Run the script from an elevated PowerShell session (Run as Administrator).
Example:
PS: C:\> .\Disable-SMBv1Client-STIG.ps1

Reboot the system for changes to take effect

#>

# Define registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\mrxsmb10"

# Check if the key exists
if (Test-Path $regPath) {
    # Set 'Start' to 4 (Disabled)
    Set-ItemProperty -Path $regPath -Name "Start" -Value 4 -Type DWord
    Write-Host "SMBv1 client (mrxsmb10) has been disabled." -ForegroundColor Green
} else {
    Write-Warning "The 'mrxsmb10' registry key does not exist. SMBv1 client may already be removed."
}

Write-Host ""
Write-Host "Please reboot the system to complete the configuration." -ForegroundColor Yellow
