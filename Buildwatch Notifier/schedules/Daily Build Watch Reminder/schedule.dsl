
schedule 'Daily Build Watch Reminder', {
  interval = '0'
  intervalUnits = 'seconds'
  procedureName = '/projects/Buildwatch Notifier/procedures/Daily Reminder'
  startTime = '6:00'
  timeZone = 'America/Los_Angeles'
  weekDays = 'Monday Tuesday Wednesday Thursday Friday '
}
