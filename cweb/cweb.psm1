function cweb ($srv,$select="signin") {
<#
.SYNOPSIS
Check http/https content and SSL Certificate
Using Invoke-WebRequest and Class .NET: System.Net.ServicePointManager
.DESCRIPTION
Example:
cweb https://ya.ru sign
.LINK
https://github.com/Lifailon/CWeb
#>
if (!$srv) {
Write-Host (Get-Help cweb).DESCRIPTION.Text -ForegroundColor Cyan
return
}
$iwr = iwr $srv
$status_code = $iwr.StatusCode -eq 200
$status = $iwr.BaseResponse.StatusCode
$info = $iwr.BaseResponse.Server
$Content = $iwr.Content -split "\s"
if (($Content | Select-String $select).Count -ne 0) {
$Status_content = "Available"
} elseif (($Content | Select-String $select).Count -eq 0) {
$Status_content = "Not available"
}
$spm = [System.Net.ServicePointManager]::FindServicePoint("$srv")
$date_end = $spm.Certificate.GetExpirationDateString()
$cert_name = ($spm.Certificate.Subject) -replace "CN="
$cert_owner = ((($spm.Certificate.Issuer) -split ", ") | where {$_ -match "O="}) -replace "O="
$Out = "Host: $srv
Server: $info
Status GET: $status ($status_code)
Content ($select): $Status_content
Certificate: $cert_name.
Issued: $cert_owner.
Ends: $date_end"
$Out
}