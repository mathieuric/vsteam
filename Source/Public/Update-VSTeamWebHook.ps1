function Update-VSTeamWebHook {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
   param(
      [switch] $Force
   )

   DynamicParam {
      _buildProjectNameDynamicParam
   }

   Process {

      if ($Force -or $pscmdlet.ShouldProcess($item, "Update Web Hook")) {
      }
   }
}