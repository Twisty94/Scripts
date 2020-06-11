# Создать ветку Application 
ErrorActionPreference = "Continue"
Write-EventLog -LogName ApplicaGetion -Source “1CScript” -EventID 1 -Message "1CRestart script started"
$svc = Get-Service '1C:Enterprise 8.3 Server Agent (x86-64)'
Stop-Service $svc
$svc.WaitForStatus('Stopped')
Write-Host $svc 'stopped'
Get-Process -Name rphost*,rmngr*,ragent* | Stop-Process -Force;
Start-Sleep -s 10
Write-EventLog -LogName Application -Source “1CScript” -EventID 1 -Message "rphost, rmngr, ragent seems to be killed"
remove-item "C:\Program Files\1cv8\srvinfo\reg_1541\24ba8143-b932-448b-9cc1-c246ebe30632\1Cv8Log\*.*" -Confirm:$false
Start-Service $svc
$svc.WaitForStatus('Running')
Write-Host $svc 'started'
Write-EventLog -LogName Application -Source “1CScript” -EventID 1 -Message "1CRestart script stopped"
