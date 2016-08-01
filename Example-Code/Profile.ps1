#
# Profile.ps1 - Record the Windows PowerShell Console session
#

if ($Host.Name -eq "ConsoleHost")
{
    Start-Transcript -Path (Join-Path "D:\Transcripts" -ChildPath ("Transcript_{0}_{1}_{2}_{3}.txt" -f $env:COMPUTERNAME, $env:USERNAME, (Get-Date -f yyyy-MM-dd-hhmmss), (Get-Random)))
}
