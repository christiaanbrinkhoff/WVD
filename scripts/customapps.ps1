# variables
$fsLogixURL="https://aka.ms/fslogix_download"
$installerFile="fslogix_download.zip"
$path="c:\temp"

#Create temp folder
New-Item -Path $path -ItemType Directory -Force | Out-Null

#Install FSLogix
Invoke-WebRequest $fsLogixURL -OutFile $path\$installerFile
Expand-Archive $path\$installerFile -DestinationPath $path\fsLogix\extract
Start-Process -FilePath $path\fsLogix\extract\x64\Release\FSLogixAppsSetup.exe -Args "/install /quiet /norestart" -Wait
Write-Host "Fslogix Install Succeeded"

#Install VSCode
Invoke-WebRequest -Uri 'https://go.microsoft.com/fwlink/?Linkid=852157' -OutFile '$path\VScode.exe'
Invoke-Expression -Command '$path\VScode.exe /verysilent'

#Start sleep
Start-Sleep -Seconds 10

#InstallNotepadplusplus
Invoke-WebRequest -Uri 'https://notepad-plus-plus.org/repository/7.x/7.7.1/npp.7.7.1.Installer.x64.exe' -OutFile '$path\notepadplusplus.exe'
Invoke-Expression -Command '$path\notepadplusplus.exe /S'

#Start sleep
Start-Sleep -Seconds 10
