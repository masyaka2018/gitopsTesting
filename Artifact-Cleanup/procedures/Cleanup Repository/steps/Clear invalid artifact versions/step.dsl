import java.io.File


step 'Clear invalid artifact versions', {
  description = 'Check the environment variable COMMANDER_DATA_DIRECTORY, then check for a repository server.properties relative to this directory. Error out if the properties file can\'t be found, otherwise parse it for the backing store location. Once we have the backing store, call cleanupRepository on that directory.'
  command = new File(projectDir, "./procedures/Cleanup Repository/steps/Clear invalid artifact versions.pl").text
  postProcessor = 'postp'
  shell = 'ec-perl'
}
