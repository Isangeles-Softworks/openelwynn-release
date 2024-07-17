param(
    [Parameter()]
    [String]$login,
    [String]$pass
)
# Pull from the game repository.
git clone https://github.com/isangeles-softworks/openelwynn
# Build the game.
cd openelwynn
make build
# Create build artifact.
# Build name contains version from VERSION file, date string, and os + arch info.
$buildName = "openelwynn_$(type VERSION)_$(Get-Date -Format "yyyyMMdd")_windows_x86_64.zip"
Compress-Archive -Path ./* -CompressionLevel Fastest -DestinationPath ./$($buildName)
# Cleanup.
cd ..
Remove-Item -Force -Recurse -Path "openelwynn"
# Upload to the release server.
$creds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($login):$($pass)"))
$headers = @{
    Authorization = "Basic $creds";
}
$body = "file=$(get-content ./$buildName -raw)"
Invoke-WebRequest -Uri "https://my.opendesktop.org/remote.php/dav/files/isangeles/openelwynn/release/$buildName" -Method PUT -InFile ./$buildName -ContentType "application/octet-stream" -Headers $headers
