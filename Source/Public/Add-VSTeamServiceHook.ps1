function Add-VSTeamServiceHook {
   [CmdletBinding(DefaultParameterSetName = 'BuildCompleted')]
   param(
      [parameter(Mandatory = $true, Position = 1)]
      [ValidateSet('Build completed', 'Code pushed', 'Pull request created', 'Pull request merge attempted', 'Pull request updated', 'Release abandoned', 'Release created', 'Release deployment approval completed', 'Release deployment approval pending', 'Release deployment completed', 'Release deployment started', 'Work item commented on', 'Work item created', 'Work item deleted', 'Work item restored', 'Work item updated')]
      [string] $Trigger,

      [parameter(ParameterSetName = 'BuildCompleted', Mandatory = $false, Position = 2)]
      [string] $BuildPipeline = '[Any]',

      [parameter(ParameterSetName = 'BuildCompleted', Mandatory = $false, Position = 3)]
      [string] $BuildStatus = '[Any]',

      [parameter(ParameterSetName = 'Code', Mandatory = $false, Position = 2)]
      [parameter(ParameterSetName = 'PullRequest', Mandatory = $false, Position = 2)]
      [parameter(ParameterSetName = 'PullRequestMerge', Mandatory = $false, Position = 2)]
      [parameter(ParameterSetName = 'PullRequestUpdated', Mandatory = $false, Position = 2)]
      [string] $Repository = '[Any]',

      [parameter(ParameterSetName = 'Code', Mandatory = $false, Position = 3)]
      [parameter(ParameterSetName = 'PullRequest', Mandatory = $false, Position = 3)]
      [parameter(ParameterSetName = 'PullRequestMerge', Mandatory = $false, Position = 3)]
      [parameter(ParameterSetName = 'PullRequestUpdated', Mandatory = $false, Position = 3)]
      [Alias('TargetBranch')]
      [string] $Branch = '[Any]',

      [parameter(ParameterSetName = 'Code', Mandatory = $false, Position = 4)]
      [parameter(ParameterSetName = 'PullRequest', Mandatory = $false, Position = 4)]
      [parameter(ParameterSetName = 'PullRequestMerge', Mandatory = $false, Position = 4)]
      [parameter(ParameterSetName = 'PullRequestUpdated', Mandatory = $false, Position = 4)]
      [string] $Group = '[Any]',

      [parameter(ParameterSetName = 'PullRequest', Mandatory = $false, Position = 5)]
      [parameter(ParameterSetName = 'PullRequestMerge', Mandatory = $false, Position = 5)]
      [parameter(ParameterSetName = 'PullRequestUpdated', Mandatory = $false, Position = 5)]
      [string] $ReviewerGroup = '[Any]',

      [parameter(ParameterSetName = 'PullRequestMerge', Mandatory = $false, Position = 6)]
      [ValidateSet('[Any]', 'Merge Successful', 'Merge Unsuccessful - Reason: Any', 'Merge Unsuccessful - Reason: Conflicts', 'Merge Unsuccessful - Reason: Failure', 'Merge Unsuccessful - Reason: Rejected By Policy')]
      [string] $MergeResult = '[Any]',

      [parameter(ParameterSetName = 'PullRequestUpdated', Mandatory = $false, Position = 6)]
      [ValidateSet('[Any]', 'Source branch updated', 'Reviewers changed', 'Status changed', 'Votes score changed')]
      [string] $PullRequestChange = '[Any]',

      [parameter(ParameterSetName = 'ReleaseAbandonedOrCreated', Mandatory = $false, Position = 2)]
      [parameter(ParameterSetName = 'ReleaseDeploymentApprovalCompleted', Mandatory = $false, Position = 2)]
      [parameter(ParameterSetName = 'ReleaseDeploymentApprovalPending', Mandatory = $false, Position = 2)]
      [parameter(ParameterSetName = 'ReleaseDeploymentCompleted', Mandatory = $false, Position = 2)]
      [parameter(ParameterSetName = 'ReleaseDeploymentStarted', Mandatory = $false, Position = 2)]
      [string] $ReleasePipeline = '[Any]',

      [parameter(ParameterSetName = 'ReleaseDeploymentApprovalCompleted', Mandatory = $false, Position = 3)]
      [parameter(ParameterSetName = 'ReleaseDeploymentApprovalPending', Mandatory = $false, Position = 3)]
      [parameter(ParameterSetName = 'ReleaseDeploymentCompleted', Mandatory = $false, Position = 3)]
      [parameter(ParameterSetName = 'ReleaseDeploymentStarted', Mandatory = $false, Position = 3)]
      [string] $ReleaseStage = '[Any]',

      [parameter(ParameterSetName = 'ReleaseDeploymentApprovalCompleted', Mandatory = $false, Position = 4)]
      [parameter(ParameterSetName = 'ReleaseDeploymentApprovalPending', Mandatory = $false, Position = 4)]
      [ValidateSet('[Any]', 'Pre-deployment', 'Post-deployment')]
      [string] $ApprovalType = '[Any]',

      [parameter(ParameterSetName = 'ReleaseDeploymentApprovalCompleted', Mandatory = $false, Position = 5)]
      [ValidateSet('[Any]', 'Approved', 'Rejected')]
      [string] $ApprovalStatus = '[Any]',

      [parameter(ParameterSetName = 'ReleaseDeploymentCompleted', Mandatory = $false, Position = 4)]
      [ValidateSet('[Any]', 'Canceled', 'Partially Succeeded', 'Failed', 'Succeeded')]
      [string] $ReleaseStatus = '[Any]',

      [parameter(ParameterSetName = 'WorkItemCommentedOn', Mandatory = $false, Position = 2)]
      [parameter(ParameterSetName = 'WorkItemRestored', Mandatory = $false, Position = 2)]
      [parameter(ParameterSetName = 'WorkItemDeleted', Mandatory = $false, Position = 2)]
      [parameter(ParameterSetName = 'WorkItemCreated', Mandatory = $false, Position = 2)]
      [string] $AreaPath = '[Any]',

      [parameter(ParameterSetName = 'WorkItemCommentedOn', Mandatory = $false, Position = 3)]
      [parameter(ParameterSetName = 'WorkItemRestored', Mandatory = $false, Position = 3)]
      [parameter(ParameterSetName = 'WorkItemDeleted', Mandatory = $false, Position = 3)]
      [parameter(ParameterSetName = 'WorkItemCreated', Mandatory = $false, Position = 3)]
      [string] $WorkItemType = '[Any]',

      [parameter(ParameterSetName = 'WorkItemCommentedOn', Mandatory = $false, Position = 4)]
      [parameter(ParameterSetName = 'WorkItemRestored', Mandatory = $false, Position = 4)]
      [parameter(ParameterSetName = 'WorkItemDeleted', Mandatory = $false, Position = 4)]
      [parameter(ParameterSetName = 'WorkItemCreated', Mandatory = $false, Position = 4)]
      [parameter(ParameterSetName = 'WorkItemUpdated', Mandatory = $false, Position = 4)]
      [string] $Tag,

      [parameter(ParameterSetName = 'WorkItemCommentedOn', Mandatory = $false, Position = 5)]
      [string] $Contains,

      [parameter(ParameterSetName = 'WorkItemCommentedOn', Mandatory = $false, Position = 6)]
      [string] $Field,

      [parameter(ParameterSetName = 'WorkItemCreated')]
      [parameter(ParameterSetName = 'WorkItemUpdated')]
      [switch] $LinksAddedOrRemoved,

      [parameter(Mandatory = $true)]
      [string] $Url,

      [switch] $AcceptUntrustedSSLCertificates,

      [string] $BasicAuthUsername,

      [securestring] $BasicAuthPassword,

      [string] $HttpHeaders,

      [ValidateSet('All', 'Minimal', 'None')]
      [string] $ResourceDetailsToSend = 'All',

      [ValidateSet('All', 'Text', 'HTML', 'Markdown', 'None')]
      [string] $MessagesToSend = 'All',

      [ValidateSet('All', 'Text', 'HTML', 'Markdown', 'None')]
      [string] $DetailedMessagesToSend = 'All',

      [string] $ResourceVersion = '[Latest]'
   )

   DynamicParam {
      _buildProjectNameDynamicParam
   }

   Process {

      $projectName = $PSBoundParameters["ProjectName"]

      $consumerId = 'webHooks'
      $consumerActionId = 'httpRequest'

      # The user selected a project name but we need the id
      $projectId = Get-VSTeamProject -Name $projectName | Select-Object -ExpandProperty Id

      $results = _parseTrigger -Trigger $Trigger
      $publisherId = $results.publisherId
      $eventId = $results.eventId

      $body = @{
         publisherId      = $publisherId
         eventType        = $eventId
         resourceVersion  = $ResourceVersion
         consumerId       = $consumerId
         consumerActionId = $consumerActionId
         publisherInputs  = @{
            projectId = $projectId
         }
         consumerInputs   = @{
            url = $Url
         }
      };

      $resp = _callAPI -Area 'hooks' -Resource 'subscriptions' `
         -Method Post -ContentType 'application/json' -Body ($body | ConvertTo-Json) `
         -Version $([VSTeamVersions]::Hooks)

      _applyTypesToServiceHook -item $resp

      Write-Output $resp
   }
}