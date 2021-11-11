import java.io.File


step 'Stop Instance', {
  alwaysRun = '1'
  command = new File(projectDir, "./procedures/Delete Resource/steps/Stop Instance.cmd").text
  logFileName = 'logs-gcp/stop-instance-$[instance].log'
  shell = 'bash'
}
