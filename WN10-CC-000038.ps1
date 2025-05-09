#
.SYNOPSIS
    This PowerShell script disables insecure WDigest credential caching by removing the `UseLogonCredential` registry value from the system. This is required to comply with STIG ID WN10-CC-000038 and helps prevent plaintext 
password storage in LSASS memory.

.NOTES
    Author          : Valentina Diaz
    LinkedIn        : https://www.linkedin.com/in/valentinadm/
    GitHub          : https://github.com/valentina418
    Date Created    : 2025-09-05
    Last Modified   : 2025-09-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000038

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
Run this script as Administrator. Save it as a `.ps1` file and execute:
    .\Remove-UseLogonCredential.ps1
#>
 $regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest"
$valueName = "UseLogonCredential"

if (Test-Path $regPath) {
    if (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue) {
        Remove-ItemProperty -Path $regPath -Name $valueName
        Write-Output "'$valueName' successfully removed from $regPath."
    } else {
        Write-Output "'$valueName' does not exist at $regPath. Nothing to remove."
    }
} else {
    Write-Output "Registry path $regPath does not exist."
} 
