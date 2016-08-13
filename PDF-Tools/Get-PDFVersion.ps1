<#
    .SYNOPSIS
        Display the version of a PDF file

    .DESCRIPTION
       Display the PDF version for any PDF files passed to the function.

    .EXAMPLE
        ls .\PDFs\*.pdf | Get-PDFVersion

        Version Filename
        ------- --------
              5 C:\PDFs\File_1.pdf
              3 C:\PDFs\File_2.pdf
              4 C:\PDFs\File_3.pdf
              4 C:\PDFs\File_4.pdf

    .NOTES
        Requires iTextSharp.dll and an environment variable set to the library location.    
#>
function Get-PDFVersion
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true, Position=0)]
        $Fullname
    )

    Begin
    {
        Add-Type -Path (Join-Path $env:iTextSharpLib  "iTextSharp.dll")
    }
    Process
    {
        [int32]$pdfVersion = 0
        $pdfFilename = Resolve-Path $Fullname
        $pdfReader = New-Object iTextSharp.text.pdf.pdfreader -ArgumentList $pdfFilename.Path
        if ([int32]::TryParse($pdfReader.PDFVersion.ToString(), [ref]$pdfVersion))
        {
            New-Object -TypeName PSObject -Property (
                    @{'Filename' = $Fullname;
                       'Version' = $pdfversion})
        }

    }
}