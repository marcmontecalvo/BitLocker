If ((Get-Host).Version.Major -ge 3) {
    Try {
        $Error.Clear()
        (Get-BitLockerVolume -MountPoint "C:" -ErrorAction Stop).VolumeStatus
    } 
    Catch [System.Management.Automation.CommandNotFoundException]{
        Write-Output "BitLocker commands are not available"
    } 
    Catch {
        Write-Output "An Error Occurred"
    }
} Else {
    Write-Output "PowerShell_3_Required"
}