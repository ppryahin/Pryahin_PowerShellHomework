## 1.3.	Вывести список из 10 процессов занимающих дольше всего процессор. Результат записывать в файл.

Param
(
    [string]$NameFolder = "Temp",
    [string]$Root = "C:\",
    [string]$NameFile = "Processes.txt",
    [string]$RootNameFolder = $Root + $NameFolder,                            # Сохраняем путь в переменную
    [string]$RootNameFolderNameFile = $Root + $NameFolder + "\" +  $NameFile  # Сохраняем путь в переменную
)
New-Item -Path $Root -Name $NameFolder -ItemType "Directory"                  # Создаем папку
Get-Process | Sort-Object UserProcessorTime -Descending -ErrorAction SilentlyContinue | `
Select-Object Name, Id, UserProcessorTime -First 10 > $RootNameFolderNameFile # список из 10 процессов занимающих дольше всего процессор
Get-Content $RootNameFolderNameFile ##вывод данныз в консоль