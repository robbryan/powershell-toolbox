<#
    .SYNOPSIS
        Display the active entries in the HOSTS file.

    .DESCRIPTION
        The script select lines from the HOSTS file that do not start with
        a comment or are not blank lines. It then splits out the IP address
        and the hostname and displays the results in a Grid View.

        No output is displayed if it doesn't find any active host entries.

    .EXAMPLE
       .\Show-ActiveHostFileEntries.ps1
#>
[CmdletBinding()]
Param()

Select-String -Path $env:SystemRoot\System32\Drivers\etc\HOSTS -NotMatch "^#|^\s*$" | 
Select-Object -Property @{
                            n='IP Address';
                            e={($_.Line -split '\s+')[0]}
                        },
                        @{
                            n='Hostname';
                            e={($_.Line -split '\s+')[1]}
                        } |
Out-GridView -Title "Active HOSTS File Entries"


