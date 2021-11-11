import java.io.File


step 'Create log directory', {
  command = new File(projectDir, "./procedures/Delete Resource/steps/Create log directory.cmd").text
  logFileName = 'create-logs-gcp.log'
}
