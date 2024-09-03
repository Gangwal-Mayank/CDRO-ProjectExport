
report 'BitbucketPRDayofWeek', {
  definition = '''{
  "size": 0,
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
  "aggregations": {
    "repoName": {
      "terms": {
        "field": "repoName",
        "size": 10,
        "shard_size": 10,
        "min_doc_count": 1,
        "shard_min_doc_count": 0,
        "show_term_doc_count_error": false,
        "order": [
          {
            "_count": "desc"
          },
          {
            "_key": "asc"
          }
        ]
      },
      "aggregations": {
        "perWeekDayNum": {
          "terms": {
            "script": "(doc[\'createdTime\'].value.getDayOfWeek() == 1 ? \'1\' : (doc[\'createdTime\'].value.getDayOfWeek() == 2 ? \'2\' : ((doc[\'createdTime\'].value.getDayOfWeek() == 3 ? \'3\' : ((doc[\'createdTime\'].value.getDayOfWeek() == 4 ? \'4\' : ((doc[\'createdTime\'].value.getDayOfWeek() == 5 ? \'5\' : ((doc[\'createdTime\'].value.getDayOfWeek() == 6 ? \'6\' : \'7\'))))))))))",
            "order": {
              "_key": "asc"
            }
          },
          "aggregations": {
            "perWeekDay": {
              "terms": {
                "script": "(doc[\'createdTime\'].value.getDayOfWeek() == 1 ? \'Monday\' : (doc[\'createdTime\'].value.getDayOfWeek() == 2 ? \'Tuesday\' : ((doc[\'createdTime\'].value.getDayOfWeek() == 3 ? \'Wednesday\' : ((doc[\'createdTime\'].value.getDayOfWeek() == 4 ? \'Thursday\' : ((doc[\'createdTime\'].value.getDayOfWeek() == 5 ? \'Friday\' : ((doc[\'createdTime\'].value.getDayOfWeek() == 6 ? \'Saturday\' : \'Sunday\'))))))))))"
              }
            }
          }
        }
      }
    }
  }
}'''
  projectName = 'dummy project - Mayank'
  reportObjectTypeName = 'bitbucket_pr_report'
}
