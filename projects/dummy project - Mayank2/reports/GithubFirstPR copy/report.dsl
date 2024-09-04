
report 'GithubFirstPR copy', {
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
                    "value": "opened",
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
  reportObjectTypeName = 'github_pr_report'
}
