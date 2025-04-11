Register-PSFTeppScriptblock -Name 'VMDeploy.Control.VMMServer' -ScriptBlock {
	Get-VMManScvmm | ForEach-Object {
		if ($_.Description) {
			@{ Text = $_.Name; Tooltip = '{0} | {1}' -f $_.Server, $_.Description }
		}
		else {
			@{ Text = $_.Name; Tooltip = $_.Server }
		}
	}
} -Global
Register-PSFTeppArgumentCompleter -Command 'Get-VmoCloud' -Parameter VmmServer -Name 'VMDeploy.Control.VMMServer'
Register-PSFTeppArgumentCompleter -Command 'Get-VmoDynamicGuestOSProfile' -Parameter VmmServer -Name 'VMDeploy.Control.VMMServer'
Register-PSFTeppArgumentCompleter -Command 'Get-VmoDynamicHardwareProfile' -Parameter VmmServer -Name 'VMDeploy.Control.VMMServer'
Register-PSFTeppArgumentCompleter -Command 'Get-VmoGuestOSProfile' -Parameter VmmServer -Name 'VMDeploy.Control.VMMServer'
Register-PSFTeppArgumentCompleter -Command 'Get-VmoHardwareProfile' -Parameter VmmServer -Name 'VMDeploy.Control.VMMServer'
Register-PSFTeppArgumentCompleter -Command 'Get-VmoVirtualHardDisk' -Parameter VmmServer -Name 'VMDeploy.Control.VMMServer'
Register-PSFTeppArgumentCompleter -Command 'Get-VmoVMHost' -Parameter VmmServer -Name 'VMDeploy.Control.VMMServer'
Register-PSFTeppArgumentCompleter -Command 'Get-VmoVMHostGroup' -Parameter VmmServer -Name 'VMDeploy.Control.VMMServer'
Register-PSFTeppArgumentCompleter -Command 'New-VmoVirtualMachine' -Parameter VmmServer -Name 'VMDeploy.Control.VMMServer'