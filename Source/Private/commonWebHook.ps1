function _parseTrigger {
   [CmdletBinding()]
   param(
      [parameter(Mandatory = $true, Position = 0)]
      [string] $Trigger
   )

   $results = @{
      publisherId = ''
      eventId     = ''
   }

   switch ($Trigger) {
      'Build completed' {
         $results.publisherId = 'tfs'
         $results.eventId = 'build.complete'
      }
      'Code pushed' {
         $results.publisherId = 'tfs'
         $results.eventId = 'git.push'
      }
      'Pull request created' {
         $results.publisherId = 'tfs'
         $results.eventId = 'git.pullrequest.created'
      }
      'Pull request merge attempted' {
         $results.publisherId = 'tfs'
         $results.eventId = 'git.pullrequest.merged'
      }
      'Pull request updated' {
         $results.publisherId = 'tfs'
         $results.eventId = 'git.pullrequest.updated'
      }
      'Release abandoned' {
         $results.publisherId = 'rm'
         $results.eventId = 'ms.vss-release.release-abandoned-event'
      }
      'Release created' {
         $results.publisherId = 'rm'
         $results.eventId = 'ms.vss-release.release-created-event'
      }
      'Release deployment approval completed' {
         $results.publisherId = 'rm'
         $results.eventId = 'ms.vss-release.deployment-approval-completed-event'
      }
      'Release deployment approval pending' {
         $results.publisherId = 'rm'
         $results.eventId = 'ms.vss-release.deployment-approval-pending-event'
      }
      'Release deployment completed' {
         $results.publisherId = 'rm'
         $results.eventId = 'ms.vss-release.deployment-completed-event'
      }
      'Release deployment started' {
         $results.publisherId = 'rm'
         $results.eventId = 'ms.vss-release.deployment-started-event'
      }
      'Work item commented on' {
         $results.publisherId = 'tfs'
         $results.eventId = 'workitem.commented'
      }
      'Work item created' {
         $results.publisherId = 'tfs'
         $results.eventId = 'workitem.created'
      }
      'Work item deleted' {
         $results.publisherId = 'tfs'
         $results.eventId = 'workitem.deleted'
      }
      'Work item restored' {
         $results.publisherId = 'tfs'
         $results.eventId = 'workitem.restored'
      }
      'Work item updated' {
         $results.publisherId = 'tfs'
         $results.eventId = 'workitem.updated'
      }
   }

   Write-Output $results
}