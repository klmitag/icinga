#$ReturnCode:
# 0 > UP, OK
# 1 > UP, Warning
# 2 > DOWN, Critical
# 3 > DOWN, Unknown

$UpdateSession = New-Object -ComObject Microsoft.Update.Session
$UpdateSearcher = $UpdateSession.CreateupdateSearcher()
$Updates = @($UpdateSearcher.Search("IsHidden=0 and IsInstalled=0").Updates)

If (!$UpdateSearcher) {
    $ReturnCode = 2
    Write-Host 'Unable to get Windows Updates!'
}

If (!$Updates) {
    $ReturnCode = 0
    Write-Host 'No Windows Updates are pending!'
}

If ($Updates) {
    $Updates = $Updates | Select-Object Title, SupportUrl | Format-Table
    $ReturnCode = 1
    Write-Host "There are Windows Updates pending!" $Updates
}