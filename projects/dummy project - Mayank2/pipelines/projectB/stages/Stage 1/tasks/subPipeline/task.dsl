
task 'subPipeline', {
  advancedMode = '0'
  allowOutOfOrderRun = '0'
  alwaysRun = '0'
  enabled = '1'
  errorHandling = 'stopOnError'
  insertRollingDeployManualStep = '0'
  projectName = 'dummy project - Mayank2'
  skippable = '0'
  subErrorHandling = 'continueOnError'
  subpipeline = 'projectA'
  subproject = 'Default'
  taskType = 'PIPELINE'
  triggerType = 'async'
  useApproverAcl = '0'
  waitForPlannedStartDate = '0'
}
