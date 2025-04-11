function Disconnect-VMDeploy {
	[CmdletBinding()]
	param ()
	process {
		if (-not $script:currentSession) { return }

		$script:currentSession | Remove-PSSession
		$script:currentSession = $Null
	}
}