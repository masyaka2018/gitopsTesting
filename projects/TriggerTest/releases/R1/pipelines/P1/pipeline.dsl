
pipeline 'P1', {
  projectName = 'TriggerTest'
  releaseName = 'R1'
  templatePipelineName = 'P1'
  templatePipelineProjectName = 'TriggerTest'

  formalParameter 'ec_stagesToRun', {
    expansionDeferred = '1'
  }
}
