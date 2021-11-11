import java.io.File


step 'Create log directory', {
  command = new File(projectDir, "./procedures/Create Resource/steps/Create log directory.cmd").text
  logFileName = 'create-logs-gcp.log'
}
