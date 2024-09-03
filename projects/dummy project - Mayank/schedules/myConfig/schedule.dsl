
schedule 'myConfig', {
  description = 'Continuous integration configuration; managed by EC-CIManager.'
  actualParameter = [
    'ec_ci_configurationName': 'myConfig',
    'ec_ci_preflight': '0',
    'ec_ci_projectName': 'dummy project',
  ]
  misfirePolicy = 'ignore'
  priority = 'normal'
  procedureName = 'myProcedure'
  projectName = 'dummy project - Mayank'
  scheduleDisabled = '1'
  timeZone = 'Etc/UTC'
}
