import java.io.File


step 'Time-based deletion', {
  command = new File(projectDir, "./procedures/Cleanup Artifact Cache/steps/Time-based deletion.pl").text
  condition = '$[/javascript myJob.cacheDirectoryIsValid == \'1\' && myJob.candidatesForDeletion == \'1\' && myJob.days != \'\';]'
  postProcessor = 'postp'
  shell = 'ec-perl'
}
