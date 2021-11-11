import java.io.File


step 'Verify NFS', {
  description = 'On Linux systems, make sure the chronic3build NFS mount is available.'
  command = new File(projectDir, "./procedures/Create Resource/steps/Verify NFS.cmd").text
  logFileName = 'verify-nfs-$[instance].log'
  resourceName = '$[instance]'
  shell = 'sh'
  workspaceName = 'localtmp'
}
