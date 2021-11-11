import java.io.File


step 'Create Instance', {
  command = new File(projectDir, "./procedures/Create Resource/steps/Create Instance.cmd").text
  errorHandling = 'abortProcedure'
  logFileName = 'logs-gcp/create-instance-$[instance].log'
  shell = 'bash'
}
