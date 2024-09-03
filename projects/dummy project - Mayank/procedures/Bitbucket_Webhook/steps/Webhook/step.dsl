import java.io.File


step 'Webhook', {
  alwaysRun = '0'
  broadcast = '0'
  command = new File(projectDir, "./procedures/Bitbucket_Webhook/steps/Webhook.groovy").text
  errorHandling = 'failProcedure'
  exclusiveMode = 'none'
  parallel = '0'
  procedureName = 'Bitbucket_Webhook'
  projectName = 'dummy project - Mayank'
  releaseMode = 'none'
  shell = 'ec-groovy'
  timeLimitUnits = 'minutes'
}
