cls 

$ip = Get-NetIPAddress | where {$_.InterfaceAlias -eq 'Ethernet' -and $_.AddressFamily -eq 'IPv4'} | select-object -expandproperty ipaddress
 
$machinedomain = gwmi -class win32_computersystem | select -expandproperty domain

$hostname = gwmi -class win32_computersystem | select -ExpandProperty name

$ram = gwmi -class win32_computersystem | select -expandproperty totalphysicalmemory
$ram = $ram / 1mb 

$cpu = gwmi -class win32_processor | select -expandproperty Name

$OSversion = gwmi -class win32_operatingsystem | select -expandproperty Caption

write-host "*****************************************************"
write-host "*                   $hostname                           "
write-host "*         Logged On User: $env:USERNAME        "
write-host "*  $osversion     "
write-host "*      CPU: $cpu   "
write-host "*                RAM: $ram"
write-host "*      IP: $ip   Machine Domain: $machinedomain "
write-host "*****************************************************"

