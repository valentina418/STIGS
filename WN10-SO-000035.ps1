 <#
.SYNOPSIS
    This PowerShell script enforces Netlogon secure channel signing by setting RequireSignOrSeal to 1.

.NOTES
    Author          : Valentina Diaz
    LinkedIn        : https://www.linkedin.com/in/valentinadm/
    GitHub          : https://github.com/valentina418
    Date Created    : 2025-08-05
    Last Modified   : 2025-08-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000035

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
Run this in an elevated PowerShell session.
Example:
PS C:\> .\Set-RequireSignOrSeal.ps1
#>

# Registry configuration
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters"
$name = "RequireSignOrSeal"
$data = 1  # Decimal value equivalent to 0x1

# Ensure the key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set or update the DWORD value
New-ItemProperty -Path $regPath -Name $name -Value $data -PropertyType DWord -Force | Out-Null

# Output the result for verification
$current = Get-ItemProperty -Path $regPath -Name $name
Write-Output "RequireSignOrSeal is now set to: $($current.$name)"
