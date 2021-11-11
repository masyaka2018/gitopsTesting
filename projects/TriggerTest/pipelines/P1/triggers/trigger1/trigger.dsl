
trigger 'trigger1', {
  pipelineName = 'P1'
  pluginKey = 'EC-Git'
  pluginParameter = [
    'branch': 'test',
    'config': 'testConfig',
    'repoUrl': 'test',
  ]
  projectName = 'TriggerTest'
  quietTimeMinutes = '0'
  runDuplicates = '1'
  triggerType = 'polling'
}
