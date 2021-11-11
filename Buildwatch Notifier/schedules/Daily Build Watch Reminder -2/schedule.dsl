
schedule 'Daily Build Watch Reminder -2', {
  interval = '0'
  intervalUnits = 'seconds'
  procedureName = '/projects/Buildwatch Notifier/procedures/Daily Reminder'
  startTime = '15:00'
  timeZone = 'America/Los_Angeles'
  weekDays = 'Monday Tuesday Wednesday Thursday Friday '
}
