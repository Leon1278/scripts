#Hint: Before execution we maybe must bypass the execution policy. Therefore execute: "powershell -ep bypass" in terminal

# Store the domain object in the $domainObj variable
$domainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()

# Store the PdcRoleOwner name to the $PDC variable
$PDC = $domainObj.PdcRoleOwner.Name

# Store the Distinguished Name variable into the $DN variable
$DN = ([adsi]'').distinguishedName

# create LDAP path
$LDAP = "LDAP://$PDC/$DN"

# print LDAP path
$LDAP
