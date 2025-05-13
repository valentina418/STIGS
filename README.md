# 🛡️ Windows 10 STIG Remediation with PowerShell

This project contains a collection of PowerShell scripts used to **remediate Windows 10 STIG vulnerabilities** as defined by the **DISA STIG Benchmark (v3r1)**. Each script corresponds to a specific STIG ID and performs registry-based fixes or policy changes in compliance with Department of Defense (DoD) cybersecurity standards.

---

## STIG Scripts Index

| STIG ID            | Description                                                  | Script Name              |
|--------------------|--------------------------------------------------------------|--------------------------|
| WN10-00-000165     | Disables SMBv1 on the SMB server                             | WN10-00-000165.ps1       |
| WN10-00-000170     | Disables SMBv1 on the SMB client                             | WN10-00-000170.ps1       |
| WN10-AU-000500     | Sets Application event log size to ≥ 32768 KB                | WN10-AU-000500.ps1       |
| WN10-AU-000505     | Sets Security event log size to ≥ 1024000 KB                 | WN10-AU-000505.ps1       |
| WN10-AU-000510     | Sets System event log size to ≥ 32768 KB                     | WN10-AU-000510.ps1       |
| WN10-CC-000038     | Disables WDigest authentication                              | WN10-CC-000038.ps1       |
| WN10-CC-000326     | Enables PowerShell script block logging                      | WN10-CC-000326.ps1       |
| WN10-SO-000010     | Disables the built-in Guest account                          | WN10-SO-000010.ps1       |
| WN10-SO-000035     | Enforces Netlogon secure channel signing                     | WN10-SO-000035.ps1       |
| WN10-SO-000265     | Restricts elevation of UIAccess apps to secure locations     | WN10-SO-000265.ps1       |

---

## 👤 Author

Created and maintained by **Valentina Diaz**


---

## Notes

- All scripts are written in PowerShell and require **elevated (admin) privileges**
- Registry paths under `HKLM:\SOFTWARE\Policies\Microsoft\Windows\...` are used for persistence and policy-level configuration
- Based on DISA STIG for Windows 10 (v3r1) and verified with STIGAVIEW & Tenable resources
