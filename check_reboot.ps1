#$ReturnCode:
# 0 > UP, OK
# 1 > UP, Warning
# 2 > DOWN, Critical
# 3 > DOWN, Unknown

$value = test-path -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
	 
# If path does not exist, return OK status
if ($value -match "False") {
    echo "OK - No reboot required"
    $returnCode=0
}
	 
# Else return WARNING status
else {
    echo "WARNING - Reboot required"
    $returnCode=1
}

Exit ($ReturnCode)