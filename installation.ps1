Write-Output "
======================
  Install Copy-Files 
======================

Press 'ctrl + c' to exit.
"

$mainDirectory = Read-Host "Full path of main directory"
Write-Output "Main directory: $mainDirectory"

if (!(Test-Path -Path $mainDirectory)) {
    $userInput = Read-Host "The folder does not exist, would you like to create it?[y/n]"
    switch ($userInput) {
        "y" {
            New-Item $mainDirectory -ItemType Directory
            Write-Output "Made directory: $mainDirectory"
        }
        "n" {
            Write-Host "Path does not exist.`nExiting..." 
            exit 0 
        }
        Default { Write-Output "Invalid argument." }
    }
}

$userInput = Read-Host "Add main directory to enviroment variable? [y/n]"

switch ($userInput) {
    "y" {
        if (Test-Path "env:PSCOPYPATH") {
            Throw "Enviroment variable already exists."
        } else {
            [Environment]::SetEnvironmentVariable('PSCOPYPATH', "$mainDirectory", 'User')
            Write-Output "Set enviroment variable: 
            PSCOPYPATH: $mainDirectory"
            Write-Output "Restart Powershell to make the changes active."
        }
    }
    "n" {
        Write-Output "Installation cancelled.`nExiting..."
    }
    Default { Write-Output "Invalid argument." }
}
