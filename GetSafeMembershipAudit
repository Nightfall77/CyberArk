#Requires -Modules psPAS



[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$PVWAUrl,

    [ValidateSet("CyberArk","LDAP","RADIUS","SAML")]
    [string]$AuthType = "CyberArk",

    [string]$OutputPath = ".\Output"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"



function Get-Permissions {
    param($Member)

    $Permissions = @()

    $Map = @{
        "UseAccounts"                    = $Member.UseAccounts
        "RetrieveAccounts"               = $Member.RetrieveAccounts
        "ListAccounts"                   = $Member.ListAccounts
        "AddAccounts"                    = $Member.AddAccounts
        "UpdateAccountContent"            = $Member.UpdateAccountContent
        "UpdateAccountProperties"        = $Member.UpdateAccountProperties
        "InitiateCPM"                    = $Member.InitiateCPMAccountManagementOperations
        "DeleteAccounts"                 = $Member.DeleteAccounts
        "ManageSafe"                     = $Member.ManageSafe
        "ManageSafeMembers"              = $Member.ManageSafeMembers
        "ViewAuditLog"                   = $Member.ViewAuditLog
        "AccessWithoutConfirmation"      = $Member.AccessWithoutConfirmation
    }

    foreach ($item in $Map.Keys) {
        if ($Map[$item]) {
            $Permissions += $item
        }
    }

    return $Permissions -join ", "
}


function Get-Risk {
    param($Member)

    if ($Member.ManageSafe -and $Member.RetrieveAccounts) {
        return "High - ManageSafe + Retrieve"
    }

    if ($Member.AccessWithoutConfirmation) {
        return "High - No Confirmation"
    }

    if ($Member.DeleteAccounts) {
        return "Medium - Delete Permission"
    }

    return "OK"
}



# -------------------------------
# Main Script
# -------------------------------

Write-Host "Connecting to CyberArk..." 

$Credential = Get-Credential


try {

    New-PASSession `
        -BaseURI $PVWAUrl `
        -Type $AuthType `
        -Credential $Credential

}
catch {

    Write-Host "Login Failed: $_" 
    exit

}


Write-Host "Retrieving Safes..." 

$Safes = Get-PASSafe


$Report = @()


foreach ($Safe in $Safes) {

    Write-Host "Auditing Safe: $($Safe.SafeName)"


    try {

        $Members = Get-PASSafeMember `
            -SafeName $Safe.SafeName


        foreach ($Member in $Members) {


            $Report += [PSCustomObject]@{

                SafeName = $Safe.SafeName

                MemberName = $Member.MemberName

                MemberType = $Member.MemberType

                Expiry = if ($Member.MembershipExpirationDate) {
                    $Member.MembershipExpirationDate
                }
                else {
                    "No Expiry"
                }

                Permissions = Get-Permissions $Member

                Risk = Get-Risk $Member

                ManageSafe = $Member.ManageSafe

                ManageSafeMembers = $Member.ManageSafeMembers

                RetrieveAccounts = $Member.RetrieveAccounts

                UseAccounts = $Member.UseAccounts

                DeleteAccounts = $Member.DeleteAccounts

            }

        }

    }
    catch {

        Write-Host "Failed reading $($Safe.SafeName)" `
            -ForegroundColor Yellow

    }

}



# -------------------------------
# Export Report
# -------------------------------

if (!(Test-Path $OutputPath)) {

    New-Item `
        -Path $OutputPath `
        -ItemType Directory | Out-Null

}


$Date = Get-Date -Format yyyyMMdd_HHmm


$File = Join-Path `
        $OutputPath `
        "CyberArk_Safe_Audit_$Date.csv"


$Report |
Export-Csv `
    -Path $File `
    -NoTypeInformation `
    -Encoding UTF8



Write-Host ""
Write-Host "============================="
Write-Host " Audit Completed"
Write-Host "============================="
Write-Host "Safes Checked : $($Safes.Count)"
Write-Host "Members Found : $($Report.Count)"
Write-Host "Report       : $File"
Write-Host "============================="



Close-PASSession

