$uri = "http://vsalm:8080/tfs/DefaultCollection/_apis/projects?api-version=2.0"
$method = "Get"
$contentType = "application/json"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add('Accept', $contentType)
$headers.Add('Content-Type', $contentType)

$username = "administrator" 
$password = "P2ssw0rd"  
$password_base64 = ConvertTo-SecureString $password -AsPlainText -Force  
$creds = New-Object System.Management.Automation.PSCredential ($username, $password_base64)

Invoke-RestMethod -Uri $uri -Method $method -Headers $headers -Credential $creds 
Invoke-WebRequest -Uri $uri -Method $method -Headers $headers -Credential $creds 