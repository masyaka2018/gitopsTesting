import java.io.File


step 'Clear invalid artifact versions', {
  command = new File(projectDir, "./procedures/Cleanup Artifact Cache/steps/Clear invalid artifact versions.pl").text
  postProcessor = 'postp'
  shell = 'ec-perl'
}
