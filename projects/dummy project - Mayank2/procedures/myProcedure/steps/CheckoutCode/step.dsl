
step 'CheckoutCode', {
  actualParameter = [
    'branch': 'main',
    'config': 'GitHub',
    'mirror': 'false',
    'overwrite': 'false',
    'repoUrl': 'git@github.com:mdifal2/Demo.git',
    'resultPropertySheet': '/myJob/clone',
    'shallowSubmodules': 'false',
    'submodules': 'false',
  ]
  alwaysRun = '0'
  broadcast = '0'
  errorHandling = 'failProcedure'
  exclusiveMode = 'none'
  parallel = '0'
  precondition = '''$[/javascript something + something return true
  var something else;
]'''
  procedureName = 'myProcedure'
  projectName = 'dummy project - Mayank2'
  releaseMode = 'none'
  subprocedure = 'Clone'
  subproject = '/plugins/EC-Git/project'
  timeLimit = '0'
  timeLimitUnits = 'hours'
}
