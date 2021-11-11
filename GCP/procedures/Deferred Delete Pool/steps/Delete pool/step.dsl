
step 'Delete pool', {
  precondition = '''$[/javascript

var done = getProperty(\'$[waitFor]/finish\');
(done != null && done != \'\');
]
'''
  subprocedure = 'Delete Resource Pool'
  actualParameter 'pool', '$[pool]'
}
