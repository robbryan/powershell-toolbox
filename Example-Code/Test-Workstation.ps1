<#
    .SYNOPSIS
        Test the connection to one or more workstations as an 
        example of adding a calculated property to a result-set.

    .EXAMPLE
        .\Test-Workstation.ps1 -Workstation jupiter2

        Workstation IPV4Address    ReplySize ResponseTime
        ----------- -----------    --------- ------------
        JUPITER2    10.0.0.12      32        12 ms

    .EXAMPLE
        Get-Content Workstations.txt | Test-Workstation.ps1

        Workstation IPV4Address    ReplySize ResponseTime
        ----------- -----------    --------- ------------
        JUPITER2    10.0.0.12      32        12 ms
        ENTERPRISE  10.0.0.34      32        499 ms
#>

[CmdletBinding()]
Param(
    [Parameter(Mandatory=$true, ValueFromPipeline=$true, Position=0)]
    [string]$Workstation
)

Process
{
    $soProperties = @{  Name = 'Workstation'; 
                        Expression= { $Workstation.ToUpper() }
                    }, 
                    'IPV4Address', 
                    'ReplySize',
                    @{  Name = 'ResponseTime';
                        Expression = { "$($PsItem.ResponseTime) ms" }
                    }

    Test-Connection -ComputerName $Workstation -Count 1 | Select-Object $soProperties
}
