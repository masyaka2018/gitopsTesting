
procedure 'Next Watcher', {
  description = '''<html>
Determine who is next for build watch, send that person a notification, then put their name at the bottom of the list.  To add someone, add their first name to the buildwatch-list and their email address to the emails property sheet.
<p>
See the current schedule at <a href="http://wiki/display/ec/LoggingBuildFailures">LoggingBuildFailures</a>
</html>'''
  jobNameTemplate = 'Buildwatch-NextWatcher-$[jobId]'
  resourceName = 'local'
  timeLimitUnits = 'seconds'
  workspaceName = 'default'

  formalParameter 'update_wiki_only', defaultValue: 'false', {
    description = 'Just update the wiki page using the current property values.'
    checkedValue = 'true'
    type = 'checkbox'
    uncheckedValue = 'false'
  }
}
