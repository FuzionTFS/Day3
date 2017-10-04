get-help tfs
# Error Then
add-pssnapin Microsoft.TeamFoundation.PowerShell
	
get-help tfs
# or
Get-Command -module Microsoft.TeamFoundation.PowerShell

$serverUrl = "http://vsalm:8080/tfs"
Get-TfsServer -Name $serverUrl
