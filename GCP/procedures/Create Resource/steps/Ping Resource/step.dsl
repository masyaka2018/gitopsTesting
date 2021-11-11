import java.io.File


step 'Ping Resource', {
  description = 'Wait for the named resource to respond successfully to a ping, up to the step time limit.'
  command = new File(projectDir, "./procedures/Create Resource/steps/Ping Resource.pl").text
  errorHandling = 'abortProcedure'
  logFileName = 'logs-gcp/ping-resource-$[instance].log'
  shell = 'ec-perl'
  timeLimit = '15'
}
