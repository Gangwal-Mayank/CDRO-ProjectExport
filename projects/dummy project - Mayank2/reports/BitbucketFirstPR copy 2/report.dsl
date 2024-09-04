
report 'BitbucketFirstPR copy 2', {
  definition = '''{
  "size": 10,
  "query": {
    "bool": {
      "filter": [
        {
          "bool": {
            "must": [
              {
                "term": {
                  "actionType": {
                    "value": "created",
                    "boost": 1
                  }
                }
              }
            ],
            "adjust_pure_negative": true,
            "boost": 1
          }
        }
      ],
      "adjust_pure_negative": true,
      "boost": 1
    }
  },
  "collapse": {
    "field": "branch"
  },
  "sort": [
    {
      "@timestamp": {
        "order": "asc"
      }
    }
  ]
}'''
  projectName = 'dummy project - Mayank2'
  reportObjectTypeName = 'bitbucket_pr_report'
}
