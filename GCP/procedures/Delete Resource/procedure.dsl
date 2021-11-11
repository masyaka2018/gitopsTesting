
procedure 'Delete Resource', {
  description = 'Delete a GCP instance with the given name, and a corresponding Flow resource with the same name.'
  jobNameTemplate = '''gcp-delete-resource-$[/timestamp]
'''
  resourceName = 'veng'
  workspaceName = 'chronic3build'

  formalParameter 'instance', {
    description = 'Name of the instance.  Lowercase letters, numbers, and hyphens only.	'
    required = '1'
    type = 'entry'
  }

  formalParameter 'zone', defaultValue: 'us-west2-a', {
    description = 'Name of the zone in which to find the instance.	'
    type = 'entry'
  }
}
