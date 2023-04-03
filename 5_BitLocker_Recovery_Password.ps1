If ((Get-Host).Version.Major -ge 3) {
    Try {
        $Error.Clear()
        $RecPass = (Get-BitLockerVolume -MountPoint "C:" -ErrorAction Stop).KeyProtector.RecoveryPassword | Where-Object Length -GT 5 ; if ($null -eq $RecPass) { Write-Output "N/A" } else { $RecPass }
    } 
    Catch {
        Write-Output "BitLocker commands are not available"
    } 
}
Else {
    Write-Output "PowerShell v3 Required"
}