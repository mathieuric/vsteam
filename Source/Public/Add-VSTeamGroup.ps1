function Add-VSTeamGroup {
   [CmdletBinding()]
   param(
      [string] $DisplayName,

      [string] $Description
   )

   DynamicParam {
      _buildProjectNameDynamicParam -ParameterSetName 'ListByProjectName' -ParameterName 'ProjectName' -Mandatory $false
   }

   process {
      # This will throw if this account does not support the graph API
      _supportsGraph

      # Bind the parameter to a friendly variable
      $projectName = $PSBoundParameters["ProjectName"]

      try {
         $body = @{
            description = $Description
         }

         if ($DisplayName) {
            $body['displayName'] = $DisplayName
         }

         $callApiParams = @{
            Method = 'POST'
            Area = 'graph'
            Resource = 'groups'
            Version = '5.2-preview.1'
            QueryString = @{}
            SubDomain = 'vssps'
            ContentType = 'application/json'
            Body = $body | ConvertTo-Json
            ErrorAction = 'Stop'
         }

         # Add query parameter(s).
         if ($projectName) {
            $project = Get-VSTeamProject -Name $projectName -ErrorAction Stop

            $callApiParams['QueryString'] += @{
               scopeDescriptor = Get-VSTeamDescriptor -StorageKey $project.id | Select-Object -ExpandProperty Descriptor
            }
         }
         
         [VSTeamGroup](_callAPI @callApiParams)
      }
      catch {
         _handleException $_
      }
   }
}