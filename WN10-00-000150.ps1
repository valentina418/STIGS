<#
.SYNOPSIS
    This PowerShell script removes DisableExceptionChainValidation to enable SEHOP for STIG compliance.


.NOTES
    Author          : Valentina Diaz
    LinkedIn        : https://www.linkedin.com/in/valentinadm/
    GitHub          : https://github.com/valentina418
    Date Created    : 2025-09-05
    Last Modified   : 2025-09-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000150

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
1. Save this script as Enable-SEHOP-STIG.ps1
2. Open PowerShell as Administrator
3. Run:
   .\Enable-SEHOP-STIG.ps1
#>

# Registry path and value name
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel"
$valueName = "DisableExceptionChainValidation"

# Ensure the key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Remove the value if it exists
if (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue) {
    Remove-ItemProperty -Path $regPath -Name $valueName
    Write-Host "DisableExceptionChainValidation has been removed. SEHOP is now enabled by default." -ForegroundColor Green
} else {
    Write-Host "DisableExceptionChainValidation was not present. SEHOP is already enabled." -ForegroundColor Green
}
