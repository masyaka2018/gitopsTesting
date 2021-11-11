
step 'Email Notification', {
  description = 'Send the daily reminder'
  subprocedure = 'Send Email'
  subproject = '/plugins/EC-SendEmail/project'
}
