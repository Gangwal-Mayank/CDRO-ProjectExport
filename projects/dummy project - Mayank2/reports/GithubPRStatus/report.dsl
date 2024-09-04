
report 'GithubPRStatus', {
  definition = '''{
  "size": 100,
  "collapse": {
    "field": "url"
  },
    "script_fields": {
    "pull request size": {
      "script": { 
        "source":"doc[\'additions\'].value + doc[\'deletions\'].value + doc[\'changedFiles\'].value"
      }
    },"Number of Days Open": {
      "script": { 
        "source":"doc[\'state\'].value == \'open\' ? System.currentTimeMillis() - doc[\'createdTime\'].value.toInstant().toEpochMilli() : doc[\'closedTime\'].value.toInstant().toEpochMilli() - doc[\'createdTime\'].value.toInstant().toEpochMilli()"
      }
    }
  },
      "_source": true,
  "sort": [
    {
      "repoName": {
        "order": "asc"
      }
    },
    {
      "createdTime": {
        "order": "asc"
      }
    },
    {
      "@timestamp": {
        "order": "desc"
      }
    }
  ]
}'''
  projectName = 'dummy project - Mayank2'
  reportObjectTypeName = 'github_pr_report'
}
