### 2. При помощи WMI просмотреть список запущенных служб на удаленном компьютере. 

[string]$host = "Pryahin_VM1"
[string]$cred = "LAPTOP-8CTIC557\Administrator"
Invoke-Command -ScriptBlock { Get-Service | Where-Object {$_.Status -eq "Running" }} -ComputerName $host -Credential $cred