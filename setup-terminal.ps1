$ErrorActionPreference = "SilentlyContinue"

$TerminalProfilePath = "$ENV:Userprofile\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

Write-Host "Installing Terminal Icons" -ForegroundColor "Cyan"
Remove-Module -Name Terminal-Icons
Install-Module -Name Terminal-Icons -Force

Write-Host "Installing PSReadLine - Requires At Least 2.2" -ForegroundColor "Cyan"
Remove-Module -Name PSReadLine
Install-Module -Name PSReadLine -AllowPrerelease -Force

Write-Host "Installing z - cd replacement" -ForegroundColor "Cyan"
Remove-Module -Name z
Install-Module z -AllowClobber -Force

Write-Host "Installing Oh My Posh using Winget" -ForegroundColor "Cyan"
winget install JanDeDobbeleer.OhMyPosh

Write-Host "Installing GitHub Cli" -ForegroundColor "Cyan"
winget install GitHub.cli --source winget

Write-Host "Installing Powershell Core" -ForegroundColor "Cyan"
winget install --id Microsoft.Powershell --source winget

Write-Host "Installing Fonts" -ForegroundColor "Cyan"
Copy-Item  -Path .\fonts\*.ttf -Destination c:\windows\fonts\ -Force

Write-Host "Ensuring Powershell Profile file and Path exists" -ForegroundColor "Cyan"
New-Item -Path $PROFILE -Type File -Force

Write-Host "Copying Terminal Settings json" -ForegroundColor "Cyan"
Copy-Item -Path .\terminal-settings.json -Destination $TerminalProfilePath -Force

Write-Host "Copying Powershell Profile file" -ForegroundColor "Cyan"
Copy-Item -Path .\powershell-profile.ps1 -Destination $PROFILE -Force
Write-Host "All Done - Restart Terminal" -ForegroundColor "Green"