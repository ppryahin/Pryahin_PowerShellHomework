### 2. Получить список всех пространств имён классов WMI. 

Get-WmiObject -Namespace Root -Class __Namespace | Select-Object -Property Name