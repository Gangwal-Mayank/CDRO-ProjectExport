
trigger 'myTrigger', {
  description = ''
  enabled = '0'
  pluginKey = 'EC-Bitbucket'
  pluginParameter = [
    'includeBranches': '',
    'includePrActions': 'created, updated, approved, unapproved, fulfilled, rejected, comment_created, comment_updated, comment_deleted, opened',
    'prEvent': 'true',
    'pushEvent': 'false',
    'repositories': 'mdifal2/demo',
  ]
  procedureName = 'Bitbucket_Webhook'
  projectName = 'dummy project - Mayank'
  quietTimeMinutes = '0'
  runDuplicates = '0'
  serviceAccountName = 'bitbucketSA'
  triggerType = 'webhook'
  webhookName = 'default'
}
