
procedure 'Cleanup Repository', {
  description = 'Clear out all stale artifacts from a repository\'s backing store.'
  jobNameTemplate = 'cleanup-repository-$[jobId]'
  resourceName = '$[resource]'

  formalParameter 'debug', defaultValue: '0', {
    description = 'If set to true, all Commander requests and responses will be displayed in the step log files.'
    checkedValue = '1'
    type = 'checkbox'
    uncheckedValue = '0'
  }

  formalParameter 'dryRun', defaultValue: '0', {
    description = 'If set, no real operations will be made.'
    checkedValue = '1'
    type = 'checkbox'
    uncheckedValue = '0'
  }

  formalParameter 'resource', defaultValue: 'local', {
    description = 'The resource on which to run this job. This resource must be running on the same machine as a repository server. The job will detect the repository\'s backing store location based on the assumption that the resource is installed along with the repository.'
    required = '1'
    type = 'entry'
  }
}
