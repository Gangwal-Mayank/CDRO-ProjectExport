
step 'step3', {
  actualParameter = [
    'mavenCommand': 'clean install',
    'workingdirectory': '/MAVENDIRECTORY',
  ]
  alwaysRun = '0'
  broadcast = '0'
  errorHandling = 'failProcedure'
  exclusiveMode = 'none'
  parallel = '0'
  procedureName = 'myProcedure'
  projectName = 'dummy project - Mayank2'
  releaseMode = 'none'
  subprocedure = 'runMaven'
  subproject = '/plugins/EC-Maven/project'
  timeLimit = '0'
  timeLimitUnits = 'hours'
}
