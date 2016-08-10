<#
    .SYNOPSIS
        Generate a random password.

    .DESCRIPTION
        Generate a random password using the Membership.GeneratePassword method.

    .PARAMETER length
        Specify a password length to generate. 
        The range is 1 to 128.

    .PARAMETER numNonAlphaChars
        Specify the minimum number of non-alphanumeric characters to use. 
        The range is zero to the length specified.

    .EXAMPLE
        .\Generate-Password.ps1
        H5Ii%k=o

    .EXAMPLE
        .\Generate-Password.ps1 10 4
        r]yu6e{O.?

    .EXAMPLE
        .\Generate-Password.ps1 20
        Q(a8cZAo6u}+hMAc:[KP

    .LINK
        MSDN Page: https://msdn.microsoft.com/en-us/library/system.web.security.membership.generatepassword(v=vs.110).aspx
#>

[CmdletBinding()]
Param
(
    [ValidateRange(1,128)]
    [int]$length = 8,
    [ValidateScript({($_ -ge 0) -and ($_ -le $length)})]
    [int]$numNonAlphaChars = 2
)

Add-Type -AssemblyName System.Web
[System.Web.Security.Membership]::GeneratePassword($length, $numNonAlphaChars)


<# --- end of script --- #>
