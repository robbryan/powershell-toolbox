#
# Generate-Password.ps1 - Generate a random password using the Membership.GeneratePassword method.
#
# https://msdn.microsoft.com/en-us/library/system.web.security.membership.generatepassword(v=vs.110).aspx
#

Param
(
    [int]$length = 8,
    [int]$numNonAlphaChars = 2
)

Add-Type -AssemblyName System.Web
[System.Web.Security.Membership]::GeneratePassword($length, $numNonAlphaChars)
