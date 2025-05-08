<#
.SYNOPSIS
    This PowerShell script Enables Secure UIA Paths to restrict UIAccess applications to secure paths.

.NOTES
    Author          : Valentina Diaz
    LinkedIn        : https://www.linkedin.com/in/valentinadm/
    GitHub          : https://github.com/valentina418
    Date Created    : 2025-08-05
    Last Modified   : 2025-08-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000265

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
Run this script in an elevated PowerShell session.
Example:
PS C:\> .\Set-EnableSecureUIAPaths.ps1

#>

# Registry path and value settings
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$valueName = "EnableSecureUIAPaths"
$valueData = 1

# Create the registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the DWORD value
New-ItemProperty -Path $regPath -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null

# Confirm the result
$current = Get-ItemProperty -Path $regPath -Name $valueName
Write-Output "EnableSecureUIAPaths is now set to: $($current.$valueName)"
