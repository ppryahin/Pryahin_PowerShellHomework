### 1. Вывести список всех классов WMI на локальном компьютере.

Get-WmiObject –list
# gwmi -list

### 2. Получить список всех пространств имён классов WMI. 

Get-WmiObject -Namespace Root -Class __Namespace | Select-Object -Property Name

### 3. Получить список классов работы с принтером.

Get-WmiObject -List "*Printer*"

### 4. Вывести информацию об операционной системе, не менее 10 полей.

$OSInfo = Get-WmiObject -Class "Win32_OperatingSystem" | Select-Object PSComputerName, BuildNumber, Status,`
Caption, NumberOfUsers, OSArchitecture, OSLanguage, SystemDrive , TotalVirtualMemorySize, FreeVirtualMemory
Write-Output($OSInfo)

### 5. Получить информацию о BIOS.

Get-WmiObject -Class "Win32_BIOS"

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

### 7. Написать сценарий, выводящий суммарное время пингования компьютера (например 10.0.0.1) в сети.

[CmdletBinding(PositionalBinding=$false)]
Param 
(
    [parameter (Mandatory = $true, HelpMessage = "Enter IP of Computer", Position = 0)]
    [string]$IpOfComputerPing,

    [parameter (Position = 1)]
    [int]$Times = 3
)

$SumTimePing = 0
for ([int]$i = 0; $i -lt $Times; $i++)
{
    $Ping = Get-WmiObject -Query "select * from win32_pingstatus where Address='$IpOfComputerPing'"       # ping IP
    Write-Output ("Response from " + $Ping.PSComputerName + " to $IpOfComputerPing : " + "bytes=" + $Ping.BufferSize`
    + " time=" + $Ping.ResponseTime + " ms TTL=" + $Ping.TimeToLive)
    $SumTimePing += $Ping.ResponseTime
}
Write-Output("Total time of response to $IpOfComputerPing = $SumTimePing ms")

##### 8. Создать файл-сценарий вывода списка установленных программных продуктов в виде таблицы с полями Имя и Версия.

Get-WmiObject -Class "Win32_Product" | Select-Object Name, Version | Format-Table -AutoSize