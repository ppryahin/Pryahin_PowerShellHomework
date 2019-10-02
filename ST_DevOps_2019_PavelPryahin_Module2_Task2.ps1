###########TASK 1############
reg query HKCU

##########TASK 2############
New-Item -Path 'C:\Temp\TestCreate' -ItemType "directory" ##создаём каталог
Rename-Item -Path 'C:\Temp\TestCreate' -NewName "TestRename" ##переименовываем
Remove-Item -Path 'C:\Temp\TestRename\' ##удаляем

##########TASK 3############
New-Item -Path 'C:\Temp\M2T2_Pryahin' -ItemType "directory"
New-PSDrive -Name M2T2_Pryahin -PSProvider FileSystem -Root 'C:\Temp\M2T2_Pryahin'

#########TASK 4############
Get-Service | Where-Object {$_.Status -eq "Running"} | Out-File 'C:\Temp\M2T2_Pryahin\Services.txt'
Get-Content C:\Temp\M2T2_Pryahin\Services.txt


#########TASK 5############
[int]$tmp = 0
foreach ($i in (Get-Variable | Select-Object Value))
{
    if ($i.Value -is [int])
    {
        Write-host("Value: " + $i.Value)
        $tmp += $i.Value
    }
}
Write-Host("Sum = $tmp")

#########TASK 6############
Get-Process | Sort-Object CPU -descending | Select-Object -first 5 -Property ID,ProcessName, TotalProcessorTime | Out-File 'C:\Temp\M2T2_Pryahin\CPU_usage.txt'

#########TASK 7###########
$Array = @(Get-Process| Select-Object VirtualMemorySize, Name)
foreach($i in $Array){
    if (($i.VirtualMemorySize / 1000000) -gt 100 )
    {
        Write-Host("Process: " + $i.Name + "---" + ( $i.VirtualMemorySize / 1000000) + " Mb") -ForegroundColor Red
    }
    else 
    {
        Write-Host("Process: " + $i.Name + "---" + ( $i.VirtualMemorySize / 1000000) + " Mb") -ForegroundColor Green    
    }
    
}

#########TASK 8###########
$a = Get-ChildItem 'C:\Pryahin_PowerShellHomework\' -Exclude *.tmp -Recurse -Force | Measure-Object -Property Length -Sum ##взял собственную папку, т.к. на виндовс не пускает
$a.sum ##31044 байта


#########TASK 9###########
reg query "HKLM\SOFTWARE\MICROSOFT" | Export-Csv C:\Temp\M2T2_Pryahin\reestr.csv


#########TASK 10##########
Get-History |  Export-Clixml C:\Temp\M2T2_Pryahin\History.xml

########TASK 11###########
Import-Clixml C:\Temp\M2T2_Pryahin\history.xml | Select-Object Length, ReadCount, PSChildName, PSDrive, PSPath


#########TASK 12##########
Remove-Item C:\Temp\M2T2_Pryahin\ ##y - подтверждаем удаление
Remove-PSDrive M2T2_Pryahin