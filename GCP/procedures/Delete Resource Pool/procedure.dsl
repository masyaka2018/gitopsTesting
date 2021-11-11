
procedure 'Delete Resource Pool', {
  description = 'Delete all the resources in a given pool, along with the associated GCP instances.'

  formalParameter 'pool', {
    description = 'Name of the pool to create.  This will also serve as the basename for the instances.'
    required = '1'
    type = 'entry'
  }
}
