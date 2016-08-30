<#
    .SYNOPSIS
        Set the permission specified on a given folder

    .EXAMPLE
        .\Set-FolderPermission.ps1 .\Test-Folder "Gotham\Batman" "FullControl"
#>

[CmdletBinding()]
Param
(
    [Parameter(Mandatory=$true)]
    $folder,
    [Parameter(Mandatory=$true)]
    $domainUser,
    [Parameter(Mandatory=$true)]
    [ValidateSet("FullControl", "Modify", "ReadAndExecute")]
    $permission
)

$folderPermission = $domainUser,$permission,"ContainerInherit,ObjectInherit","None","Allow"

$folderAccessRule = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule $folderPermission

$folderAcl = Get-Acl $folder
$folderAcl.SetAccessRule($folderAccessRule)
Set-Acl $folder -AclObject $folderAcl

