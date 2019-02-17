function Get-VSTeamWebHook {
   [CmdletBinding(DefaultParameterSetName = 'ByID')]
   param(
      [Parameter(ParameterSetName = 'ByID', ValueFromPipeline = $true, Position = 0)]
      [Alias('WebHookId')]
      [guid[]] $Id
   )

   Process {

      # Call the REST API
      if ($id) {
         foreach ($item in $id) {
            # Build the url to return the single build
            $resp = _callAPI -Area 'hooks' -Resource 'subscriptions' -id $item `
               -Version $([VSTeamVersions]::Hooks)
            
            _applyTypesToWebHook -item $resp

            Write-Output $resp
         }
      }
      else {
         # Build the url to list the builds
         $resp = _callAPI -Area 'hooks' -Resource 'subscriptions' `
            -Version $([VSTeamVersions]::Hooks) `
            -Querystring @{
               'consumerId' = 'webHooks'
            }
         
         # Apply a Type Name so we can use custom format view and custom type extensions
         foreach ($item in $resp.value) {
            _applyTypesToWebHook -item $item
         }

         Write-Output $resp.value
      }
   }
}