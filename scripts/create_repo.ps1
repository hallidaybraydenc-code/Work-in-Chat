param(
    [string]$Name = $(Split-Path -Leaf (Get-Location)),
    [switch]$Private
)

function Ensure-GitInitialized {
    if (-not (Test-Path -Path .git)) {
        git init | Out-Null
    }
}

function Ensure-InitialCommit {
    $hasHead = $false
    try { git rev-parse --verify HEAD > $null 2>&1; $hasHead = $true } catch { $hasHead = $false }
    if (-not $hasHead) {
        git add -A
        git commit -m "Initial commit" --author="Auto <auto@local>" | Out-Null
    }
}

Ensure-GitInitialized
Ensure-InitialCommit

$repoName = $Name
$privateFlag = $Private.IsPresent

if (Get-Command gh -ErrorAction SilentlyContinue) {
    $visibility = if ($privateFlag) { '--private' } else { '--public' }
    gh repo create $repoName $visibility --source=. --remote=origin --push --confirm
    if ($LASTEXITCODE -eq 0) {
        Write-Output "Repository created and pushed using gh."
        exit 0
    }
}

if (-not $env:GITHUB_TOKEN) {
    Write-Error "gh CLI not found and GITHUB_TOKEN is not set. Install gh or set GITHUB_TOKEN environment variable."; exit 1
}

$headers = @{ Authorization = "token $($env:GITHUB_TOKEN)"; 'User-Agent' = 'create_repo_script' }
$body = @{ name = $repoName; private = $privateFlag } | ConvertTo-Json

$user = Invoke-RestMethod -Uri https://api.github.com/user -Headers $headers -Method Get
$login = $user.login

$resp = Invoke-RestMethod -Uri https://api.github.com/user/repos -Headers $headers -Method Post -Body $body -ContentType 'application/json'

$url = $resp.clone_url
git remote add origin $url
git branch -M main
git push -u origin main

Write-Output "Repository created at: $($resp.html_url)"
