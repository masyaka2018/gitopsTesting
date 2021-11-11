import java.io.File


step 'Delete Resource', {
  description = 'Delete the named CloudBees CD resource'
  alwaysRun = '1'
  command = new File(projectDir, "./procedures/Delete Resource/steps/Delete Resource.cmd").text
  logFileName = 'logs-gcp/delete-resource-$[instance].log'
}
