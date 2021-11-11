import java.io.File


step 'Delete resources', {
  command = new File(projectDir, "./procedures/Delete Resource Pool/steps/Delete resources.pl").text
  logFileName = 'create-pool-$[pool].log'
  resourceName = 'veng'
  shell = 'ec-perl'
}
