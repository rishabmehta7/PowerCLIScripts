<#
    .SYNOPSIS This script generates a list of ESXi Version of all hosts on a vCenter Server
    .NOTES  Author:  Rishab Mehta
    .NOTES  Site:    www.vroanything.com
    .REFERENCE Blog: https://www.vroanything.com/2018/12/generate-list-of-esxi-version-of-all.html
#>

$sourceVC = Read-Host -Prompt 'Input the Source vC Hostname or IP'
$sourceVCUsername = Read-Host -Prompt 'Input the Source vC Username'
$sourceVCPassword = Read-Host -Prompt 'Input the Source vC Password'

$sourceVCConn = Connect-VIServer -Server $sourceVC -user $sourceVCUsername -password $sourceVCPassword

Get-View -ViewType HostSystem -Property Name,Config.Product | Format-Table Name, @{L='Host Version & Build Version';E={$_.Config.Product.FullName}}

Disconnect-VIServer -Server $sourceVCConn -Confirm:$false
