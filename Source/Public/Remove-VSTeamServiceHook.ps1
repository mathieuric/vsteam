function Remove-VSTeamServiceHook {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('ServiceHookID')]
      [Guid[]] $Id,

      [switch] $Force
   )

   Process {
      foreach ($item in $id) {
         if ($Force -or $pscmdlet.ShouldProcess($item, "Delete ServiceHook")) {
            try {
               _callAPI -Area 'hooks' -Resource 'subscriptions' -id $item `
                  -Method Delete  -Version $([VSTeamVersions]::Hooks) | Out-Null

               Write-Output "Deleted ServiceHook $item"
            }
            catch {
               _handleException $_
            }
         }
      }
   }
}