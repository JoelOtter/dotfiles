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

function Get-GitStatus { & git status }
New-Alias -Name wow -Value Get-GitStatus
function Get-GitDiff { & git diff }
New-Alias -Name gd -Value Get-GitDiff
function Get-GitLog { & git log }
Remove-Item alias:gl -Force
New-Alias -Name gl -Value Get-GitLog
function Get-GitBranches { & git branch }
New-Alias -Name gb -Value Get-GitBranches
function Do-GitPullOriginMaster { & git pull origin master }
New-Alias -Name gpom -Value Do-GitPullOriginMaster