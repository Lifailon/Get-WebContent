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
$global:Out = "Host: $srv
Server: $info
Status GET: $status ($status_code)
Content ($select): $Status_content
Certificate: $cert_name.
Issued: $cert_owner.
Ends: $date_end"
$Out
}

function Send-Yandex ($mess) {
$srv_smtp = "smtp.yandex.ru" 
$port = "587"
$from = "login@yandex.ru" 
$to = "login@yandex.ru" 
$user = "login"
$pass = "password"
$subject = "Content not available"
$Message = New-Object System.Net.Mail.MailMessage
$Message.From = $from
$Message.To.Add($to) 
$Message.Subject = $subject 
$Message.IsBodyHTML = $true
$Message.Body = $mess
$smtp = New-Object Net.Mail.SmtpClient($srv_smtp, $port)
$smtp.EnableSSL = $true 
$smtp.Credentials = New-Object System.Net.NetworkCredential($user, $pass);
$smtp.Send($Message) 
}

cweb https://yandex.ru signin
if ($out -match "Not available") {
Send-Yandex $out
}