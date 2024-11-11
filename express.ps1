# Display styled message with a box around it
Write-Host "Setting up Node.js and Express project managed by npm" -ForegroundColor Cyan

# Request the project name
$PROJECT_EX_NAME = Read-Host -Prompt "Enter the project name"

# Check if the input is empty and exit if true
if ([string]::IsNullOrEmpty($PROJECT_EX_NAME)) {
    Write-Host "No input provided. Exiting..." -ForegroundColor Red
    exit
}

# Create the project directory and navigate into it
New-Item -Path $PROJECT_EX_NAME -ItemType Directory | Out-Null
Set-Location -Path $PROJECT_EX_NAME

# Create project structure
New-Item -ItemType Directory -Path "public\styles", "public\scripts" | Out-Null
New-Item -ItemType Directory -Path "server\routes", "server\controllers", "server\middleware", "server\config" | Out-Null

# Initialize npm and install dependencies
gum spin --title "Initializing npm and installing packages..." -- npm init -y
npm install bcryptjs body-parser cookie-parser cors dotenv express express-rate-limit express-validator helmet morgan multer path sass mysql2 sequelize jsonwebtoken

# Add run script to package.json
$packageJsonPath = "package.json"
$packageJson = Get-Content -Path $packageJsonPath -Raw | ConvertFrom-Json
$packageJson.scripts | Add-Member -MemberType NoteProperty -Name "start" -Value "node ./server/app.js"
$packageJson | ConvertTo-Json -Depth 10 | Set-Content -Path $packageJsonPath

# Display the updated package.json content
Write-Host "Wrote to package.json:" -ForegroundColor Green

gum format $(Get-Content package.json) --type="code" --language="json"

# Success message
Write-Host "`nSuccess!" -ForegroundColor Green

# Display the installed dependencies
Write-Host "`nInstalled dependencies:" -ForegroundColor Yellow
Write-Host "bcryptjs, body-parser, cookie-parser, cors, dotenv, express, express-rate-limit, express-validator, helmet, morgan, multer, path, sass, mysql2, sequelize, jsonwebtoken" -ForegroundColor Cyan

# Display project structure creation message
Write-Host "`nProject structure:" -ForegroundColor Cyan
Get-ChildItem -Force

# Display the next steps
Write-Host "`nNow enter the following command to run the project in VSCode:" -ForegroundColor Yellow
Write-Host "code ." -ForegroundColor Green

Write-Host "`nEnter the following command to run the project (node):" -ForegroundColor Yellow
Write-Host "npm run start" -ForegroundColor Green