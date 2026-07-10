# CyberArk PAM Demo Projects 

## Overview

#	Project	Description
01	Safe Membership Audit	- Full safe-member permission export with risk flagging ( need Account with Audit Users or Safe Supervisor permissions)
02	Bulk Account Onboarding	- CSV-driven bulk onboarding with duplicate detection and dry-run (need Account with Add Accounts permission on target safes)
03	Dormant Account Report	- Dormancy detection + CPM reconciliation failure reporting(need Account with Audit Users permission)


The examples are based on a fictional enterprise environment and are intended for learning and mock preparation. And also all scripts are simplified to reflect main logic behind the script and csv has all colums ideally what i want to have from a audit/admin perspective!

---
Prerequisites
```powershell
# Install psPAS (all projects depend on this)
Install-Module psPAS -Scope CurrentUser
```
PowerShell 5.1+ or PowerShell 7+
CyberArk REST API enabled on PVWA
Appropriate CyberArk permissions per project (see Project Description above)
---
Security Notes
No credentials are ever stored in scripts or config files. All scripts use interactive `Get-Credential` prompts.
For production/scheduled use, integrate with CyberArk AIM/CCP or Conjur to retrieve credentials at runtime.
Always test with `-WhatIf` or against a non-production vault before running in prod.
Never commit real vault URLs, usernames, or any account data to version control.


## Included Platforms

- Windows Local Accounts
- Windows Domain Accounts
- Linux Servers
- Oracle Databases
- Cisco Network Devices
- Salesforce SaaS Accounts


## Sample CSV Columns

- SafeName
- PlatformID
- Address
- Username
- Password
- Domain
- Logon Account
- Reconcile Account
- Policy ID
- Properties

---

## Skills Demonstrated

- CyberArk PAM Administration
- Bulk Account Onboarding
- Safe Design
- Platform Configuration
- Password Management
- CPM Integration
- Linked Accounts
