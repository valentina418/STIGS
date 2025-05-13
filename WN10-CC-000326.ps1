<#
.SYNOPSIS
    This PowerShell scrip enables PowerShell script block logging via the registry. This increases system auditing and helps detect malicious script activity.

.NOTES
    Author          : Valentina Diaz
    LinkedIn        : https://www.linkedin.com/in/valentinadm/
    GitHub          : https://github.com/valentina418
    Date Created    : 2025-13-05
    Last Modified   : 2025-13-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000326

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
  Run this script as an administrator on a Windows 10 system to apply the setting:
1. Save the script as `Enable-ScriptBlockLogging.ps1`
2. Right-click and "Run with PowerShell" or execute from an elevated PowerShell terminal:
   `.\Enable-ScriptBlockLogging.ps1`
3. No reboot is required for the setting to take effect
#>

# Create the key if it doesn't exist
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Force | Out-Null

# Set the registry value to enable script block logging
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" `
    -Name "EnableScriptBlockLogging" -Value 1 -Type DWord
