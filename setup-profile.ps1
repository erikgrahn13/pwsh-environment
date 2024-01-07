# Define the local profile path and cached profile path
$profileDirectory = Split-Path $PROFILE
$cachedProfilePath = Join-Path $profileDirectory "cachedProfile.ps1"

# URL of the remote profile.ps1 on GitHub
$remoteProfileUrl = "https://raw.githubusercontent.com/erikgrahn13/pwsh-environment/main/profile.ps1"

# Ensure the profile directory exists
if (-not (Test-Path $profileDirectory)) {
    New-Item -ItemType Directory -Path $profileDirectory
}

# Function to download the latest profile script
function Update-CachedProfile {
    Invoke-WebRequest -Uri $remoteProfileUrl -OutFile $cachedProfilePath
    Write-Host "Updated cached profile from GitHub."
}

# Download the remote profile script
Update-CachedProfile

# Add code to execute the cached profile script in the local profile
$profileScriptContent = @"
# Execute the cached profile script
. '$cachedProfilePath'
"@

Set-Content -Path $PROFILE -Value $profileScriptContent -Force

Write-Host "PowerShell profile has been set up."

# copy the starship config
# Define the URL of the raw file from the GitHub repository
# $fileUrl = "https://raw.githubusercontent.com/erikgrahn13/shell-environment/main/starship.toml"

# # Define the destination directory and file name within the user's home directory
# $destDir = Join-Path $HOME ".config"  # e.g., $HOME\MyFiles
# $destFile = Join-Path $destDir "starship.toml"  # e.g., $HOME\MyFiles\filename

# # Check if the directory exists
# if (-not (Test-Path $destDir)) {
#     # The directory doesn't exist, so create it
#     New-Item -ItemType Directory -Path $destDir
# }

# Invoke-WebRequest -Uri $fileUrl -OutFile $destFile
