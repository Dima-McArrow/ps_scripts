Write-Host "Initializing a Git repo" -ForegroundColor Red

# Initialize a Git repository
& git init

# Create a .gitignore file

touch .gitignore

# Add the node_modules directory to the .gitignore file
Write-Output "node_modules" >> .gitignore

& git add .

& git commit -m "Initial commit"

Write-Host "`nGit repo initialized successfully!" -ForegroundColor Green
