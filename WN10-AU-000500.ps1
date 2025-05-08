 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Valentina Diaz
    LinkedIn        : https://www.linkedin.com/in/valentinadm/
    GitHub          : https://github.com/valentina418
    Date Created    : 2025-08-05
    Last Modified   : 2025-08-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# Define the registry path and value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$propertyName = "MaxSize"
$propertyValue = 0x8000  # Hexadecimal 8000 = 32768 in decimal

# Ensure the key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the DWORD value
New-ItemProperty -Path $regPath -Name $propertyName -Value $propertyValue -PropertyType DWord -Force | Out-Null

Write-Output "Registry value 'MaxSize' set to 0x8000 under $regPath"
 
