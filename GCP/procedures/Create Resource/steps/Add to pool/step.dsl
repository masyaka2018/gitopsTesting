import java.io.File


step 'Add to pool', {
  command = new File(projectDir, "./procedures/Create Resource/steps/Add to pool.cmd").text
  condition = '''$[/javascript \'$[pool]\' != \'\']
'''
  logFileName = 'logs-gcp/add-to-pool-$[instance].log'
}
