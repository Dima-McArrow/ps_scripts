Write-Host "`n"

$GDEISKAT = $(gum file)

$SLOVO = $(gum input --header="Что найти?" --header.foreground="196"  --placeholder="search...")

Get-Content $GDEISKAT | grep --color $SLOVO

