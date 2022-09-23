# OnOffVmnic
.SYNOPSIS
    Shut or unshut VMnic interfaces (with SAN or vSAN ESX)
.DESCRIPTION
    It's not possible to shut or unshut vmnic interface from vCenter or vSphere UI Interface. 
    This script purpose to shut or unshut
.NOTES
    Release : v1.0 (21/09/2022)
    Author:  Jeremy Azera 
    Import the modules :
        - Powercli

.PARAMETERS

.EXAMPLE
    1. Call the script ALL_UpShutVmnic.ps1
    2. Give vCenter FQDN
    3. Give ESXi FQDN
    4. Use the function shutVmnicPort or upVmnicPort with $vmnicX as parameter (X as the number of your vmnic)

    ------CODE----------------------
    PS> ./ALL_UpShutVmnic.ps1 
    Which vCenter to load ? (FQDN is required) 
    PS> myvcenter.domain.org
    Which host to load ? (FQDN is required) 
    PS> myesxiserver.domain.org
    **** Host has been loaded ****
    **** Vmnic has been loaded ****
    PS> shutVmnicPort($vmnic0)
    True
    ------CODE----------------------
