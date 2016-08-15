# Creating Zip Files  

---   

Creating ZIP files used to be interesting, there were several methods to compress files.  

## Install Write-Zip Cmdlets  

Install the [PowerShell Community Extensions](https://pscx.codeplex.com/).
Simple. Straight forward. (Boring?)  

## Call a Compression Program  

The easiest way was to take a leaf out of the batch/command scripting booklet  
and simply call a program like [7-Zip](http://www.7-zip.org/). There is even a stand-alone EXE 7za.exe  
that eliminates the need to actually install anything (other than copy the EXE).  

## Use a Compressed Folder  

Another method was to create a folder called something like "MyFiles.zip", making  
it a compressed folder *(Set-Content "PK" anyone?)* and copy your files into it.   

## Use the .NET Framework  

Another method that's been tried, and was generally preferred was to add the  
*[System.IO.Compression.FileSystem](https://msdn.microsoft.com/en-us/library/system.io.compression.zipfile(v=vs.110).aspx)* assembly and use the function:  
CreateFromDirectory() in the static ZipFile class.  

## PowerShell 5.0 - Archive Cmdlets  

Now the cmdlets [Compress-Archive](https://technet.microsoft.com/en-us/library/dn841358.aspx) and [Expand-Archive](https://technet.microsoft.com/en-us/library/dn841359.aspx) are available, so we can     
dispense with all that tedious mucking about in hyperspace.  
