<#
.SYNOPSIS
   This PowerShell script enables auditing of process creation for both success and failure events to comply with STIG ID WN10-AU-000585.


.NOTES
    Author          : Valentina Diaz
    LinkedIn        : https://www.linkedin.com/in/valentinadm/
    GitHub          : https://github.com/valentina418
    Date Created    : 2025-09-05
    Last Modified   : 2025-09-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000585

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
1. Save this script as Enable-SEHOP-STIG.ps1
2. Open PowerShell as Administrator
3. Run:
     .\Enable-AuditProcessCreation.ps1
#>

# Enable both Success and Failure auditing for Process Creation
auditpol /set /subcategory:"Process Creation" /success:enable /failure:enable

# Confirm the setting
$auditStatus = auditpol /get /subcategory:"Process Creation"
Write-Output "`nCurrent Audit Policy for 'Process Creation':"
Write-Output $auditStatus
