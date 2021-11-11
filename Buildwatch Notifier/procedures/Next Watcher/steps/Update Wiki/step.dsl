import java.io.File


step 'Update Wiki', {
  description = '''Update the "LoggingBuildFailures" page by inserting the new Build Watch schedule.
'''
  command = new File(projectDir, "./procedures/Next Watcher/steps/Update Wiki.pl").text
  condition = '0'
  resourceName = 'veng'
  shell = 'ec-perl'

  attachCredential {
    credentialName = '/projects/Buildwatch Notifier/credentials/wiki'
  }
}
