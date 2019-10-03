### 1.5. Создать один скрипт, объединив 3 задачи

[CmdletBinding()]
Param
(
    [string]$Root = "C:\",
    [parameter(Mandatory = $true, HelpMessage = "Введите имя папки:")]
    [string]$NameFolder,
    [string]$NameFileCSV = "SecurityUpdates.csv",
    [string]$NameFileXML = "HKLM_SOFTWARE_Microsoft.xml",
    [string]$RootNameFolder = $Root + $NameFolder,                                   
    [string]$RootNameFolderNameFileCSV = $Root + $NameFolder + "\" + $NameFileCSV,   
    [string]$RootNameFolderNameFileXML = $Root + $NameFolder + "\" +  $NameFileXML   
)

New-Item -Path $Root -Name $NameFolder -ItemType Directory                           # Создание папки
foreach ($i in Get-HotFix | Select-Object Description, HotFixID, InstalledBy, InstalledOn, PSComputerName)
{
    if ($i.Description -eq "Security Update")
    {
        $i | Export-Csv -Path $RootNameFolderNameFileCSV -NoTypeInformation -Append  ### 1.5.1. Сохранить в CSV-файле информацию обо всех обновлениях безопасности ОС.
    }
} 

### 1.5.2. Сохранить в XML-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft.

Get-ChildItem -LiteralPath HKLM:\SOFTWARE\Microsoft | Export-Clixml -Path $RootNameFolderNameFileXML ##Вроде должно быть так, но меня с этой командой почему-то не пускает в реестр

### 1.5.3. Загрузить данные из полученного в п.1.5.1 или п.1.5.2 файла и вывести в виде списка разным разными цветами

$DataSecurityUpdates = Get-Content -Path $RootNameFolderNameFileCSV               # Читаем .csv файл
$DataRegistry = Get-Content -Path $RootNameFolderNameFileXML                      # Читаем .xml файл(которого нет))))

function Color ($Data, [System.ConsoleColor]$Color)                            # Функция вывода
{
    foreach ($i in $Data)
    {
        Write-Host($i) -ForegroundColor $Color
    }
}

Color -data $DataSecurityUpdates -color "Yellow"
Color -data $DataRegistry -color "Red"