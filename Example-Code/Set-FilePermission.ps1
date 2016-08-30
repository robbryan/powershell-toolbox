<#
    .SYNOPSIS
        Set the permission specified on a given file

    .EXAMPLE
        .\Set-FilePermission.ps1 .\Test-File.txt "Gotham\Robin" "Modify"
#>

[CmdletBinding()]
Param
(
    [Parameter(Mandatory=$true)]
    $file,
    [Parameter(Mandatory=$true)]
    $domainUser,
    [Parameter(Mandatory=$true)]
    [ValidateSet("FullControl", "Modify", "ReadAndExecute")]
    $permission
)

$filePermission = $domainUser,$permission,"Allow"

$fileAccessRule = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule $filePermission

$fileAcl = Get-Acl $file
$fileAcl.SetAccessRule($fileAccessRule)
Set-Acl $file -AclObject $fileAcl
