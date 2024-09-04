import java.io.File


step 'checkScmCheckout', {
  alwaysRun = '0'
  broadcast = '0'
  command = new File(projectDir, "./procedures/myProcedure/steps/checkScmCheckout.cmd").text
  errorHandling = 'failProcedure'
  exclusiveMode = 'none'
  parallel = '0'
  procedureName = 'myProcedure'
  projectName = 'dummy project - Mayank2'
  releaseMode = 'none'
  timeLimit = '0'
  timeLimitUnits = 'hours'
}
