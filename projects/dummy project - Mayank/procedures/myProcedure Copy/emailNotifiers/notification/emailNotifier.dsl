
emailNotifier 'notification', {
  condition = ''
  configName = 'a'
  destinations = 'mdifalco admin'
  eventType = 'onCompletion'
  formattingTemplate = '''Subject: CloudBees CD notification

Message body goes here.'''
}
