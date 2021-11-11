import java.io.File


step 'Create Resource', {
  description = 'Create a resource from the instance that was just created.'
  command = new File(projectDir, "./procedures/Create Resource/steps/Create Resource.cmd").text
  errorHandling = 'abortProcedure'
  logFileName = 'logs-gcp/create-resource-$[instance].log'
}
