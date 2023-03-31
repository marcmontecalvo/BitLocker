If ((Get-Host).Version.Major -ge 3) {
    Try {
        $Error.Clear()
        $KeyProtector = (Get-BitLockerVolume -MountPoint "C:" -ErrorAction Stop).KeyProtector | Where-Object KeyProtectorType -CContains "RecoveryPassword"
        $RecKeyID = $KeyProtector.KeyProtectorId ; if ($null -eq $RecKeyID) {Write-Output "N/A"} else {$RecKeyID=$RecKeyID.trim("{","}");$RecKeyID}
    } 
    Catch {
        Write-Output "BitLocker commands are not available"
    } 
} Else {
    Write-Output "PowerShell v3 Required"
}