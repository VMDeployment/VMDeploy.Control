Register-PSFTeppScriptblock -Name 'VMDeploy.Control.Template' -ScriptBlock {
	Get-VmoTemplate | % {
		@{ Text = $_.Name; ToolTip = $_.Description }
	}
} -Global

Register-PSFTeppArgumentCompleter -Command 'New-VmoVirtualMachine' -Parameter Template -Name 'VMDeploy.Control.Template'