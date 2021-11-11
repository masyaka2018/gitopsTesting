import java.io.File


step 'Test', {
  command = new File(projectDir, "./procedures/Next Watcher/steps/Test.cmd").text
  condition = '0'
  shell = 'sh -e'
}
