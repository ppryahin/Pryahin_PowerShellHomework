### 6. Вывести свободное место на локальных дисках. На каждом и сумму.

$ArrayLogicalDisks = Get-WmiObject -Class "Win32_LogicalDisk" | Select-Object DeviceID, FreeSpace, VolumeName
[float]$SumDiskFreeSpace = 0
foreach ($LogicalDisk in $ArrayLogicalDisks){
    # Суммирование свободного места локальных дисков
    $SumDiskFreeSpace += ($LogicalDisk.FreeSpace / 1Gb)
    # Буква логического диска
    [string]$LetterDisk = $LogicalDisk.DeviceID                                                          
    # Вывод и кругление до трех цифр после точки свободного места логического диска
    Write-Output ("Disk $LetterDisk FreeSpace = {0:n3} Gb" -f ($LogicalDisk.FreeSpace / 1Gb))    
}
Write-Output ("Total FreeSpace = {0:n3} Gb" -f $SumDiskFreeSpace) <#Disk C: FreeSpace = 32,754 Gb
                                                                    Disk D: FreeSpace = 0,000 Gb
                                                                    Disk E: FreeSpace = 0,016 Gb
                                                                    Disk F: FreeSpace = 43,926 Gb
                                                                    Disk G: FreeSpace = 46,949 Gb
                                                                    Disk H: FreeSpace = 274,405 Gb
                                                                    Disk J: FreeSpace = 0,089 Gb
                                                                    Total FreeSpace = 398,138 Gb#>