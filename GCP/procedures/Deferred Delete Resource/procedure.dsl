
procedure 'Deferred Delete Resource', {
  jobNameTemplate = '''$[/javascript 

var jobName = \'cleanup-gcp-\';
jobName += myJob.instance;

// The jobName is our result

jobName;
]
'''

  formalParameter 'instance', {
    required = '1'
    type = 'entry'
  }

  formalParameter 'waitFor', {
    required = '1'
    type = 'entry'
  }
}
