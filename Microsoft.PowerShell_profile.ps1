Set-Location C:\workspace

Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

Import-Module posh-git

# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE
    
    Write-Host($env:username) -nonewline -foregroundcolor Magenta
    Write-Host (" ") -nonewline -foregroundcolor Green
    Write-Host($pwd.ProviderPath) -nonewline -foregroundcolor White

    Write-VcsStatus
    
    $global:LASTEXITCODE = $realLASTEXITCODE
    
    Write-Host ("") -foregroundcolor Green
    Write-Host ("λ") -nonewline -foregroundcolor Red
    return " "
}

Pop-Location

Start-SshAgent -Quiet
