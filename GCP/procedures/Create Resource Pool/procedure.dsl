
procedure 'Create Resource Pool', {
  description = 'Create several identical resources in a pool, with a common base name.'

  formalParameter 'count', {
    description = 'Number of instances to create.'
    required = '1'
    type = 'entry'
  }

  formalParameter 'deleteAfter', {
    description = 'If given, the absolute path of a finishable thing (ie, \'/jobSteps/a789af1-89dae1c\') after which the pool should be deleted automatically.'
    type = 'entry'
  }

  formalParameter 'image', {
    description = 'Name of the GCP image to use for the instances.'
    required = '1'
    type = 'entry'
  }

  formalParameter 'pool', {
    description = 'Name of the pool to create.  This will also serve as the basename for the instances.'
    required = '1'
    type = 'entry'
  }

  formalParameter 'preemptible', {
    type = 'entry'
  }

  formalParameter 'type', defaultValue: 'n1-standard-2', {
    description = 'GCP instance type to create.'
    options = [
      'n1-standard-2': 'n1-standard-2',
      'n1-standard-4': 'n1-standard-4',
      'n1-standard-8': 'n2-standard-8',
      'n2-standard-16': 'n2-standard-16',
      'n2-standard-32': 'n2-standard-32',
      'e2-standard-2': 'e2-standard-2',
      'e2-standard-4': 'e2-standard-4',
      'e2-standard-8': 'e2-standard-8',
    ]
    required = '1'
    type = 'select'
  }
}
