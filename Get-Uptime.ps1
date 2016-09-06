<#
    .SYNOPSIS
        Display the elapsed time since last boot up.

    .EXAMPLE
        .\Get-Uptime.ps1
#>

[CmdletBinding()]
Param()

(Get-Date).Subtract((Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime) | Format-Table
