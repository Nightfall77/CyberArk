# CyberArk PAM Automation – Demo Projects

A collection of PowerShell automation scripts for CyberArk Privileged Access Management (PAM) using the psPAS module and CyberArk REST API.

These projects simulate common operational tasks performed by CyberArk PAM Administrators and IAM Analysts, including access audits, bulk account onboarding, and privileged account compliance reporting.

# Projects

| **01 – Safe Membership Audit** | Exports Safe members, permissions, and identifies over-privileged access. | Audit Users / Safe Manager permission needed |
| **02 – Bulk Account Onboarding** | Bulk onboards privileged accounts from a CSV file with duplicate detection and dry-run support. | Add Accounts permission needed |
| **03 – Dormant Account Report** | Identifies dormant privileged accounts and reports stale CPM password management activity. | Audit Users needed|

# Good Practices

- Use **Get-Credential** for authentication instead of hardcoding credentials.
- Test scripts in a development or lab environment before production.
- Review generated reports before making operational changes.
- Never commit vault URLs, credentials, or production account information to source control.

# Requirements
- PowerShell 5.1 or PowerShell 7+
- psPAS PowerShell module
- Network connectivity to CyberArk PVWA
- Appropriate CyberArk permissions for the task being performed

# Purpose

This repository was created as a portfolio project to demonstrate practical CyberArk PAM administration skills, including:

- Safe administration
- Account lifecycle management
- Privileged access governance
- REST API automation
- PowerShell scripting
- Operational reporting
- Compliance and audit support


# Note

All data, account names, Safe names, servers, IP addresses, and reports included in this repository are fictional and intended solely for demonstration and for recuitment purposes. csv files has extra columns which is not reflcted in the script to make logic main focus and to simplify scripting for potential employers!!
