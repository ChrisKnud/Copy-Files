function Copy-Files {
    param(
        [Parameter(Mandatory=$true)]
        [string]$object
    )
    
    $path = "$env:PSCOPYPATH/$object/*"
    Write-Output "Running Copy-Files..."
    
    try {
        if (Test-Path -Path $path) {
        Copy-Item -Path $path -Recurse -Destination "./" -ErrorAction stop
        Write-Output "$object files successfully copied."
        } else {
        Write-Output "Path does not exist."
        }
    }
    catch [System.IO.IOException]{
        Write-Output "The files/folder already exists. Would you like to overwrite it? [y/n]"
        $userInput = Read-Host
        if ($userInput -eq "y") {
            Copy-Item -Path $path -Recurse -Destination "./" -Force
            Write-Output "$object files successfully copied."
        } elseif ($userInput -eq "n"){
            Write-Output "Files/Folder are not copied."
        } else {
            Write-Output "Invalid argument."
        }
    }
}
