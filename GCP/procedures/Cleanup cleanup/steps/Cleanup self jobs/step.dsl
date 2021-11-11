import java.io.File


step 'Cleanup self jobs', {
  command = new File(projectDir, "./procedures/Cleanup cleanup/steps/Cleanup self jobs.cmd").text
  logFileName = 'cleanup-self-jobs.log'
  resourceName = 'veng'
}
