
trigger 'newGH2024', {
  description = ''
  enabled = '1'
  pluginKey = 'EC-Github'
  pluginParameter = [
    'commitStatusEvent': 'false',
    'excludeBranches': '',
    'includeBranches': 'main',
    'includeCommitStatuses': 'success',
    'includePrActions': 'closed_merged, opened, edited, reopened',
    'prEvent': 'true',
    'pushEvent': 'false',
    'repositories': 'mdifal2/Demo',
  ]
  procedureName = 'Github_Webhook'
  projectName = 'dummy project - Mayank2'
  quietTimeMinutes = '0'
  runDuplicates = '1'
  serviceAccountName = 'GithubSA'
  triggerType = 'webhook'
  webhookName = 'default'
}
