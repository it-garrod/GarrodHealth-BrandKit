@echo off
REM Run the PowerShell script with ExecutionPolicy bypass
powershell.exe -ExecutionPolicy Bypass -File "%~dp0change_wallpaper.ps1"

REM Keep the window open so users can see output/errors
pause
