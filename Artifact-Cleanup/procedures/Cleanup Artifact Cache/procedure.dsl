
procedure 'Cleanup Artifact Cache', {
  description = 'Clear out all stale artifacts from a given artifact cache.'
  jobNameTemplate = 'cleanup-artifact-cache-$[jobId]'
  resourceName = '$[resource]'

  formalParameter 'days', {
    description = 'If specified, all artifact versions at least this many days old will be deleted from the cache. If left blank, there will be no time-based deletion.'
    type = 'entry'
  }

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
    description = 'The resource on which to run this job. The agent running on this resource must have access to the specified artifact cache directory. Note that if no artifact cache directory is specified, the job will cleanup the default artifact cache used by the resource.'
    required = '1'
    type = 'entry'
  }
}
