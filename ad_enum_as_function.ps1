#Hint: Before execution we maybe must bypass the execution policy. Therefore execute: "powershell -ep bypass" in terminal

#Hint: Import this function in powershell to be able to use it as cmdlet -> 'Import-Module .\ad_enum_as_function.ps1'
# We can now query using the function LDAPSearch -> 'LDAPSearch -LDAPQuery "(samAccountType=805306368)"'
#                                                -> 'LDAPSearch -LDAPQuery "(objectclass=group)"'

# We can store query results into a variable an then access different properties
#                                                -> '$group = LDAPSearch -LDAPQuery "(&(objectCategory=group)(cn={group-name}*))"' -> '$group.properties.member'
#                                                -> '$user = LDAPSearch -LDAPQuery "(&(objectCategory=user)(cn={user-name}*))"' -> '$user.properties'

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
