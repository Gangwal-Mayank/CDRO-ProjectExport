
report 'test', {
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
                  "manual": {
                    "value": "true",
                    "boost": 1
                  }
                }
              },
              {
                "term": {
                  "releaseName": {
                    "value": "new Release",
                    "boost": 1
                  }
                }
              },
              {
                "term": {
                  "reportEventType": {
                    "value": "ef_pipeline_run_task_completed",
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
    "ProjectName": {
      "terms": {
        "field": "projectName",
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
        "pipelineName": {
          "terms": {
            "field": "pipelineName",
            "size": 10,
            "shard_size": 10,
            "min_doc_count": 1,
            "shard_min_doc_count": 0,
            "show_term_doc_count_error": false,
            "order": [
              {
                "_key": "asc"
              },
              {
                "_count": "desc"
              }
            ]
          },
          "aggregations": {
            "stageName": {
              "terms": {
                "field": "stageName",
                "size": 10,
                "shard_size": 10,
                "min_doc_count": 1,
                "shard_min_doc_count": 0,
                "show_term_doc_count_error": false,
                "order": [
                  {
                    "_key": "asc"
                  },
                  {
                    "_count": "desc"
                  }
                ]
              },
              "aggregations": {
                "taskName": {
                  "terms": {
                    "field": "taskName",
                    "size": 10,
                    "shard_size": 10,
                    "min_doc_count": 1,
                    "shard_min_doc_count": 0,
                    "show_term_doc_count_error": false
                  },
                  "aggregations": {
                    "individualLeadTime": {
                      "avg": {
                        "script": "doc[\'flowRuntimeStateFinish\'].value.toInstant().toEpochMilli() - doc[\'flowRuntimeStateStart\'].value.toInstant().toEpochMilli()"
                      }
                    },
                    "individualProcessTime": {
                      "avg": {
                        "script": " def evidence = doc[\'evidence\'].value; def total = 0; def splitAuthor = /:/.split(evidence); def splitTime = /,/.split(splitAuthor[1].trim()); if (doc[\'evidence\'].value != \'\') { for (time in splitTime) { def splitUnit = /[a-z]/.split(time); def splitInt = /[0-9]+/.split(time); int num = Integer.parseInt(splitUnit[0].trim()); if (splitInt[1].trim() == \'days\') { total = total + (num * 86400000); } if (splitInt[1].trim() == \'hours\') { total = total + (num * 3600000) ; } if (splitInt[1].trim() == \'minutes\') { total = total + (num * 60000) ; } }} return total;"
                      }
                    },
  "percentage": {
          "bucket_script": {
            "buckets_path": {
              "process": "individualProcessTime",
              "lead": "individualLeadTime"
            },
            "script": "params.process / params.lead * 100"
          }
        }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}'''
  projectName = 'dummy project - Mayank'
  reportObjectTypeName = 'pipelinerun'
}
