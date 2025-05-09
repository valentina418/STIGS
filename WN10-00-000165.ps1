<#
.SYNOPSIS
    This PowerShell script disables SMBv1 and applies registry-based LANManServer hardening in accordance with STIG ID: WN10-00-000165.

.NOTES
    Author          : Valentina Diaz
    LinkedIn        : https://www.linkedin.com/in/valentinadm/
    GitHub          : https://github.com/valentina418
    Date Created    : 2025-09-05
    Last Modified   : 2025-09-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000165

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
 Run the script from an elevated PowerShell session (Run as Administrator).
Example:
PS: C:\> .\Disable-SMBv1-STIG.ps1
#>

# SMBv1 Feature Removal
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart

# Confirm SMBv1 Removal 
$feature = Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
Write-Host "SMB1Protocol State: $($feature.State)" -ForegroundColor Cyan
