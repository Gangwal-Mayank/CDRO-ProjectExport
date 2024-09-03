import java.io.File


step 'Webhook', {
  alwaysRun = '0'
  broadcast = '0'
  command = new File(projectDir, "./procedures/Github_Webhook/steps/Webhook.groovy").text
  errorHandling = 'failProcedure'
  exclusiveMode = 'none'
  parallel = '0'
  procedureName = 'Github_Webhook'
  projectName = 'dummy project - Mayank'
  releaseMode = 'none'
  shell = 'ec-groovy'
  timeLimitUnits = 'minutes'
}
