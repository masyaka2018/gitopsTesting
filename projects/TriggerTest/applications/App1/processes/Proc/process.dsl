import java.io.File


process 'Proc', {
  applicationName = 'App1'
  exclusiveEnvironment = '0'
  processType = 'OTHER'
  projectName = 'TriggerTest'

  formalParameter 'ec_enforceDependencies', defaultValue: '0', {
    expansionDeferred = '1'
    type = 'checkbox'
  }

  processStep 'Step 1', {
    actualParameter = [
      'commandToRun': new File(projectDir, "./applications/App1/processes/Proc/processSteps/Step 1.cmd").text,
    ]
    applicationTierName = 'Tier 1'
    dependencyJoinType = 'and'
    processStepType = 'command'
    projectName = 'TriggerTest'
    subprocedure = 'RunCommand'
    subproject = '/plugins/EC-Core/project'

    // Custom properties

    property 'ec_deploy', {

      // Custom properties
      ec_notifierStatus = '0'
    }
  }
}
