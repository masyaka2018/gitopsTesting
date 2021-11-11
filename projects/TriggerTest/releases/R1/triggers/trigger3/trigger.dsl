
trigger 'trigger3', {
  pluginKey = 'EC-Git'
  pluginParameter = [
    'branch': 'test',
    'config': 'testConfig',
    'repoUrl': 'test',
  ]
  projectName = 'TriggerTest'
  quietTimeMinutes = '0'
  releaseName = 'R1'
  runDuplicates = '1'
  triggerType = 'polling'
}
