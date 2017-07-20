# Zabbix_scripts

zabbix_ahent_conf
#SQL backups
UserParameter=msSQLYesterdayBackupSize.[*], powershell.exe -NoProfile -ExecutionPolicy Bypass -file "C:\zabbix_agent\bin\get_file_by_name_date.ps1" $1
