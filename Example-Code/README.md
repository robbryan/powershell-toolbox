# Example-Code
---
## Invoke-Examples.ps1
A collection of PowerShell code snippets, doesn't really do anything, and not meant to produce anything important.
  
## Profile.ps1
An example of how to use Start-Transcript to automatically record a console session at a set location with a unique filename for the current user. Place the Profile.ps1 script into a known location, like:  
C:\Users\%username%\Documents\WindowsPowerShell

## Set-FilePermission.ps1  
A simple script that demonstrates how to add a permission to a file for a given user.  

## Set-FolderPermission.ps1  
A simple script that demonstrates how to add a permission to a folder for a given user. Slightly trickier than a file, as the ContainerInherit and ObjectInherit [inheritance flags](https://msdn.microsoft.com/en-us/library/system.security.accesscontrol.inheritanceflags.aspx) are included.  

## Test-Workstation.ps1  
A completely superfluous script to 'ping' workstations. Essentially a wrapper to Test-Connection to provide an example of using calculated properties.   

## Write-Examples.ps1
Simple examples of Write-Host, Write-Output, Write-Debug, Write-Error, Write-Progress, Write-Verbose, Write-Warning, and Write-Information.
