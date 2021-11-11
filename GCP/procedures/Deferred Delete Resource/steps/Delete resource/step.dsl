
step 'Delete resource', {
  precondition = '''$[/javascript

var done = getProperty(\'$[waitFor]/finish\');
(done != null && done != \'\');
]
'''
  subprocedure = 'Delete Resource'
  actualParameter 'instance', '$[instance]'
  actualParameter 'zone', 'us-west2-a'
}
