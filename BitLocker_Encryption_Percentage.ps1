If ((Get-Host).Version.Major -ge 3) {
    Try {
        $Error.Clear()
        (Get-BitLockerVolume -MountPoint "C:" -ErrorAction Stop).EncryptionPercentage
    } 
    Catch {
        Write-Output "BitLocker commands are not available"
    } 
}
Else {
    Write-Output "PowerShell v3 Required"
}