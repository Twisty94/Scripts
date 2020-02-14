Import-Module activedirectory
$user = $env:USERNAME
$comp = $env:COMPUTERNAME
$data = Get-Date
$str="User: " + $user + ". Last logon: " + $data
#Get-ADComputer -Identity $comp -Properties *
Set-ADComputer $comp -Replace @{description = $str}

$CurrentDate = Get-Date
"Exit; " + $env:USERNAME +"; "  + $CurrentDate >> "\\shared\Enter_Exit\Компьютеры\$env:COMPUTERNAME.txt"
"Exit; " + $env:COMPUTERNAME +"; "  + $CurrentDate >> "\\shared\Enter_Exit\Пользователи\$env:USERNAME.txt"

$CurrentDate = Get-Date
"Enter; " + $env:USERNAME +"; "  + $CurrentDate >> "\\shared\Enter_Exit\Компьютеры\$env:COMPUTERNAME.txt"
"Enter; " + $env:COMPUTERNAME +"; "  + $CurrentDate >> "\\shared\Enter_Exit\Пользователи\$env:USERNAME.txt"
