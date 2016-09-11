<#
    .SYNOPSIS
        Three functions to run programs with elevated permissions.
        Also defines aliases for these functions.
    .EXAMPLE
        . .\RunAs-Functions.ps1

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           ran -> RunAs-Notepad
Alias           rap -> RunAs-Program
Alias           raps -> RunAs-PowerShell
#>

<#
    .SYNOPSIS
        Starts the program specified and prompts for elevated permissions.
    .EXAMPLE
        RunAs-Program Notepad
#>
function RunAs-Program
{
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$true)]
        [string]$program,
        [Parameter(ValueFromRemainingArguments=$true)]
        [string[]]$ArgsList
    )

    if ($ArgsList -eq $null)
    {
        Start-Process -Verb RunAs -FilePath $program
    }
    else
    {
        Start-Process -Verb RunAs -FilePath $program -ArgumentList $ArgsList
    }
}

<#
    .SYNOPSIS
        Starts a new PowerShell window and prompts for elevated permissions.
    .EXAMPLE
        RunAs-PowerShell
    .EXAMPLE
        RunAs-PowerShell -NoExit ls *.exe
#>
function RunAs-PowerShell()
{
    $program = "$PSHOME\powershell.exe"
    if ($args -ne $null)
    {
        RunAs-Program $program $args
    }
    else
    {
        RunAs-Program $program 
    }
}

<#
    .SYNOPSIS
        Starts Notepad and prompts for elevated permissions.
    .EXAMPLE
        RunAs-Notepad
    .EXAMPLE
        RunAs-Notepad .\DataFile.txt
#>
function RunAs-Notepad()
{
    $program = "$env:SystemRoot\notepad.exe"
    if ($args -ne $null)
    {
        # HACK: Resolve-Path added to get around issue with working directory.
        RunAs-Program $program (Resolve-Path $args)
    }
    else
    {
        RunAs-Program $program 
    }

}


# Set up some aliases for the functions defined.
Remove-Item -Path alias:ran -ErrorAction SilentlyContinue
New-Item -Path alias:ran -Value RunAs-Notepad

Remove-Item -Path alias:rap -ErrorAction SilentlyContinue
New-Item -Path alias:rap -Value RunAs-Program

Remove-Item -Path alias:raps -ErrorAction SilentlyContinue
New-Item -Path alias:raps -Value RunAs-PowerShell
