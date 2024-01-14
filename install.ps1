Write-Output "
======================
  Install Copy-Files 
======================

Press 'ctrl + c' to exit.
"

function InvalidArgument { Write-Output "Invalid argument." }

$mainDirectory = Read-Host "Full path of main directory"
Write-Output "Main directory: $mainDirectory"

# Add folder if it does not exist
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
        Default { InvalidArgument }
    }
}

$userInput = Read-Host "Add main directory to enviroment variable? [y/n]"

# Add main directory to enviroment variable if it does not exist.
switch ($userInput) {
    "y" {
        if (Test-Path "env:PSCOPYPATH") {
            Throw "Enviroment variable already exists."
        } else {
            [Environment]::SetEnvironmentVariable('PSCOPYPATH', "$mainDirectory", 'User')
            Write-Output "Set enviroment variable: 
            PSCOPYPATH: $mainDirectory"
            #Write-Output "Restart Powershell to make the changes active."
        }
    }
    "n" {
        Write-Output "Main directory not added to enviroment variable."
    }
    Default { InvalidArgument }
}

# Make powershell profile if it does not exist.
if (!(Test-Path $profile)) {
    $userInput = Read-Host "No powershell profile exists. Would you like to create one? [y/n]"
    switch ($userInput) {
        "y" {
            Write-Output "Making new powershell profile..."
            New-Item -Path $profile -Type File -Force
            Write-Output "New powershell profile made."
        }
        "n" {
            Write-Output "No profile was made."
        }
        Default { InvalidArgument }
    }
} 

# Add copy_files to powershell profile
if (!(Select-String -Path $profile -Pattern "copy_files.ps1" -SimpleMatch)) {
    Write-Output "Adding Copy-Files to powershell profile..."
    Add-Content -Path $profile -Value "# Custom scripts`n. $PWD\copy_files.ps1"
    Write-Output "Copy-Files added to powershell profile."
}

Write-Host -ForegroundColor Yellow "Restart powershell and run .\test_install.ps1 to check if the installation was successful."