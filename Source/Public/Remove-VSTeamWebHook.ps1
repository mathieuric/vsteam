function Remove-VSTeamWebHook {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('WebHookID')]
      [Guid[]] $Id,

      [switch] $Force
   )

   Process {
      foreach ($item in $id) {
         if ($Force -or $pscmdlet.ShouldProcess($item, "Delete WebHook")) {
            try {
               _callAPI -Area 'hooks' -Resource 'subscriptions' -id $item `
                  -Method Delete  -Version $([VSTeamVersions]::Hooks) | Out-Null

               Write-Output "Deleted WebHook $item"
            }
            catch {
               _handleException $_
            }
         }
      }
   }
}