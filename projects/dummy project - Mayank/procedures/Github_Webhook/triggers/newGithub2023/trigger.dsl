
trigger 'newGithub2023', {
  description = ''
  enabled = '1'
  pluginKey = 'EC-Github'
  pluginParameter = [
    'commitStatusEvent': 'false',
    'includeBranches': '',
    'includeCommitStatuses': 'success',
    'includePrActions': 'opened, edited, closed_merged',
    'prEvent': 'true',
    'pushEvent': 'false',
    'repositories': 'mdifal2/Demo',
  ]
  procedureName = 'Github_Webhook'
  projectName = 'dummy project - Mayank'
  quietTimeMinutes = '0'
  runDuplicates = '1'
  serviceAccountName = 'GithubSA'
  triggerType = 'webhook'
  webhookName = 'default'
}
