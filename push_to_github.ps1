param(
    [string]$remoteUrl,
    [string]$branch = 'main'
)

if (-not $remoteUrl) {
    Write-Host "Usage: .\push_to_github.ps1 <remote-url> [branch]"
    exit 1
}

if (-not (Test-Path ".git")) {
    git init
    Write-Host "Initialized new git repository"
}

$current = git remote get-url origin 2>$null
if ($current) {
    git remote remove origin
}
git remote add origin $remoteUrl

git add .
try {
    git commit -m "Initial commit" -a
} catch {
    Write-Host "No changes to commit or git commit failed (already committed)."
}

git branch -M $branch
git push -u origin $branch
