[CmdletBinding()]
Param 
(
    [int]$tmp = 0
)

foreach ($i in (Get-Variable | Select-Object Value))
{ 
    if ($i.Value -is [int])
    {
        $tmp += $i.Value
    }
}
Write-Host("Sum = $tmp")