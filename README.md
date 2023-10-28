# Copy-Files
Short Powershell function for copying files or folders that are recently used. An example might be *.vscode* settings you regularly use or website assets.

## Setup
1. Make a directory containing the files and folders you want to access.
2. Copy this path to an enviroment variable called *PSCOPYPATH*
3. Add the following line to your Powershell profile( **Remember the '.'** ). If you do not have a profile, check out the *Powershell profile* section:
```
. "<The path to your Copy-Files script>"
```
4. Restart Powershell

## Use
1. Make subdirectories in the folder you made in step 1. of *Setup*.
2. Copy these folders to your current directory:
```
Copy-Files <folder name>
```

## Powershell profile
Check if you have a powershell profile:
```
Test-Path $profile
```
If not make one:
```
New-Item -Path $profile -Type File -Force
```
Open your profile:
```
notepad $profile
```
[1]
### References
[1]	R. Mens, ‘How to use Try, Catch, Finally in PowerShell’. Accessed: Oct. 10, 2023. [Online]. Available: https://lazyadmin.nl/powershell/try-catch-finally/