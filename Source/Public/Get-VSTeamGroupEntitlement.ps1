function Get-VSTeamGroupEntitlement {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param (
      [Parameter(ParameterSetName = 'List')]
      [int] $Top = 100,

      [Parameter(ParameterSetName = 'List')]
      [int] $Skip = 0,

      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('Projects', 'Extensions', 'Grouprules')]
      [string[]] $Select,

      [Parameter(ParameterSetName = 'ByID')]
      [Alias('UserId')]
      [string[]] $Id
   )

   begin {
      $callApiParams = @{
         SubDomain = 'vsaex'
         Version = $([VSTeamVersions]::MemberEntitlementManagement)
         Resource = 'groupentitlements'
      }

      $output = @()
   }

   process {
      if ($PSCmdlet.ParameterSetName -eq 'ByID') {
         foreach ($item in $Id) {
            $callApiParams['Id'] = $item

            $output += _callApi @callApiParams
         }
      }
      else {
         $resp = _callAPI @callApiParams

         $output += $resp.value | Where-Object {$_}
      }

      # Apply a Type Name so we can use custom format view and custom type extensions
      foreach ($item in $output) {
         $item.PSObject.TypeNames.Insert(0, 'Team.GroupEntitlement')

         $item
      }
   }
}