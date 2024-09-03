
pluginConfiguration 'GithubConn', {
  description = 'Github connection'
  field = [
    'authType': 'token',
    'debugLevel': '0',
    'ignoreSSLErrors': 'false',
    'library': 'jgit',
    'repositoryURL': 'https://github.com/Gangwal-Mayank/CDRO-ProjectExport',
    'token_credential': 'token_credential',
  ]
  pluginKey = 'EC-Git'
  projectName = 'dummy project - Mayank'

  addCredential 'token_credential', {
    passwordRecoveryAllowed = '1'
    projectName = 'dummy project - Mayank'
  }
}
