function Add-VSTeamGroupEntitlement {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true)]
      [Alias('UserEmail')]
      [string]$Email,
       
      [ValidateSet('Advanced', 'EarlyAdopter', 'Express', 'None', 'Professional', 'StakeHolder')]
      [string]$License = 'EarlyAdopter',
       
      [ValidateSet('Custom', 'ProjectAdministrator', 'ProjectContributor', 'ProjectReader', 'ProjectStakeholder')]
      [string]$Group = 'ProjectContributor',
       
      [ValidateSet('account', 'auto', 'msdn', 'none', 'profile', 'trial')]
      [string]$LicensingSource = "account",
       
      [ValidateSet('eligible', 'enterprise', 'none', 'platforms', 'premium', 'professional', 'testProfessional', 'ultimate')]
      [string]$MSDNLicenseType = "none"
   )

   DynamicParam {
      _buildProjectNameDynamicParam -Mandatory $false
   }

   process {
      # Thi swill throw if this account does not support MemberEntitlementManagement
      _supportsMemberEntitlementManagement

      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]

      {
         "extensionRules": [
           {
             "id": "ms.feed"
           }
         ],
         "group": {
           "origin": "aad",
           "originId": "01d0472d-9949-421e-81d8-fcb5668a394d",
           "subjectKind": "group"
         },
         "id": null,
         "licenseRule": {
           "licensingSource": "account,",
           "accountLicenseType": "express",
           "licenseDisplayName": "Basic"
         },
         "projectEntitlements": [
           {
             "group": {
               "groupType": "projectContributor"
             },
             "projectRef": {
               "id": "8130f18e-f65b-431d-a777-5d4a6f3468ba"
             }
           }
         ]
       }

      $obj = @{
         extensionRules         = @(
            @{
               id = "ms.feed"
            }
         )
         group                = @{
            origin = 'aad'
            originId = '01d0472d-9949-421e-81d8-fcb5668a394d'
            subjectKind   = 'group'
         }
         licenseRule = @{
            licensingSource = $LicensingSource
            accountLicenseType = $License
            #licenseDisplayName = 'Basic'
         }
         projectEntitlements = @{
            group      = @{
               groupType = $Group
            }
            projectRef = @{
               id = $ProjectName
            }
         }
      }

      $body = $obj | ConvertTo-Json

      # Call the REST API
      _callAPI  -Method Post -Body $body -SubDomain 'vsaex' -Resource 'userentitlements' -Version $([VSTeamVersions]::MemberEntitlementManagement) -ContentType "application/json"
   }
}
