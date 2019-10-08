### 4. Для одной из виртуальных машин установить для прослушивания порт 42658. Проверить работоспособность PS Remoting.

[string]$host = "Pryahin_VM1"
[string]$cred = "LAPTOP-8CTIC557\Administrator"
Invoke-Command -ScriptBlock {Set-Item WSMan:\localhost\listener\listener*\port -Value 42658} -ComputerName $host -Credential $cred
## Проверим порт для прослушивания одной из виртуальных машин (default port 5985)
Get-Item WSMan:\localhost\listener\listener*\port | Format-List name, value  <#Вывод: Name  : Port
                                                                                      Value : 42658#>