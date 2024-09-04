
procedure 'myProcedure Copy', {
  projectName = 'dummy project - Mayank2'
  resourceName = 'local'
  timeLimit = '0'
  timeLimitUnits = 'minutes'

  formalParameter 'ec_ci_configurationName', {
    description = 'Name of the CI Configuration.'
    expansionDeferred = '0'
    required = '0'
    type = 'entry'
  }

  formalParameter 'ec_ci_preflight', defaultValue: '0', {
    description = 'True if getting source code for a preflight build.'
    expansionDeferred = '0'
    required = '0'
    type = 'entry'
  }

  formalParameter 'ec_ci_projectName', {
    description = 'Name of project containing the CI Configuration.'
    expansionDeferred = '0'
    required = '0'
    type = 'entry'
  }
}
