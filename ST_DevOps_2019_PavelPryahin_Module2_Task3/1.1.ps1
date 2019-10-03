[CmdletBinding()]
Param 
( 
    [parameter(Mandatory = $true, HelpMessage = "Введите имя диска:")]
    [string]$DiskName,
    
    [string]$Root = "C:\",
    
    [parameter(Mandatory = $true, HelpMessage = "Введите имя папки:")]
    [string]$NameFolder,

    [string]$NameFile = "Service.txt",
    [string]$PathDiskFile = $DiskName + ":\" + $NameFile,                     # Сохраняем путь в переменную
    [string]$PathRootNameFolder = $Root + $NameFolder                         # Сохраняем путь в переменную
)

New-Item -Path $Root -Name $NameFolder -ItemType "Directory"                  # Создаем папку                                             # Сохраним путь к файлу в переменную
Get-Service | Where-Object {$_.Status -eq 'Running'} > $PathDiskFile          # Записываем запущенные службы в файл
Get-Content $PathDiskFile                                                     # Извлекаем данные из файла и отображаем в консоли

####
#Remove-Item -Path $PathRootNameFolder  -Force -Recurse                       # Удаляем папку
