
trigger 'trigger2', {
  applicationName = 'App1'
  environmentName = 'Env1'
  pluginKey = 'EC-Git'
  pluginParameter = [
    'branch': 'test',
    'config': 'testConfig',
    'repoUrl': 'test',
  ]
  processName = 'Proc'
  projectName = 'TriggerTest'
  quietTimeMinutes = '0'
  runDuplicates = '1'
  triggerType = 'polling'
}
