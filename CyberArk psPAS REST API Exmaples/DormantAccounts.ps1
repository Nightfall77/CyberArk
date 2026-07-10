#Requires -Modules psPAS

#
CyberArk Dormant Account and CPM Health Report
#


param(
    [Parameter(Mandatory)]
    [string]$PVWAUrl,

    [ValidateSet("CyberArk","LDAP","RADIUS","SAML")]
    [string]$AuthType = "CyberArk",

    [int]$DormantDays = 90,

    [int]$CPMDays = 30,

    [string]$OutputPath = ".\Output"
)


Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"



$Cred = Get-Credential


try {

    New-PASSession `
    -BaseURI $PVWAUrl `
    -Type $AuthType `
    -Credential $Cred

}
catch {

    Write-Host "Login failed"
    exit

}


$Accounts = Get-PASAccount

Write-Host "Accounts Found: $($Accounts.Count)"


$DormantAccounts = @()
$CPMIssues = @()




foreach ($Account in $Accounts) {


    $LastUsed = $Account.lastUsedDateTime


    if ($LastUsed) {

        $DaysUnused = 
        ((Get-Date) - [datetime]$LastUsed).Days


        if ($DaysUnused -ge $DormantDays) {


            $DormantAccounts += [PSCustomObject]@{

                Account = $Account.name

                Username = $Account.userName

                Address = $Account.address

                Safe = $Account.safeName

                LastRetrieved = $LastUsed

                DaysUnused = $DaysUnused

            }

        }

    }


    # CPM Check

    $CPMStatus = $Account.secretManagement.status


    $LastChange =
    $Account.secretManagement.lastModifiedTime


    if (
        $CPMStatus -like "*fail*" -or
        (
        $LastChange -and
        ((Get-Date)-[datetime]$LastChange).Days -ge $CPMDays
        )
    )
    {


        $CPMIssues += [PSCustomObject]@{


            Account = $Account.name

            Username = $Account.userName

            Safe = $Account.safeName

            CPMStatus = $CPMStatus

            LastPasswordChange = $LastChange

        }


    }


}



# -------------------------
# Export Reports
# -------------------------


if (!(Test-Path $OutputPath)) {

    New-Item $OutputPath -ItemType Directory | Out-Null

}



$Date = Get-Date -Format yyyyMMdd_HHmm



if ($DormantAccounts.Count -gt 0) {


    $DormantAccounts |

    Export-Csv `
    "$OutputPath\DormantAccounts_$Date.csv" `
    -NoTypeInformation


}



if ($CPMIssues.Count -gt 0) {


    $CPMIssues |

    Export-Csv `
    "$OutputPath\CPMIssues_$Date.csv" `
    -NoTypeInformation


}





# Summary



Write-Host " CyberArk Account Audit"


Write-Host "Accounts Scanned : $($Accounts.Count)"

Write-Host "Dormant Accounts : $($DormantAccounts.Count)"

Write-Host "CPM Issues       : $($CPMIssues.Count)"

Write-Host "Reports Location : $OutputPath"


Close-PASSession
