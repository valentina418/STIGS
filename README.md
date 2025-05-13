# 🛡️ Windows 10 STIG Remediation with PowerShell

This project contains a collection of PowerShell scripts used to **remediate Windows 10 STIG vulnerabilities** as defined by the **DISA STIG Benchmark (v3r1)**. Each script corresponds to a specific STIG ID and performs registry-based fixes or policy changes in compliance with Department of Defense (DoD) cybersecurity standards.

---

## 📄 STIG Scripts Index

| STIG ID            | Description                                        | Script Name              |
|--------------------|----------------------------------------------------|--------------------------|
| WN10-00-000165     | Disables SMBv1 by setting `Start` for mrxsmb10     | WN10-00-000165.ps1       |
| WN10-00-000170     | Disables SMBv1 if enabled (policy path)            | WN10-00-000170.ps1       |
| WN10-AU-000500     | Sets Application event log size                    | WN10-AU-000500.ps1       |
| WN10-AU-000505     | Sets Security event log size (≥1024000 KB)         | WN10-AU-000505.ps1       |
| WN10-AU-000510     | Sets System event log size (≥32768 KB)             | WN10-AU-000510.ps1       |
| WN10-CC-000038     | Enforces account lockout duration                  | WN10-CC-000038.ps1       |
| WN10-CC-000326     | Enables PowerShell Script Block Logging            | WN10-CC-000326.ps1       |
| WN10-SO-000010     | Disables automatic logon                           | WN10-SO-000010.ps1       |
| WN10-SO-000035     | Requires CTRL+ALT+DEL for logon                    | WN10-SO-000035.ps1       |
| WN10-SO-000265     | Prevents anonymous SID enumeration                  | WN10-SO-000265.ps1       |

---

## 👤 Author

**Valentina Diaz**  
🔗 [LinkedIn](https://www.linkedin.com/in/valentinadm/)  
📁 [GitHub](https://github.com/valentina418)

---

## 📌 Notes

- All scripts are written in PowerShell and require **elevated (admin) privileges**
- Registry paths under `HKLM:\SOFTWARE\Policies\Microsoft\Windows\...` are used for persistence and policy-level configuration
- Based on DISA STIG for Windows 10 (v3r1) and verified with STIGAVIEW & Tenable resources
