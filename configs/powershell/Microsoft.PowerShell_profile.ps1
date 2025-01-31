# Changes The Title
function Change-Window-Title {
    $WindowTitle = "/usr/bin/bash --login -i"
    $activeWindow = Get-Process | Where-Object { $_.MainWindowTitle -eq $WindowTitle }
    # Check if the window is active
    if ($activeWindow) {
        cmd.exe /c title "GitBash"
    } else {
        echo ""
    }
}

# All the function to load
Change-Window-Title

# Integrate Powershell
Import-Module PSFzf
Set-PSReadLineKeyHandler -Key 'Ctrl+r' -ScriptBlock { Invoke-FuzzyHistory }

# Setup 'oh-my-posh' promt
Clear-Host | oh-my-posh init pwsh --config ~/AppData/Roaming/oh-my-posh/tonybaloney.omp.json | Invoke-Expression
