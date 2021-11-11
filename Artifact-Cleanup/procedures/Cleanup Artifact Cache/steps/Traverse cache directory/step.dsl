import java.io.File


step 'Traverse cache directory', {
  command = new File(projectDir, "./procedures/Cleanup Artifact Cache/steps/Traverse cache directory.pl").text
  condition = '$[/javascript myJob.cacheDirectoryIsValid == \'1\' && myJob.days != \'\';]'
  postProcessor = 'postp'
  shell = 'ec-perl'
}
