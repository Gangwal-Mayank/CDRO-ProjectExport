
report 'BitbucketPRStatus copy 2', {
  definition = '''{
  "size": 100,
  "collapse": {
    "field": "url"
  },
    "script_fields": {
    "Number of Days Open": {
      "script": { 
        "source":"doc[\'state\'].value == \'OPEN\' ? System.currentTimeMillis() - doc[\'createdTime\'].value.toInstant().toEpochMilli() : doc[\'closedTime\'].value.toInstant().toEpochMilli() - doc[\'createdTime\'].value.toInstant().toEpochMilli()"
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
  reportObjectTypeName = 'bitbucket_pr_report'
}
