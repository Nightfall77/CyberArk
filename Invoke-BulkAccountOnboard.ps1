#Requires -Modules psPAS
<# 

.DESCRIPTION
    Connects to CyberArk via psPAS, retrieves all safes and their members,
    and exports a detailed permission report to CSV and optionally HTML.

    Useful for: access reviews, compliance audits, least-privilege validation.
#>
param(
    [Parameter(Mandatory)]
    [string]$PVWAUrl,

    [Parameter(Mandatory)]
    [string]$CsvPath
)

# Authenticate
$Credential = Get-Credential
New-PASSession -BaseURI $PVWAUrl -Type CyberArk -Credential $Credential

# Read CSV
$Accounts = Import-Csv $CsvPath

foreach ($Account in $Accounts)
{
    try
    {
        $Password = Read-Host "Password for $($Account.Username)" -AsSecureString

        Add-PASAccount `
            -SafeName $Account.SafeName `
            -PlatformId $Account.PlatformId `
            -Address $Account.Address `
            -UserName $Account.Username `
            -Name $Account.AccountName `
            -Secret $Password

        Write-Host "✔ Account onboarded: $($Account.Username)"
    }
    catch
    {
        Write-Host "✖ Failed: $($Account.Username)"
    }
}

Close-PASSession
