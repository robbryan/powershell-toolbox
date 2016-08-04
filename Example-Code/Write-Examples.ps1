#
# Write-Examples.ps1 - Simple examples of the Write-* cmdlets
#

Param
(
    [switch]$Debug=$false,
    [switch]$Verbose=$false,
    [switch]$Warning=$false,
    [switch]$Information=$false
)


## Write-Host - Good for writing coloured text, but it writes directly to the console 
#               host, and therefore cannot be redirected (and that can be frustrating)
# 
# Can use -NoNewline to output multiple lines on the same row.
# Can use in conjunction with Read-Host if a coloured prompt is needed.

Write-Host -ForegroundColor Red -BackgroundColor Black "Danger, Will Robinson!"


## Write-Output - Standard way to display normal information. 

$fileName = "File1.dat"
Write-Output "Processing file $fileName" 

## write is an alias for Write-Output
write ("Username is {0}" -f $env:USERNAME)


## Write-Debug - Good for optional output. 

$DebugPreference = "SilentlyContinue"
# supply -Debug parameter to the script
if ($Debug)
{
    #  Set $DebugPreference = "Continue" to see the debug output
    $DebugPreference = "Continue"
}

Write-Debug "In the Write-Debug section." 
Write-Debug "After the Write-Debug section." 


 
## Write-Error
Write-Error "File not found $fileName"


## Write-Progress - Display a progress bar

for ($i=1; $i -le 5; $i++)
{
    Write-Progress -Activity "Progress Bar" -Status "Progressing..." -PercentComplete ($i * 20)
    Start-Sleep 1
}


## Write-Verbose - Display additional information if the $VerbosePreference variable is set

$VerbosePreference = "SilentlyContinue"
# supply -Verbose parameter to the script
if ($Verbose)
{
    #  Set $VerbosePreference = "Continue" to see the verbose output
    $VerbosePreference = "Continue"
}

Write-Verbose "This is additional information"


## Write-Warning - Display a warning message if the $WarningPreference variable is set

$WarningPreference = "SilentlyContinue"
# supply -Warning parameter to the script
if ($Warning)
{
    #  Set $WarningPreference = "Continue" to see the Warning output
    $WarningPreference = "Continue"
}

Write-Warning "The bridge is out!"


# Write-Information - A new information stream, in PowerShell 5.0
#

$InformationPreference = "SilentlyContinue"
# supply -Information parameter to the script
if ($Information)
{
    #  Set $InformationPreference = "Continue" to see the Information output
    $InformationPreference = "Continue"
}

Write-Information "This is new information"



### Redirecting Output Streams ###

#   *   All output
#   1   Success output
#   2   Errors
#   3   Warning messages
#   4   Verbose output
#   5   Debug messages
#   6   Informational messages 

# Used for redirection, e.g. 2>&1 sends errors and success to the success output stream.
# Use 2> to send errors to a file. Use *> to send all output to a file.

