import java.io.File


step 'Webhook', {
  description = ''
  alwaysRun = '0'
  broadcast = '0'
  command = new File(projectDir, "./procedures/Bitbucket_Cloud_Webhook/steps/Webhook.groovy").text
  condition = ''
  errorHandling = 'failProcedure'
  exclusiveMode = 'none'
  parallel = '0'
  precondition = ''
  procedureName = 'Bitbucket_Cloud_Webhook'
  projectName = 'dummy project - Mayank2'
  releaseMode = 'none'
  shell = 'ec-groovy'
  timeLimit = '0'
  timeLimitUnits = 'minutes'
  workspaceName = ''
}
