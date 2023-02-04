# 代理设置
$Env:http_proxy="http://127.0.0.1:7890";
$Env:https_proxy="http://127.0.0.1:7890";
function proxy { $Env:http_proxy="http://127.0.0.1:7890"; $Env:https_proxy="http://127.0.0.1:7890"; }
function noproxy { $Env:http_proxy=""; $Env:https_proxy=""; }

# 系统更新
function Update-Packages {
	# update pip
	Write-Host "Step 1: 更新 pip" -ForegroundColor Magenta -BackgroundColor Cyan
	python -m pip install --upgrade pip
	$a = pip list --outdated
	$num_package = $a.Length - 2
	for ($i = 0; $i -lt $num_package; $i++) {
		$tmp = ($a[2 + $i].Split(" "))[0]
		pip install -U $tmp
	}

	# update TeX Live
	$CurrentYear = Get-Date -Format yyyy
	Write-Host "Step 2: 更新 TeX Live" $CurrentYear -ForegroundColor Magenta -BackgroundColor Cyan
	tlmgr update --self
	tlmgr update --all

    # update system
	# update scoop
    Write-Host "Step 3: 更新 scoop" -ForegroundColor Magenta -BackgroundColor Cyan
	scoop update
	scoop update *

    Write-Host "Step 4: 更新 winget" -ForegroundColor Magenta -BackgroundColor Cyan
	winget upgrade
}

Set-Alias -Name update-all -Value Update-Packages

# 打开工作目录
function OpenCurrentFolder {
	param
	(
		# 输入要打开的路径
		# 用法示例：open C:\
		# 默认路径：当前工作文件夹
		$Path = '.'
	)
	Invoke-Item $Path
}
Set-Alias -Name open -Value OpenCurrentFolder

Import-Module Terminal-Icons

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\amro.omp.json" | Invoke-Expression

Import-Module posh-git
