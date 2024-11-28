Write-Host "`nGit add . and Git commit ..." -ForegroundColor Red

Write-Host "`n"

$COMMIT_MESSAGE = $(gum write --header="Commit Message:" --header.foreground="208" --placeholder "Enter the commit message")

Write-Host "`n"

if ([string]::IsNullOrEmpty($COMMIT_MESSAGE)) {
    Write-Host "No commit message provided. Exiting..." -ForegroundColor Red
    exit
}

& git add .

& git commit -m $COMMIT_MESSAGE

# Success message
Write-Host "`nCommit created successfully with message: '$COMMIT_MESSAGE'" -ForegroundColor Green