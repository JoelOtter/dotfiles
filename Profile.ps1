function Prompt {
	$Host.UI.RawUI.WindowTitle = "Terminal"
	$dateTime = get-date -Format "HH:mm"
	$currentDirectory = $(Get-Location)

	Write-Host "$Env:username" -NoNewline -ForegroundColor Red
	Write-Host '@' -NoNewline -ForegroundColor Yellow
	Write-Host "$Env:computername" -NoNewline -ForegroundColor Blue
	Write-Host "[$(Convert-Path $currentDirectory)]" -ForegroundColor White
	Write-Host "[" -ForegroundColor Blue -NoNewline
	Write-Host "$dateTime" -ForegroundColor Green -NoNewline
	Write-Host "] ->" -ForegroundColor Blue -NoNewline
	return " "
}
