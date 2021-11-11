import java.io.File


step 'Schedule cleanup', {
  command = new File(projectDir, "./procedures/Create Resource Pool/steps/Schedule cleanup.pl").text
  condition = '$[/javascript \'$[deleteAfter]\' != \'\']'
  logFileName = 'logs-gcp/schedule-cleanup-$[pool].log'
  resourceName = 'veng'
  shell = 'ec-perl'
}
