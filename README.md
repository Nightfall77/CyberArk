# CyberArk PAM Demo Projects 

## Overview

#	Project	Description
01	Safe Membership Audit	- Full safe-member permission export with risk flagging
02	Bulk Account Onboarding	- CSV-driven bulk onboarding with duplicate detection and dry-run
03	Dormant Account Report	- Dormancy detection + CPM reconciliation failure reporting


The examples are based on a fictional enterprise environment and are intended for learning and interview preparation.

---
Prerequisites
```powershell
# Install psPAS (all projects depend on this)
Install-Module psPAS -Scope CurrentUser
```
PowerShell 5.1+ or PowerShell 7+
CyberArk REST API enabled on PVWA
Appropriate CyberArk permissions per project (see individual READMEs)
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

---

## Repository Structure

csv/
    Sample onboarding templates

docs/
    Detailed documentation

diagrams/
    Architecture and onboarding flow

---

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
