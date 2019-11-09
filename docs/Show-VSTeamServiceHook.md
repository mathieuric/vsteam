


# Show-VSTeamServiceHook

## SYNOPSIS

Opens the service hooks in the default browser.

## SYNTAX

## DESCRIPTION

Opens the service hooks in the default browser.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------

```PowerShell
PS C:\> Show-VSTeamServiceHook -ProjectName Demo
```

This command will open a web browser to the service hooks page where service hooks are listed.

## PARAMETERS

### -ProjectName

Specifies the team project for which this function operates.

You can tab complete from a list of available projects.

You can use Set-VSTeamDefaultProject to set a default project so
you do not have to pass the ProjectName with each call.

```yaml
Type: String
Position: 0
Required: True
Accept pipeline input: true (ByPropertyName)
```

## INPUTS

## OUTPUTS

### Team.ServiceHook

## NOTES

You can pipe the build ID to this function.

## RELATED LINKS

[Add-VSTeamAccount](Add-VSTeamAccount.md)

[Set-VSTeamDefaultProject](Set-VSTeamDefaultProject.md)

[Add-VSTeamServiceHook](Add-VSTeamServiceHook.md)

[Remove-VSTeamServiceHook](Remove-VSTeamServiceHook.md)
