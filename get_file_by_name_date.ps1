if ($args.Length -gt 0) 
	{$path = $args[0]
		$day = Get-Date -Format dd
		$yesterday = $day - 1
		$month = Get-Date -Format MM
		$premonth = $month - 1
		$year = Get-Date -Format yyyy
		$preyear = $year -1
		$newpath = $path
#проверяем 1 января - минус год
		if (($day -eq 1) -and ($month -eq 1))
			{ $newpath += "_backup_"+$preyear+"_12_31_" }
		else
		{ $newpath += "_backup_"+$year+"_" }
		
#проверим на 1 число и месяц
		if (($day -eq 1) -and ($month -gt 1))
		{
			$newpath += $premonth+"_"
			#31 число, проверим месяц
			if ($month -match [2,4,6,9,11])
				{$newpath += "31_"}
				else {$newpath += "30_"}
		}
		else {
			$newpath += $month+"_"+$yesterday+"_"
		}
		$file = Get-ChildItem -Path "e:\backup\" | where {$_.Name -like "$newpath*"}
		if ($file) { write-host $file.length}
		else {write-host "0"}
	}
