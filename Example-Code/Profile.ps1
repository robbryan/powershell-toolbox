#
# Profile.ps1 - Record the Windows PowerShell Console session
#

if ($Host.Name -eq "ConsoleHost")
{
    $randPart = Get-Random
    $datePart = Get-Date -f yyyy-MM-dd-hhmmss
    $fileName = "Transcript_{0}_{1}_{2}_{3}.txt" -f $env:COMPUTERNAME, $env:USERNAME, $datePart, $rnd

    Start-Transcript -Path (Join-Path "D:\Transcripts" -ChildPath $fileName)
}
