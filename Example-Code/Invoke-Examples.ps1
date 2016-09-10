<#
    .SYNOPSIS
        Examples of how to do standard things in PowerShell
    .DESCRIPTION
        Examples of input parameters for a script
#>
Param
(
    [Parameter(Mandatory=$true)]
    [string]$inputParam,

    [string]$dataFileName = "Default-Values.csv"
)


# Creating an enumerated type in PowerShell using a here-string
#
Add-Type -TypeDefinition @"
    public enum Colour 
    { 
        AliceBlue, 
        AntiqueWhite,
        Aqua,
        Aquamarine,
        Azure
    } 
"@


# Check that a local data file exists before using it
# 
$dataFilePath = Join-Path (Get-Location).Path -ChildPath $dataFileName
if ((Test-Path $dataFilePath) -eq $false)
{
    Write-Output ("{0} not Found!" -f $dataFilePath)
}
else
{
    $content = Import-Csv $dataFilePath

    # The headings of an imported file can then be referenced in code...

    foreach ($c in $content)
    {
        Write-Output ("{0}, {1}" -f $c.LastName, $c.FirstName)
    }
}


# When calling a function...
# Don't put a comma between the parameters!
#
function showCoords($x, $y)
{
    Write-Output ("The value for x is {0}, the value for y is {1}" -f $x, $y) 
}

#   No comma  |
#             V
showCoords 123 456



# Handy method of opening a new PowerShell window as administrator,
# because we prefer to type rather than right-click, right?
#
Start-Process -Verb RunAs -FilePath C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe

# ...or the even shorter...
#
start -v runas powershell

