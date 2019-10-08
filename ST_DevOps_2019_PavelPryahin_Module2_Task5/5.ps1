### 5. Создать конфигурацию сессии с целью ограничения использования всех команд, кроме просмотра содержимого дисков.

[string]$cred = Get-Credential "LAPTOP-8CTIC557\Administrator"
New-PSSessionConfigurationFile -Path "C:\Temp\conffile\User.pssc" -VisibleCmdlets 'Get-ChildItem'
Register-PSSessionConfiguration -Name User -Path "C:\Temp\conffile\User.pssc" -RunAsCredential $cred -ShowSecurityDescriptorUI