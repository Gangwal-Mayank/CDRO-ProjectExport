import com.electriccloud.client.groovy.ElectricFlow
import com.electriccloud.client.groovy.models.*
import groovy.json.JsonSlurper
  
ElectricFlow ef = new ElectricFlow()

String webhookRaw='$[/myJob/webhookData]'
String webhookHeader='$[/myJob/webhookHeaders]'

String parsedBranch='$[/myJob/parsedWebhookData/branch]'
String parsedAuth='$[/myJob/parsedWebhookData/commitAuthorName]'
String parsedCommitId='$[/myJob/parsedWebhookData/commitId]'
String parsedRepo='$[/myJob/parsedWebhookData/repository]'

String parsedState='$[/myJob/parsedWebhookData/webhookData/state]'
String parsedPRNum='$[/myJob/parsedWebhookData/webhookData/number]'
String parsedTitle='$[/myJob/parsedWebhookData/webhookData/title]'
String parsedUrl='$[/myJob/parsedWebhookData/webhookData/url]'
String parsedClosedTime

String tempString, escapedRaw
def dataSlurper, dataResult, headerSlurper, headerResult, payload

if (parsedTitle.indexOf("\"") > -1){

    tempString=parsedTitle.replace("\"","\\\"")
    escapedRaw=webhookRaw.replace("${parsedTitle}","${tempString}")
    slurper = new groovy.json.JsonSlurper()
    dataResult = slurper.parseText(escapedRaw)
    parsedTitle=tempString
} else{
    slurper = new groovy.json.JsonSlurper()
    dataResult = slurper.parseText(webhookRaw)
}

String parsedCreatedTime=dataResult.pullrequest.created_on

headerSlurper = new groovy.json.JsonSlurper()
headerResult = slurper.parseText(webhookHeader)
String [] parsedActionType=headerResult.'x-event-key'.split(':')

if (dataResult.pullrequest.state != 'OPEN') {
    parsedClosedTime=dataResult.pullrequest.updated_on
  
  payload = """
{
  "actionType": "${parsedActionType[1]}",
  "author": "${parsedAuth}",
  "branch": "${parsedBranch}",
  "commitId": "${parsedCommitId}",
  "createdTime": "${parsedCreatedTime}",
  "closedTime": "${parsedClosedTime}",
  "prNum": ${parsedPRNum},
  "repoName": "${parsedRepo}",
  "state": "${parsedState}",
  "title": "${parsedTitle}",
  "url": "${parsedUrl}"
}
"""
} else {
payload = """
{
  "actionType": "${parsedActionType[1]}",
  "author": "${parsedAuth}",
  "branch": "${parsedBranch}",
  "commitId": "${parsedCommitId}",
  "createdTime": "${parsedCreatedTime}",
  "prNum": ${parsedPRNum},
  "repoName": "${parsedRepo}",
  "state": "${parsedState}",
  "title": "${parsedTitle}",
  "url": "${parsedUrl}"
}
"""
  }

println payload    
 
//def results = ef.sendReportingData(
 // payload: payload, reportObjectTypeName: 'bitbucket_pr_report'
//)
