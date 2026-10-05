<#
.SYNOPSIS
    Sets the active PS5 avatar for the Aetheris Playnite theme.

.PARAMETER Index
    Avatar index from 0 to 36:
    0: Classic Silhouette (PlayStation Classic)
    1: Kratos (God of War Ragnarok)
    2: Peter Parker (Marvel's Spider-Man)
    3: Miles Morales (Spider-Man: Miles Morales)
    4: Cloud Strife (Final Fantasy VII Rebirth)
    5: Tifa Lockhart (Final Fantasy VII Rebirth)
    6: Aerith Gainsborough (Final Fantasy VII Rebirth)
    7: Zack Fair (Crisis Core: FFVII)
    8: Yuna (Final Fantasy X)
    9: Tidus (Final Fantasy X)
    10: Solid Snake (Metal Gear Solid)
    11: Big Boss (Metal Gear Solid V)
    12: Revolver Ocelot (Metal Gear Solid)
    13: Kazuma Kiryu (Yakuza / Like a Dragon)
    14: Goro Majima (Yakuza / Like a Dragon)
    15: Ichiban Kasuga (Yakuza: Like a Dragon)
    16: Joker (Persona 5 Royal)
    17: Geralt of Rivia (The Witcher 3: Wild Hunt)
    18: Ciri (The Witcher 3: Wild Hunt)
    19: Batman (Batman: Arkham Knight)
    20: Commander Shepard (Mass Effect Legendary)
    21: Ryu Hayabusa (Ninja Gaiden)
    22: Son Goku (Dragon Ball Z)
    23: Majin Vegeta (Dragon Ball Z)
    24: Future Trunks (Dragon Ball Z)
    25: Naruto Uzumaki (Naruto Shippuden)
    26: Sasuke Uchiha (Naruto Shippuden)
    27: Kakashi Hatake (Naruto Shippuden)
    28: Itachi Uchiha (Naruto Shippuden)
    29: Monkey D. Luffy (One Piece)
    30: Roronoa Zoro (One Piece)
    31: Ichigo Kurosaki (Bleach)
    32: Kenpachi Zaraki (Bleach)
    33: Link (The Legend of Zelda)
    34: Princess Zelda (The Legend of Zelda)
    35: Mario (Super Mario)
    36: Aetheris Modern (PlayStation 5 Theme)
#>
param(
    [ValidateRange(0, 36)]
    [int]$Index = 1
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
