# Add type for SystemParametersInfo to refresh desktop
Add-Type @"
using System.Runtime.InteropServices;

public class Wallpaper
{
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool SystemParametersInfo(
        int uAction,
        int uParam,
        string lpvParam,
        int fuWinIni
    );
}
"@

# Always points to the folder containing this script
$scriptDir = $PSScriptRoot
$wallpaper = Join-Path $scriptDir "Wallpapers\Garrod Health Wallpaper 2026.png"

# Check if the wallpaper file exists
if (Test-Path $wallpaper) {
    # Update registry to set wallpaper
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name wallpaper -Value $wallpaper

    # Refresh desktop to apply changes
    $result = [Wallpaper]::SystemParametersInfo(20, 0, $wallpaper, 3)

    if ($result) {
        Write-Host "Wallpaper changed successfully!"
    } else {
        Write-Host "Failed to refresh desktop wallpaper."
    }
} else {
    Write-Host "Wallpaper file not found at: $wallpaper"
}
