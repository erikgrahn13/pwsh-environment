# oh my posh needs to be installed on your system
if ((Get-Command oh-my-posh -ErrorAction SilentlyContinue)) {
    oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/erikgrahn13/pwsh-environment/main/mytheme.omp.json' | Invoke-Expression
} else {
    Write-Host "Oh My Posh is not installed."
}

# Check if Terminal-Icons module is installed
if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
    # Install Terminal-Icons if it's not installed
    Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force
}
Import-Module Terminal-Icons

# Check if posh-git is installed
# if (-not (Get-Module -ListAvailable -Name posh-git)) {
#     # Install posh-git
#     Write-Host "Installing posh-git..."
#     Install-Module posh-git -Scope CurrentUser -Force
#     Write-Host "posh-git installed."
# }

# Import-Module posh-git

Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History
# Set-PSReadLineOption -PredictionViewStyle ListView
