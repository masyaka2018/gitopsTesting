
procedure 'Create Resource', {
  description = 'Create a GCP instance with the given name from the given image name, and a corresponding Flow resource with the same name.'
  jobNameTemplate = 'gcp-create-resource-$[/timestamp]'
  resourceName = 'veng'
  workspaceName = 'chronic3build'

  formalParameter 'deleteAfter', {
    description = 'If specified, gives the absolute path of a fnishable thing (eg, \'/jobs/commander-main-full.12345\' or \'/jobSteps/a87sdf1-43adfg\') after which this resource should be deleted.'
    type = 'entry'
  }

  formalParameter 'diskSizeGB', defaultValue: '100', {
    description = 'Size of the instance disk in GB.'
    type = 'entry'
  }

  formalParameter 'image', {
    description = 'Name of the image from which to create the instance.'
    required = '1'
    type = 'entry'
  }

  formalParameter 'instance', {
    description = 'Name of the instance.  Lowercase letters, numbers, and hyphens only.	'
    required = '1'
    type = 'entry'
  }

  formalParameter 'pool', {
    description = 'If non-empty, the name of a pool to which the resource should be added.	'
    type = 'entry'
  }

  formalParameter 'preemptible', {
    description = '''Create instace as preemptilble. It might save a cost
Just put \'true\' value to this parameter to enable this feature'''
    type = 'entry'
  }

  formalParameter 'stepLimit', defaultValue: '0', {
    type = 'entry'
  }

  formalParameter 'type', defaultValue: 'e2-standard-2', {
    description = 'Type of machine to deploy	'
    options = [
      'n1-standard-2': 'n1-standard-2',
      'e2-standard-2': 'e2-standard-2',
      'n1-standard-4': 'n1-standard-4',
      'n1-standard-8': 'n1-standard-8',
      'n1-standard-16': 'n1-standard-16',
      'n1-standard-32': 'n1-standard-32',
      'n1-standard-64': 'n1-standard-64',
      'e2-standard-16': 'e2-standard-16',
      'e2-standard-8': 'e2-standard-8',
      'e2-standard-4': 'e2-standard-4',
    ]
    type = 'select'
  }

  formalParameter 'zone', defaultValue: 'us-west2-a', {
    description = 'Name of the zone in which to create the instance.	'
    type = 'entry'
  }
}
