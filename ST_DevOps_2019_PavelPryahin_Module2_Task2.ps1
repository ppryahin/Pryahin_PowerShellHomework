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

#########TASK 6############
Get-Process | Sort-Object CPU -descending | Select-Object -first 5 -Property ID,ProcessName, TotalProcessorTime | Out-File 'C:\Temp\M2T2_Pryahin\CPU_usage.txt'

#########TASK 7###########
Get-Process | Select-Object Name,@{Name='virtualmemoryusage(MB)';Expression={($_.vm / 1024kb)}}##не додумался, как доделать)

#########TASK 8###########
$a = Get-ChildItem 'C:\Pryahin_PowerShellHomework\' -Exclude *.tmp -Recurse -Force | Measure-Object -Property Length -Sum ##взял собственную папку, т.к. на виндовс не пускает
$a.sum ##31044 байта


#########TASK 9###########
reg query "HKLM\SOFTWARE\MICROSOFT" | Export-Csv C:\Temp\M2T2_Pryahin\reestr.csv


#########TASK 10##########
Get-History |  Export-Clixml C:\Temp\M2T2_Pryahin\History.xml

########TASK 11###########
Import-Clixml C:\Temp\M2T2_Pryahin\history.xml -OutVariable ExecutionStatus


#########TASK 12##########
Remove-Item C:\Temp\M2T2_Pryahin\ ##y - подтверждаем удаление
Remove-PSDrive M2T2_Pryahin