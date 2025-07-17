param (
    [string]$branch,
    [string]$message
)

if (-not $branch -or -not $message) {
    Write-Host "`n[ERROR] USAGE: gitflow <branch-name> \"commit message\"" -ForegroundColor Red
    exit 1
}

Write-Host "`n===== STEP 1: SWITCHING TO BRANCH '$branch' =====" -ForegroundColor Cyan
git checkout $branch
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to switch to branch '$branch'"
    exit 1
}

Write-Host "`n===== STEP 2: ADDING AND COMMITTING CHANGES =====" -ForegroundColor Cyan
git add .
git commit -m "$message"
if ($LASTEXITCODE -ne 0) {
    Write-Error "Commit failed. Please check if there are staged changes."
    exit 1
}

Write-Host "`n===== STEP 3: PUSHING BRANCH '$branch' TO ORIGIN =====" -ForegroundColor Cyan
git push origin $branch
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to push '$branch' to origin"
    exit 1
}

Write-Host "`n===== STEP 4: SWITCHING TO 'develop' =====" -ForegroundColor Cyan
git checkout develop
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to switch to 'develop'"
    exit 1
}

Write-Host "`n===== STEP 5: PULLING LATEST 'develop' FROM ORIGIN =====" -ForegroundColor Cyan
git pull origin develop
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to pull from 'develop'"
    exit 1
}

Write-Host "`n===== STEP 6: MERGING '$branch' INTO 'develop' =====" -ForegroundColor Cyan
git merge $branch --no-edit
if ($LASTEXITCODE -ne 0) {
    Write-Error "Merge failed. Please resolve conflicts manually."
    exit 1
}

Write-Host "`n===== STEP 7: PUSHING 'develop' TO ORIGIN =====" -ForegroundColor Cyan
git push origin develop
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to push 'develop' to origin"
    exit 1
}

Write-Host "`n===== DONE: SWITCHING BACK TO '$branch' =====" -ForegroundColor Cyan
git checkout $branch

Write-Host "`n SUCCESS: All steps completed successfully!" -ForegroundColor Green