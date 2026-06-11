Add-Type @"
using System.Runtime.InteropServices;

public class RefreshDesktop
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

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$wallpaper = Join-Path $scriptDir "Wallpapers\Garrod Health Wallpaper 2026.png"

[Wallpaper]::SystemParametersInfo(20, 0, $wallpaper, 3)

Write-Host "Wallpaper changed successfully!"