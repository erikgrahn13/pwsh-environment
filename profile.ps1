# oh my posh needs to be installed on your system

# Check if Terminal-Icons module is installed
if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
    # Install Terminal-Icons if it's not installed
    Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force
}

# Import Terminal-Icons module
Import-Module Terminal-Icons

Import-Module posh-git
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/erikgrahn13/pwsh-environment/main/mytheme.omp.json' | Invoke-Expression

Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History
# Set-PSReadLineOption -PredictionViewStyle ListView
