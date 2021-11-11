
step 'Email Notification', {
  description = '''Send the Build Watch email notification.

old run condition : $[/javascript myProcedure.notify_flag == 1 && myJob.update_wiki_only == \'false\']'''
  condition = '0'
  subprocedure = 'Send Email'
  subproject = '/plugins/EC-SendEmail/project'
}
