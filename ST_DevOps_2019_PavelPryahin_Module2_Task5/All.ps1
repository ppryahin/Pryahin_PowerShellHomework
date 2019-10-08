### 1. При помощи WMI перезагрузить все виртуальные машины.


$hosts = @("Pryahin_VM1", "Pryahin_VM2", "Pryahin_VM3")
Invoke-Command -ScriptBlock {Restart-Computer -Force} -ComputerName $hosts -Credential "LAPTOP-8CTIC557\Administrator"

### 2. При помощи WMI просмотреть список запущенных служб на удаленном компьютере. 

[string]$host = "Pryahin_VM1"
[string]$cred = "LAPTOP-8CTIC557\Administrator"
Invoke-Command -ScriptBlock { Get-Service | Where-Object {$_.Status -eq "Running" }} -ComputerName $host -Credential $cred

### 3. Настроить PowerShell Remoting, для управления всеми виртуальными машинами с хостовой.

Enter-PSSession -ComputerName "Pyahin_VM1"

### 4. Для одной из виртуальных машин установить для прослушивания порт 42658. Проверить работоспособность PS Remoting.

[string]$host = "Pryahin_VM1"
[string]$cred = "LAPTOP-8CTIC557\Administrator"
Invoke-Command -ScriptBlock {Set-Item WSMan:\localhost\listener\listener*\port -Value 42658} -ComputerName $host -Credential $cred
## Проверим порт для прослушивания одной из виртуальных машин (default port 5985)
Get-Item WSMan:\localhost\listener\listener*\port | Format-List name, value  <#Вывод: Name  : Port
                                                                                      Value : 42658#>

### 5. Создать конфигурацию сессии с целью ограничения использования всех команд, кроме просмотра содержимого дисков.

[string]$cred = Get-Credential "LAPTOP-8CTIC557\Administrator"
New-PSSessionConfigurationFile -Path "C:\Temp\conffile\User.pssc" -VisibleCmdlets 'Get-ChildItem'
Register-PSSessionConfiguration -Name User -Path "C:\Temp\conffile\User.pssc" -RunAsCredential $cred -ShowSecurityDescriptorUI