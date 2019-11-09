Set-StrictMode -Version Latest

InModuleScope VSTeam {
   [VSTeamVersions]::Account = 'https://dev.azure.com/test'

   Describe 'Service Hooks' {
      # Mock the call to Get-Projects by the dynamic parameter for ProjectName
      Mock Invoke-RestMethod { return @() } -ParameterFilter {
         $Uri -like "*_apis/projects*"
      }

      . "$PSScriptRoot\mocks\mockProjectNameDynamicParamNoPSet.ps1"

      Context 'Show-VSTeamServiceHooks' {
         Mock Show-Browser { }

         It 'Should open browser' {
            Show-VSTeamServiceHook -projectName project

            Assert-MockCalled Show-Browser -Exactly -Scope It -Times 1 -ParameterFilter { $url -eq 'https://dev.azure.com/test/project/_settings/serviceHooks' }
         }
      }
   }
}