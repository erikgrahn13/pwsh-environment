# Path to the cached profile script
$cachedProfilePath = Join-Path (Split-Path $PROFILE) "cachedProfile.ps1"

# URL of the remote profile.ps1 on GitHub
$remoteProfileUrl = "https://raw.githubusercontent.com/erikgrahn13/pwsh-environment/main/profile.ps1"

# Function to download the latest profile script
function Update-CachedProfile {
    Invoke-WebRequest -Uri $remoteProfileUrl -OutFile $cachedProfilePath
    Write-Host "Updated cached profile from GitHub."
}

# Check if the cached profile exists
if (Test-Path $cachedProfilePath) {
    # Compare the last modified time of the cached file with the current time
    $cachedProfileLastWriteTime = (Get-Item $cachedProfilePath).LastWriteTime
    $currentTime = Get-Date
    $timeDifference = $currentTime - $cachedProfileLastWriteTime

    # Update the cached profile if it's older than a day (or your preferred interval)
    if ($timeDifference.TotalDays -gt 1) {
        Update-CachedProfile
    }
} else {
    # If the cached profile doesn't exist, download it
    Update-CachedProfile
}

# Execute the cached profile script
. $cachedProfilePath