import java.io.File


step 'Make logs-gcp', {
  command = new File(projectDir, "./procedures/Create Resource Pool/steps/Make logs-gcp.cmd").text
  resourceName = 'veng'
}
