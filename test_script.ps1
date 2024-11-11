$testJsonPath = "test.json"
$testJson = Get-Content -Path $testJsonPath -Raw | ConvertFrom-Json

# Check if 'scripts' property exists; if not, create it as a hashtable
if (-not $testJson.PSObject.Properties["scripts"]) {
  $testJson | Add-Member -MemberType NoteProperty -Name "scripts" -Value @{}
}

$testJson.scripts.run = "node ./server/test.js"

$testJson | ConvertTo-Json -Depth 10 | Set-Content -Path $testJsonPath

Get-Content -Path $testJsonPath | Out-String
