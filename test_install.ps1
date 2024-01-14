function Test-Installation {
    if ((Test-Path "env:PSCOPYPATH") -and (Test-Path -Path $env:PSCOPYPATH) -and (Test-Path $profile) -and (Select-String -Path $profile -Pattern "copy_files.ps1" -SimpleMatch)) {
        return $true
    } else { return $false }
}

Write-Output "Testing if Copy-Files was successfully installed..."

if (Test-Installation) {
    Write-Output "PSCOPYPATH: $env:PSCOPYPATH"
    Write-Output "Profile: $profile"
    Write-Output "Copy-Files set in the powershell profile."
    Write-Host -ForegroundColor Green "Copy-Files successfully installed."
} else {
   Write-Error "Error: An error occured. Copy-Files is not installed."
}