PowerShell automation scripts for CyberArk Privileged Access Management, built using the psPAS module against the CyberArk REST API. These projects demonstrate real-world PAM operational tasks: access auditing, bulk account lifecycle management, and compliance reporting.

###Projects:
##Safe Membership Audit: Full safe member permission export - needs Account with AUDIT USERS or SAFE MANAGER permissions
##Bulk Account Onboarding: CSV driven bulk onboarding - needs ADD ACCOUNTS permission
##Dormant Account Report: Dormancy Detection with CPM Health check - needs Account with AUDIT USERS permissison

###Good Practices:
-No credentials are ever stored in scripts or config files. All scripts use `Get-Credential` prompts.
-Always test with `-WhatIf` or against a non-production vault before running in prod.
-Never commit real vault URLs, usernames, or any account data to version control.

