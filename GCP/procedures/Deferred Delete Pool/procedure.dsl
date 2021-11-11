
procedure 'Deferred Delete Pool', {
  jobNameTemplate = '''$[/javascript 

var jobName = \'cleanup-gcp-pool-\';
jobName += myJob.pool;

// The jobName is our result

jobName;
]
'''

  formalParameter 'pool', {
    required = '1'
    type = 'entry'
  }

  formalParameter 'waitFor', {
    required = '1'
    type = 'entry'
  }
}
