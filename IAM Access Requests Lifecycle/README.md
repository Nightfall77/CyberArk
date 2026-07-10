# IAM Request Lifecycle Tracker

This project simulates an enterprise **IAM/PAM operations tracker** similar to those used by CyberArk administrators and IAM analysts to manage privileged access requests throughout their lifecycle.

The tracker is designed to demonstrate how privileged access requests are recorded, approved, fulfilled, monitored, and eventually decommissioned in an enterprise environment.

## Project Contents

The Excel workbook contains the following worksheets:

### Access Request Tracker
Tracks privileged access requests from submission through completion.

**Includes:**
- Request ID
- Requestor
- Account Type
- Target System
- Safe Name
- Platform
- Approver
- Request & Completion Dates
- Status
- Notes

###  Decommission Log
Maintains a record of privileged accounts that have been removed from CyberArk.

**Includes:**
- Account Name
- Safe Name
- Target System
- Decommission Reason
- Decommission Date
- Approved By


###  SLA Tracker
Monitors request fulfillment against defined service level agreements.

**Includes:**
- Request Type
- SLA Target
- Actual Completion Time
- SLA Status


## The Tracker Demonstrates

- Access Request Management
- Approval Workflow
- SLA Monitoring
- Safe Ownership
- Platform Classification
- Account Decommission Tracking
- Audit Readiness
- Operational Reporting

## Skills Demonstrated

- CyberArk PAM Operations
- IAM Governance
- Privileged Access Management (PAM)
- Service Request Management
- Excel Reporting
- Audit Documentation
- 
## Sample Technologies & Platforms

- CyberArk PAM
- Windows (WinDomain)
- Unix/Linux (UnixSSH)
- Oracle Database
- Microsoft SQL Server
- Application Accounts

This project was created as a portfolio exercise to showcase practical knowledge of IAM/PAM operational processes, request lifecycle management, and audit documentation using realistic enterprise sample data. All data in this project is fictional and intended solely for demonstration purposes.
