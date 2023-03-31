If ((Get-Host).Version.Major -ge 3) {
    Try {
        $Error.Clear()
        (Get-BitLockerVolume -MountPoint "C:" -ErrorAction Stop).VolumeStatus
    } 
    Catch [System.Management.Automation.CommandNotFoundException]{
        Write-Output "BitLocker commands are not available"
    } 
    Catch [Microsoft.Management.Infrastructure.CimException]{
        Write-Output "An Error Occured:"
        Write-Output $Error.Exception
    } 
    Catch {
        Write-Output "An Error Occured:"
        $Error.Exception.GetType().FullName
        $Error.Exception
    }
} Else {
    Write-Output "PowerShell_3_Required"
}