### 1. При помощи WMI перезагрузить все виртуальные машины.


$hosts = @("Pryahin_VM1", "Pryahin_VM2", "Pryahin_VM3")
Invoke-Command -ScriptBlock {Restart-Computer -Force} -ComputerName $hosts -Credential "LAPTOP-8CTIC557\Administrator"