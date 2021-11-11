import java.io.File


step 'Schedule cleanup', {
  command = new File(projectDir, "./procedures/Create Resource/steps/Schedule cleanup.pl").text
  condition = '$[/javascript \'$[deleteAfter]\' != \'\']'
  logFileName = 'logs-gcp/schedule-cleanup-$[instance].log'
  shell = 'ec-perl'
}
