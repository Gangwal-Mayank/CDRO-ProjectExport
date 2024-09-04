import com.electriccloud.client.groovy.ElectricFlow
import com.electriccloud.client.groovy.models.*
import groovy.json.JsonSlurper
  
ElectricFlow ef = new ElectricFlow()

String webhookRaw = '$[/myJob/webhookData]'
String webhookHeader = '$[/myJob/webhookHeaders]'

String parsedFromBranch = '$[/myJob/parsedWebhookData/branch]'
String parsedAuth = '$[/myJob/parsedWebhookData/commitAuthorName]'
String parsedFromCommitId = '$[/myJob/parsedWebhookData/commitId]'
String parsedFromRepo = '$[/myJob/parsedWebhookData/repository]'

String parsedState = '$[/myJob/parsedWebhookData/webhookData/state]'
String parsedPRNum = '$[/myJob/parsedWebhookData/webhookData/number]'
String parsedTitle = '$[/myJob/parsedWebhookData/webhookData/title]'
String parsedUrl = '$[/myJob/parsedWebhookData/webhookData/url]'

String parsedToBranch, parsedToCommitId, parsedToRepo
String tempString, escapedRaw

def dataSlurper, dataResult, headerSlurper, headerResult, payload

if (parsedTitle.indexOf("\"") > -1){

    tempString = parsedTitle.replace("\"","\\\"")
    escapedRaw = webhookRaw.replace("${parsedTitle}","${tempString}")
    slurper = new groovy.json.JsonSlurper()
    dataResult = slurper.parseText(escapedRaw)
    parsedTitle = tempString
} else{
    slurper = new groovy.json.JsonSlurper()
    dataResult = slurper.parseText(webhookRaw)
}

String parsedCreatedTime = dataResult.pullrequest.created_on
parsedToBranch = dataResult.pullrequest.destination.branch.name
parsedToCommitId = dataResult.pullrequest.destination.commit.hash
parsedToRepo = dataResult.pullrequest.destination.repository.full_name

headerSlurper = new groovy.json.JsonSlurper()
headerResult = slurper.parseText(webhookHeader)

String [] parsedActionType = headerResult.'x-event-key'.split(':')
  
payload = """
{
  "actionType": "${parsedActionType[1]}",
  "author": "${parsedAuth}",
  "destBranch": "${parsedToBranch}",
  "srcBranch": "${parsedFromBranch}",
  "destCommitId": "${parsedToCommitId}",
  "srcCommitId": "${parsedFromCommitId}",
  "destRepoName": "${parsedToRepo}",
  "srcRepoName": "${parsedFromRepo}",
  "createdTime": "${parsedCreatedTime}",
  "closedTime": "${ dataResult.pullrequest.state != 'OPEN' ? dataResult.pullrequest.updated_on : ''}",
  "approver": "${parsedActionType[1] == 'approved' ? dataResult.pullrequest.approval.user.display_name : ''}",
  "prNum": ${parsedPRNum},
  "state": "${parsedState}",
  "title": "${parsedTitle}",
  "url": "${parsedUrl}"
}
"""

println payload    
 
//def results = ef.sendReportingData(
  //payload: payload, reportObjectTypeName: 'bitbucket_pr_report'
//)
