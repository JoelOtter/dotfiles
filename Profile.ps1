function Prompt {
	$dateTime = get-date -Format "HH:mm"
	$currentDirectory = $(Get-Location)
	$Host.UI.RawUI.WindowTitle = "Terminal: $(Convert-Path $currentDirectory)"

	Write-Host "$Env:username" -NoNewline -ForegroundColor Red
	Write-Host '@' -NoNewline -ForegroundColor Yellow
	Write-Host "$Env:computername" -NoNewline -ForegroundColor Blue
	Write-Host "[$(Convert-Path $currentDirectory)]" -ForegroundColor White
	Write-Host "[" -ForegroundColor Blue -NoNewline
	If (!$LASTEXITCODE) {
		Write-Host "$dateTime" -ForegroundColor Green -NoNewline
	} Else {
		Write-Host "$dateTime" -ForegroundColor Red -NoNewline
	}
	Write-Host "] ->" -ForegroundColor Blue -NoNewline
	return " "
}

function Get-GitStatus { & git status $args }
New-Alias -Name wow -Value Get-GitStatus
function Get-GitDiff { & git diff $args }
New-Alias -Name gd -Value Get-GitDiff
function Get-GitLog { & git log $args }
Remove-Item alias:gl -Force
New-Alias -Name gl -Value Get-GitLog
function Get-GitBranches { & git branch $args }
New-Alias -Name gb -Value Get-GitBranches
function Do-GitPullOriginMaster { & git pull origin master $args }
New-Alias -Name gpom -Value Do-GitPullOriginMaster

Remove-Item alias:ls -Force
function Ls-GNU { & ls.exe --color=auto $args }
New-Alias -Name ls -Value Ls-GNU
