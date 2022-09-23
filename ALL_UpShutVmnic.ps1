<#
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
#>


##############################################################
#        vCenter, Cluster & VM Test parameters
##############################################################


#vCenter Parameters
$VC = Read-Host "Which vCenter to load ? (FQDN is required)"
$VMHost_name = Read-Host "Which host to load ? (FQDN is required)"
$VMHost = Get-VMHost -Name $VMHost_nameConnect-VIServer $VC

function shutVmnicPort($vmnic)
{
        $esxcli = Get-ESXCLI -VMHost $VMHost -V2
		$arguments = $esxcli.network.nic.down.CreateArgs()
		$arguments.nicname = $vmnic
		$result = $esxcli.network.nic.down.Invoke($arguments)
		return $result
}
function upVmnicPort($vmnic)
{
        $esxcli = Get-ESXCLI -VMHost $VMHost -V2
		$arguments = $esxcli.network.nic.up.CreateArgs()
		$arguments.nicname = $vmnic
		$result = $esxcli.network.nic.up.Invoke($arguments)
		return $result
}
if($VMHost)
{
     Write-Host "**** Host has been loaded ****" -ForegroundColor green 
    $vmnic0 = $VMHost | Get-VMHostNetworkAdapter -Physical -Name vmnic0
    $vmnic1 = $VMHost | Get-VMHostNetworkAdapter -Physical -Name vmnic1
    $vmnic2 = $VMHost | Get-VMHostNetworkAdapter -Physical -Name vmnic2
    $vmnic3 = $VMHost | Get-VMHostNetworkAdapter -Physical -Name vmnic3
    $vmnic4 = $VMHost | Get-VMHostNetworkAdapter -Physical -Name vmnic4
    $vmnic5 = $VMHost | Get-VMHostNetworkAdapter -Physical -Name vmnic5
    $vmnic6 = $VMHost | Get-VMHostNetworkAdapter -Physical -Name vmnic6
    $vmnic7 = $VMHost | Get-VMHostNetworkAdapter -Physical -Name vmnic7
    Write-Host "**** Vmnic has been loaded ****" -ForegroundColor green 
}Else
{
    Write-Host "**** Host couldn't be loaded ****" -ForegroundColor red
    Write-Host "**** RESTART SCRIPT WITH POWERED HOST OR VERIFIED NAME'S HOST ****" -ForegroundColor red
}