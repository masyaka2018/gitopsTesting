import java.io.File


step 'Cleanup cleanup jobs', {
  command = new File(projectDir, "./procedures/Cleanup cleanup/steps/Cleanup cleanup jobs.pl").text
  logFileName = 'cleanup-cleanup-jobs.log'
  resourceName = 'veng'
  shell = 'ec-perl'
}
