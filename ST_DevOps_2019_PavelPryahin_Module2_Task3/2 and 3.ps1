###### 2. Работа с профилем
## 2.1. Создать профиль
New-Item -Path $profile -ItemType "File" -Force

### 2.2. В профиле изменить цвета в консоли PowerShell
psedit $profile  ##команда, кстати, не работает в обычной строке PS, но работает в среде ISE и VSC. Переходим в настройки профиля.
(Get-Host).UI.RawUI.ForegroundColor = "Yellow"
(Get-Host).UI.RawUI.BackgroundColor = "Black"

### 2.3. Создать несколько собственных алиасов
Set-Alias MyService Get-Service
Set-Alias MyProcess Get-Process

### 2.4. Создать несколько констант

Set-Variable pi -Option Constant -Value 3.14
Set-Variable g -Option Constant -Value 9.8

### 2.5. Изменить текущую папку

[string]$Root = "C:\"
[string]$NameFolder = "Temp"
[string]$RootNameFolder = $Root + $NameFolder                           # Сохранение пути в переменную
if ((Test-Path $RootNameFolder) -ne "True")                             # Проверка на наличие и смена папки
{  
   New-Item -Path $Root -Name $NameFolder -ItemType "Directory"
   Set-Location $RootNameFolder 
}
else {
   Set-Location $RootNameFolder                                         # Меняем текущую папку
}

### 2.6. Вывести приветствие

Write-Host("Welcome to Hell!") -ForegroundColor red

### 2.7. Проверить применение профиля
MyService        ##вывел список служб
$g               ##вывел созданную константу


### 3. Получить список всех доступных модулей

Get-Module -ListAvailable -All