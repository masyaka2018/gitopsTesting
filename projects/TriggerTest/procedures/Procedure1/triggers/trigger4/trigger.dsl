
trigger 'trigger4', {
  pluginKey = 'EC-Git'
  pluginParameter = [
    'branch': 'test',
    'config': 'testConfig',
    'repoUrl': 'test',
  ]
  procedureName = 'Procedure1'
  projectName = 'TriggerTest'
  quietTimeMinutes = '0'
  runDuplicates = '1'
  triggerType = 'polling'
}
