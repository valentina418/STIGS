<#
.SYNOPSIS
    This PowerShell script Disables the built-in Guest account on Windows 10 to comply with STIG ID WN10-SO-000010.

.NOTES
    Author          : Valentina Diaz
    LinkedIn        : https://www.linkedin.com/in/valentinadm/
    GitHub          : https://github.com/valentina418
    Date Created    : 2025-08-05
    Last Modified   : 2025-08-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator).
    Example:
    PS C:\> .\Disable-GuestAccount-STIG-WN10-SO-000010.ps1
#>

# Disable the Guest account for STIG compliance
Disable-LocalUser -Name "Guest"

# Verify that the account is now disabled
$guestStatus = Get-LocalUser -Name "Guest"
Write-Output "Guest account status: Enabled = $($guestStatus.Enabled)"
