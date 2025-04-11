function Connect-VMDeploy {
	[CmdletBinding()]
	param (
		[string]
		$ComputerName,

		[switch]
		$EnableException
	)
	process {
		if ($ComputerName) {
			$effectiveComputerName = $ComputerName
			Set-PSFConfig -FullName 'VMDeploy.Control.Server' -Value $ComputerName
			Register-PSFConfig -FullName 'VMDeploy.Control.Server'
		}
		else { $effectiveComputerName = Get-PSFConfigValue -FullName 'VMDeploy.Control.Server' }

		if (-not $effectiveComputerName) {
			Stop-PSFFunction -Message "No VMDeployment Endpoint found! Specify the '-ComputerName' parameter for the first connection" -Cmdlet $PSCmdlet -EnableException $EnableException
			return
		}

		if ($script:currentSession) { Disconnect-VMDeploy }

		$session = New-PSSession -ComputerName $effectiveComputerName -ConfigurationName JEA_VMDeployment -ErrorAction Stop
		Import-PSSession $session -Module VMDeploy.* | Import-Module -Global
		$script:currentSession = $session
	}
}