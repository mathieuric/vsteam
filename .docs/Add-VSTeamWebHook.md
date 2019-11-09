<!-- #include "./common/header.md" -->

# Add-VSTeamWebHook

## SYNOPSIS

<!-- #include "./synopsis/Add-VSTeamWebHook.md" -->

## SYNTAX

## DESCRIPTION

<!-- #include "./synopsis/Add-VSTeamWebHook.md" -->

You can learn more from the following links:

[Azure DevOps Services service hooks events](https://docs.microsoft.com/en-us/azure/devops/service-hooks/events?view=azure-devops)

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------

```PowerShell
PS C:\> Add-VSTeamWebHook -Trigger 'Build completed' -Url http://someurl.com
```

This command adds a web hook that is triggered on each completed build and posts via HTTP to http://someurl.com

## PARAMETERS

### -Trigger

The type of event this web hook is triggered on. The acceptable values for this parameter are:

- Build completed
- Code pushed
- Pull request created
- Pull request merge attempted
- Pull request updated
- Release abandoned
- Release created
- Release deployment approval completed
- Release deployment approval pending
- Release deployment completed
- Release deployment started
- Work item commented on
- Work item created
- Work item deleted
- Work item restored
- Work item updated

```yaml
Type: string
Required: True
```

### -AreaPath

```yaml
Type: string
Default value: [Any]
Parameter Sets: WorkItemCommentedOn, WorkItemRestored, WorkItemDeleted, WorkItemCreated
Required: False
```

### -WorkItemType

```yaml
Type: string
Default value: [Any]
Parameter Sets: WorkItemCommentedOn, WorkItemRestored, WorkItemDeleted, WorkItemCreated
Required: False
```

### -Tag

```yaml
Type: string
Parameter Sets: WorkItemCommentedOn, WorkItemRestored, WorkItemDeleted, WorkItemCreated, WorkItemUpdated
Required: False
```

### -Contains

```yaml
Type: string
Parameter Sets: WorkItemCommentedOn
Required: False
```

### -Field

```yaml
Type: string
Default value: [Any]
Parameter Sets: WorkItemUpdated
Required: False
```

### -LinksAddedOrRemoved

```yaml
Type: switch
Parameter Sets: WorkItemUpdated, WorkItemCreated
Required: False
```

### -BuildPipeline

```yaml
Type: string
Default value: [Any]
Parameter Sets: BuildCompleted
Required: False
```

### -BuildStatus

```yaml
Type: string
Default value: [Any]
Parameter Sets: BuildCompleted
Required: False
```

### -Repository

```yaml
Type: string
Parameter Sets: Code, PullRequest, PullRequestMerge, PullRequestUpdated
Required: False
```

### -Branch

```yaml
Type: string
Aliases: TargetBranch
Parameter Sets: Code, PullRequest, PullRequestMerge, PullRequestUpdated
Required: False
```

### -Group

Only trigger if the event is triggered by a member of this group.

```yaml
Type: string
Parameter Sets: Code, PullRequest, PullRequestMerge, PullRequestUpdated
Required: False
```

### -ReviewerGroup

Only trigger if the event is triggered by a reviewer that is a member of this group.

```yaml
Type: string
Parameter Sets: PullRequest, PullRequestMerge, PullRequestUpdated
Required: False
```

### -MergeResult

- [Any]
- Merge Successful
- Merge Unsuccessful - Reason: Any
- Merge Unsuccessful - Reason: Conflicts
- Merge Unsuccessful - Reason: Failure
- Merge Unsuccessful - Reason: Rejected By Policy

```yaml
Type: string
Default value: [Any]
Parameter Sets: PullRequestMerge
Required: False
```

### -PullRequestChange

- [Any]
- Source branch updated
- Reviewers changed
- Status changed
- Votes score changed

```yaml
Type: string
Default value: [Any]
Parameter Sets: PullRequestUpdated
Required: False
```

### -ReleasePipeline

```yaml
Type: string
Default value: [Any]
Parameter Sets: ReleaseAbandonedOrCreated,ReleaseDeploymentApprovalCompleted, ReleaseDeploymentApprovalPending, ReleaseDeploymentCompleted, ReleaseDeploymentStarted
Required: False
```

### -ReleaseStage

```yaml
Type: string
Default value: [Any]
Parameter Sets: ReleaseDeploymentApprovalCompleted, ReleaseDeploymentApprovalPending, ReleaseDeploymentCompleted, ReleaseDeploymentStarted
Required: False
```

### -ApprovalType

- [Any]
- Pre-deployment
- Post-deployment

```yaml
Type: string
Default value: [Any]
Parameter Sets: ReleaseDeploymentApprovalCompleted, ReleaseDeploymentApprovalPending
Required: False
```

### -ApprovalStatus

- [Any]
- Approved
- Rejected

```yaml
Type: string
Default value: [Any]
Parameter Sets: ReleaseDeploymentApprovalCompleted
Required: False
```

### -ReleaseStatus

- [Any]
- Canceled
- Partially Succeeded
- Failed
- Succeeded

```yaml
Type: string
Default value: [Any]
Parameter Sets: ReleaseDeploymentCompleted
Required: False
```

### -Url

The URL to which an HTTP POST will be sent.

```yaml
Type: string
Required: True
```

### -AcceptUntrustedSSLCertificates

Do not require a trusted SSL certificate for this endpoint. Note: this option should only be used during development and testing.

```yaml
Type: switch
Required: False
```

### -BasicAuthUsername

Enter a username for standard HTTP authentication.  Basic HTTP authentication sends credentials in plain text (un-encrypted) which means you should use a URL beginning with "https" to enable encryption of these credentials via secure transport layer (SSL).

```yaml
Type: string
Required: false
```

### -BasicAuthPassword

Enter a password for standard HTTP authentication.  Basic HTTP authentication sends credentials in plain text (un-encrypted) which means you should use a URL beginning with "https" to enable encryption of these credentials via secure transport layer (SSL).

```yaml
Type: string
Required: false
```

### -HttpHeaders

HTTP header keys and values separated by a colon(e.g. "Key1:value1") with each key-value-pair appearing on its own line of text.

```yaml
Type: string
Required: false
```

### -ResourceDetailsToSend

Control the resource fields to send.

```yaml
Type: string
Required: false
```

### -MessagesToSend

Control the messages to send

```yaml
Type: string
Required: false
```

### -ResourceVersion

```yaml
Type: string
Required: true
```

### -DetailedMessagesToSend

Control the detailed messages to send

```yaml
Type: string
Required: false
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS