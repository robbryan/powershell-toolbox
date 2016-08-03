# Generate-Password
---
The script is extremely simple, it's used from time to time to generate random passwords.
It uses the Add-Type cmdlet to include the assembly in the session:

```powershell
Add-Type -AssemblyName System.Web
[System.Web.Security.Membership]::GeneratePassword($length, $numNonAlphaChars)
```

...but an alternative approach is to use *LoadWithPartialName()*:

```powershell
[Reflection.Assembly]::LoadWithPartialName(”System.Web”) | Out-Null
[System.Web.Security.Membership]::GeneratePassword($length, $numNonAlphaChars)
```

However, *LoadWithPartialName()* has been decrecated, and so the script now uses Add-Type.

 