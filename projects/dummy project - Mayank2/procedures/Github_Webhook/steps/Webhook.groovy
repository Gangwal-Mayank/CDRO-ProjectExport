import com.electriccloud.client.groovy.ElectricFlow
import com.electriccloud.client.groovy.models.*
import groovy.json.JsonSlurper
  
ElectricFlow ef = new ElectricFlow()

String webhookRaw='$[/myJob/webhookData]'

String parsedBranch='$[/myJob/parsedWebhookData/branch]'
String parsedAuthEmail='$[/myJob/parsedWebhookData/commitAuthorEmail]'
String parsedAuth='$[/myJob/parsedWebhookData/commitAuthorName]'
String parsedCommitId='$[/myJob/parsedWebhookData/commitId]'
String parsedRepo='$[/myJob/parsedWebhookData/repository]'

String parsedState='$[/myJob/parsedWebhookData/webhookData/state]'
String parsedPRNum='$[/myJob/parsedWebhookData/webhookData/number]'
String parsedTitle='$[/myJob/parsedWebhookData/webhookData/title]'
String parsedUrl='$[/myJob/parsedWebhookData/webhookData/url]'
String parsedClosedTime

String tempString, escapedRaw
def slurper, result, payload

if (parsedTitle.indexOf("\"") > -1){

    tempString=parsedTitle.replace("\"","\\\"")
    escapedRaw=webhookRaw.replace("${parsedTitle}","${tempString}")
    slurper = new groovy.json.JsonSlurper()
    result = slurper.parseText(escapedRaw)
    parsedTitle=tempString
} else{
    slurper = new groovy.json.JsonSlurper()
    result = slurper.parseText(webhookRaw)
}

String parsedCreatedTime=result.pull_request.created_at
String parsedActionType=result.action
String parsedMergedStatus=result.pull_request.merged
String parsedAdditions=result.pull_request.additions
String parsedDeletions=result.pull_request.deletions
String parsedChangedFiles=result.pull_request.changed_files

if (result.pull_request.closed_at != null) {
    parsedClosedTime=result.pull_request.closed_at
  
  payload = """
{
  "additions": ${parsedAdditions},
  "actionType": "${parsedActionType}",
  "author": "${parsedAuth}",
  "authorEmail": "${parsedAuthEmail}",
  "branch": "${parsedBranch}",
  "changedFiles": ${parsedChangedFiles},
  "commitId": "${parsedCommitId}",
  "createdTime": "${parsedCreatedTime}",
  "closedTime": "${parsedClosedTime}",
  "deletions": ${parsedDeletions},
  "mergedStatus": ${parsedMergedStatus},
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
  "additions": ${parsedAdditions},
  "actionType": "${parsedActionType}",
  "author": "${parsedAuth}",
  "authorEmail": "${parsedAuthEmail}",
  "branch": "${parsedBranch}",
  "changedFiles": ${parsedChangedFiles},
  "commitId": "${parsedCommitId}",
  "createdTime": "${parsedCreatedTime}",
  "deletions": ${parsedDeletions},
  "mergedStatus": ${parsedMergedStatus},
  "prNum": ${parsedPRNum},
  "repoName": "${parsedRepo}",
  "state": "${parsedState}",
  "title": "${parsedTitle}",
  "url": "${parsedUrl}"
}
"""
  }

println payload  
 
def results = ef.sendReportingData(
  payload: payload, reportObjectTypeName: 'github_pr_report'
)
