import java.io.File


task 'command', {
  advancedMode = '0'
  allowOutOfOrderRun = '0'
  alwaysRun = '0'
  command = new File(projectDir, "./pipelines/projectB/stages/Stage 1/tasks/command.cmd").text
  enabled = '1'
  errorHandling = 'stopOnError'
  insertRollingDeployManualStep = '0'
  projectName = 'dummy project - Mayank2'
  skippable = '0'
  taskType = 'COMMAND'
  useApproverAcl = '0'
  waitForPlannedStartDate = '0'
}
