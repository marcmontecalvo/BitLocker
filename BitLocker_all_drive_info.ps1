If ((Get-Host).Version.Major -ge 3) {
    Try {
        $Error.Clear()
        $BitLocker = Get-BitLockerVolume -ErrorAction Stop
    } 
    Catch [System.Management.Automation.CommandNotFoundException] {
        Write-Output "BitLocker commands are not available"
    } 
    Catch [Microsoft.Management.Infrastructure.CimException] {
        Write-Output "An Error Occured:"
        Write-Output $Error.Exception
    }
    Catch {
        Write-Output "An Error Occured:"
        $Error.Exception.GetType().FullName
        $Error.Exception
    }
    $Status = Foreach ($Drive in $BitLocker) {
        $DriveKeyProtector = $Drive.KeyProtector | Where-Object KeyProtectorType -CContains "RecoveryPassword"
        [pscustomobject] [ordered] @{
            Drive       = $Drive.MountPoint
            DriveSizeGB = $Drive.CapacityGB
            DriveType   = $Drive.VolumeType
            Status      = $Drive.VolumeStatus
            LockStatus  = $Drive.LockStatus
            Percentage  = $Drive.EncryptionPercentage
            Protection  = $Drive.ProtectionStatus
            KeyID       = $DriveKeyProtector.KeyProtectorId
            Password    = [string]$Drive.KeyProtector.RecoveryPassword
        }
    }
    If ($null -ne $Status) {
        Write-Output $Status
    }
}
Else {
    Write-Output "BitLocker commands are not available. PowerShell Upgrade Required"
}
