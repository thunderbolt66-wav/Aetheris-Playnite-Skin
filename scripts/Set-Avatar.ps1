<#
.SYNOPSIS
    Sets the active PS5 avatar for the Aetheris Playnite theme.

.PARAMETER Index
    Avatar index from 0 to 8:
    0: PlayStation Classic Shapes
    1: Astro Bot (Team ASOBI)
    2: Kratos (God of War Ragnarok)
    3: Spider-Man (Marvel's Spider-Man 2)
    4: Jin Sakai (Ghost of Tsushima)
    5: Aloy (Horizon Forbidden West)
    6: Ellie (The Last of Us Part II)
    7: Ratchet & Clank (Rift Apart)
    8: Fluted Knight (Demon's Souls)
#>
param(
    [ValidateRange(0, 8)]
    [int]$Index = 0
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$rootDir = Split-Path -Parent $scriptDir
$avatarSrc = Join-Path $rootDir "source\Images\Avatars\Avatar$Index.png"

if (-not (Test-Path $avatarSrc)) {
    Write-Error "Avatar file not found at: $avatarSrc"
    exit 1
}

$themeMediaDest = Join-Path $rootDir "source\Media\ProfilePicture.png"
Copy-Item -Path $avatarSrc -Destination $themeMediaDest -Force
Write-Host "[Aetheris] Copied Avatar $Index to local source: $themeMediaDest" -ForegroundColor Cyan

$installedThemeDir = Join-Path $env:APPDATA "Playnite\Themes\Fullscreen\Aetheris_93ede1bc-cf3c-47a0-9323-29f697d598f2\Media\ProfilePicture.png"
if (Test-Path (Split-Path -Parent $installedThemeDir)) {
    Copy-Item -Path $avatarSrc -Destination $installedThemeDir -Force
    Write-Host "[Aetheris] Applied Avatar $Index to installed Playnite theme: $installedThemeDir" -ForegroundColor Green
}

Write-Host "[Aetheris] PS5 Avatar $Index successfully activated!" -ForegroundColor Yellow
