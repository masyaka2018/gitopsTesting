import java.io.File


step 'Next Watcher', {
  command = new File(projectDir, "./procedures/Next Watcher/steps/Next Watcher.pl").text
  condition = '$[/javascript myJob.update_wiki_only == \'false\']'
  errorHandling = 'abortProcedureNow'
  shell = 'ec-perl'
}
