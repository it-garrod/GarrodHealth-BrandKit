# Path to your PNG wallpaper
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$wallpaper = Join-Path $scriptDir "Wallpapers\Garrod Health Wallpaper 2026.png"

# Set registry key for wallpaper
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name wallpaper -Value $wallpaper

# Refresh the desktop to apply changes
Add-Type @"
using System.Runtime.InteropServices;

public class RefreshDesktop
{
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(
        int uAction,
        int uParam,
        string lpvParam,
        int fuWinIni
    );
}
"@

# SPI_SETDESKWALLPAPER = 20, SPIF_UPDATEINIFILE = 0x01, SPIF_SENDCHANGE = 0x02
[RefreshDesktop]::SystemParametersInfo(20, 0, $wallpaper, 3)

Write-Host "Wallpaper changed successfully!"
