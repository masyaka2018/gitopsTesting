import java.io.File


step 'Create resources', {
  command = new File(projectDir, "./procedures/Create Resource Pool/steps/Create resources.pl").text
  logFileName = 'create-pool-$[pool].log'
  resourceName = 'veng'
  shell = 'ec-perl'
}
