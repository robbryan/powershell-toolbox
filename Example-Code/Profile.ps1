#
# Profile.ps1 - Record the Windows PowerShell Console session
#

$env:HISTORYFILE = "~/.powershell_history.csv"


function Import-History()
{
    If (Test-Path $env:HISTORYFILE)
    {
        Import-Csv $env:HISTORYFILE | Add-History
    }
}

function Export-History()
{
    Get-History | Export-Csv $env:HISTORYFILE
}

function quit()
{
    Export-History
    exit
}

if ($Host.Name -eq "ConsoleHost")
{
    Import-History

    Register-EngineEvent PowerShell.Exiting -action {quit}

    # Use a colour scheme reminiscent of the Turbo languages...
    $host.ui.RawUI.ForegroundColor="yellow"
    $host.ui.RawUI.BackgroundColor="DarkMagenta"
    
    $randPart = Get-Random
    $datePart = Get-Date -f yyyy-MM-dd-hhmmss
    $fileName = "Transcript_{0}_{1}_{2}_{3}.txt" -f $env:COMPUTERNAME, $env:USERNAME, $datePart, $randPart

    Start-Transcript -Path (Join-Path "D:\Transcripts" -ChildPath $fileName)
}
