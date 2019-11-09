function Show-VSTeamServiceHook {
   [CmdletBinding()]
   param(
   )

   DynamicParam {
      _buildProjectNameDynamicParam
   }

   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]

      Show-Browser "$([VSTeamVersions]::Account)/$ProjectName/_settings/serviceHooks"
   }
}