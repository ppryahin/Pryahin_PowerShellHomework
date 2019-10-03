[CmdletBinding()]
Param 
(
    [parameter (Mandatory = $true, HelpMessage = "Укажите папку для которой нужно посчитать занимаемый ею размер: ")]
    [string]$DirectoryPath ,                          
    [string]$ExcludeType = "Temp", 
    [int]$Total = 0
)

$FilesArrayLength = @(Get-ChildItem -Path $DirectoryPath -Recurse -file -Exclude "*.$ExcludeType" -ErrorAction SilentlyContinue | Select-Object Length)
foreach ($i in $FilesArrayLength)
{
    $Total += ($i.Length/1MB)                         
}
Write-Output("Total: " + $Total + " MB") ##для папки C:\Windows\ у меня вывело Total: 21903 MB