#Hint: Import this function in powershell to be able to use it as cmdlet -> "Import-Module .\ad_enum_as_function.ps1"
# We can now query using the function LDAPSearch -> 'LDAPSearch -LDAPQuery "(samAccountType=805306368)"'
                                                 -> 'LDAPSearch -LDAPQuery "(objectclass=group)"'

function LDAPSearch {
    param (
        [string]$LDAPQuery
    )

    $PDC = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().PdcRoleOwner.Name
    $DistinguishedName = ([adsi]'').distinguishedName

    $DirectoryEntry = New-Object System.DirectoryServices.DirectoryEntry("LDAP://$PDC/$DistinguishedName")

    $DirectorySearcher = New-Object System.DirectoryServices.DirectorySearcher($DirectoryEntry, $LDAPQuery)

    return $DirectorySearcher.FindAll()

}
