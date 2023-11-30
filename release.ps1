param(
    [Parameter()]
    [String]$login,
    [String]$pass
)
# Pull from the game repository.
git clone https://github.com/isangeles-softworks/openelwynn
# Build the game.
cd openelwynn
make buildName
# Create build artifact.
# Build name contains version for VERSION file, date string, and os + arch info from uname.
$buildName = "openelwynn_$(type VERSION)_$(Get-Date -Format "yyyyMMdd")_windows_amd64.zip"
Compress-Archive -Path ./* -CompressionLevel Fastest -DestinationPath ../$($buildName)
# Upload to the release server.
curl -u $login":"$pass -T "../$buildName" https://my.opendesktop.org/remote.php/dav/files/isangeles/openelwynn/release/