param(
    [string]$Message = "Auto update $(Get-Date -Format o)"
)

if (-not (Test-Path -Path .git)) {
    Write-Error "This folder is not a git repository. Run create_repo.ps1 first or initialize git."; exit 1
}

$status = git status --porcelain
if (-not $status) {
    Write-Output "No changes to commit."; exit 0
}

git add -A
git commit -m $Message

try {
    git push origin HEAD
} catch {
    Write-Warning "Push failed. Ensure remote 'origin' exists and you have network access."
}
