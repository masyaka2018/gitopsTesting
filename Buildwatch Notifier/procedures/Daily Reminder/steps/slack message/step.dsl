import java.io.File


step 'slack message', {
  command = new File(projectDir, "./procedures/Daily Reminder/steps/slack message.cmd").text
  resourceName = 'sealteam6'
  shell = 'bash'
}
