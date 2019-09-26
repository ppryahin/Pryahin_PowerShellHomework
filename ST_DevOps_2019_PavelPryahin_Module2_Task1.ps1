##TASK 1. Получите справку о командлете справки
Get-help | Get-Help

##TASK 2. Пункт 1, но детальную справку, затем только примеры
Get-Help | Get-Help -Detailed ##Детальная справка
Get-Help | Get-Help -Examples ##Примеры

##TASK 3. Получите справку о новых возможностях в PowerShell 4.0 (или выше)
Get-Help about_Windows_PowerShell_4.0 

##TASK 4. Получите все командлеты установки значений
Get-Command -CommandType Cmdlet | Where-Object Name -like Set-* 

##TASK 5. Получить список команд работы с файлами
Get-Command -CommandType Cmdlet | Where-Object Name -like *File* 

##TASK 6. Получить список команд работы с объектами
Get-Command -CommandType Cmdlet | Where-Object Name -like *Object*

##TASK 7. Получите список всех псевдонимов
Get-Alias

##TASK 8. Создайте свой псевдоним для любого командлета
Set-Alias SetAl Set-Alias ##Создадим псевдоним командлета установки псевдонима(SetAl)

##TASK 9. Просмотреть список методов и свойств объекта типа процесс
Get-Process | Get-Member

##TASK 10. Просмотреть список методов и свойств объекта типа строка
$sampletext = "Hello, World" ##Создадим переменную типа строка, чтобы считать её методы и свойства
$sampletext | Get-Member

##TASK 11. Получить список запущенных процессов, данные об определённом процессе
Get-Process ##Смотрим список запущенных процессов
Get-Process SkypeApp <#Handles  NPM(K)   PM(K)    WS(K)      CPU(s)     Id    SI  ProcessName
                     -------   ------    -----     -----    ------      --    --  -----------
                        765     93     188640     66348     63,08      2004   1   SkypeApp  #>

##TASK 12. Получить список всех сервисов, данные об определённом сервисе
Get-Service ##Получаем список сервисов
Get-Service appinfo <#Status   Name               DisplayName
                     ------   ----               -----------
                     Running  appinfo            Сведения о приложении#>


##TASK 13. Получить список обновлений системы
Get-HotFix

##TASK 14. Узнайте, какой язык установлен для UI Windows
Get-UICulture <#LCID             Name             DisplayName
               ----             ----             -----------
               1049             ru-RU            Русский (Россия)#>


##TASK 15. Получите текущее время и дату
Get-Date ##24 сентября 2019 г. 21:41:40

##TASK 16. Сгенерируйте случайное число (любым способом)
$a = Get-Random
$a ##1320927920

##TASK 17. Выведите дату и время, когда был запущен процесс «explorer». Получите какой это день недели. 
(Get-Process -Name explorer).StartTime ##24 сентября 2019 г. 17:44:58
(Get-Process -Name explorer).StartTime.DayOfWeek ##Tuesday

##TASK 18. Откройте любой документ в MS Word (не важно как) и закройте его с помощью PowerShell
$Word = New-Object -ComObject Word.Application ##Word запускается в фоновом режиме
$Word.Visible = $true ##Переводим Word из фонового режима в активный
$Document = $Word.Documents.Add() ##Создаем пустой документ
$File = C:\PowerShellCode\psword.doc
$Document.SaveAs([ref]$File) ##Сохраняем документ в папке на диске С
$Document.Close()
$Word.Quit() ##Закрываем документ и выходим из Word

##TASK 19. Подсчитать значение выражения S=... . N – изменяемый параметр. 
$n = Read-Host "input N" ##Ввод переменной n с клавиатуры
$count = 1
for ($i=1; $i -le $n; $i++) ##Цикл итерируется n кол-во раз
{
    $a += $i * 3 ##Подсчёт суммы 
    Write-Output("step $count = $a")
    $count++
}
Write-Output("sum = $a")##Вывод суммы

##TASK 20. Напишите функцию для предыдущего задания. Запустите её на выполнение.
function sum ($n)
{
   $a = 0
   $count = 1
   for($i = 1; $i -le $n; $i++)
   {
      $a += $i * 3
      write-output("step $count $a")
      $count++
   }
   write-output("sum: $a")
}

sum (read-host "input n: ")