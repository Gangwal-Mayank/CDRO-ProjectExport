
emailNotifier 'notification', {
  condition = ''
  configName = 'default'
  destinations = 'mdifalco admin'
  eventType = 'onCompletion'
  formattingTemplate = '''Subject: CloudBees CD notification

Message body goes here.'''
}
