
emailNotifier 'test', {
  condition = '''$[/javascript if(getProperty("outcome") == \'success\')
	true;
else
	false;]'''
  configName = 'a'
  destinations = 'a'
  eventType = 'onStart'
  formattingTemplate = '''Subject: Job  \'$[jobName]\'  from procedure  \'$[procedureName]\'  $[/myEvent/type]  - CloudBees CD notification

$[/server/ec_notifierTemplates/Html_JobTempl/body]'''
}
