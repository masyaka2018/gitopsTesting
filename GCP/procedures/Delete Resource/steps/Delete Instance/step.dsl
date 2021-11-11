import java.io.File


step 'Delete Instance', {
  alwaysRun = '1'
  command = new File(projectDir, "./procedures/Delete Resource/steps/Delete Instance.cmd").text
  logFileName = 'logs-gcp/delete-instance-$[instance].log'
  shell = 'bash'
}
