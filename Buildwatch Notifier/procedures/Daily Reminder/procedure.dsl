
procedure 'Daily Reminder', {
  description = 'Send a daily reminder notice.'
  jobNameTemplate = 'Buildwatch-DailyReminder-$[jobId]'
  resourceName = 'local'
  timeLimitUnits = 'seconds'
  workspaceName = 'default'
}
