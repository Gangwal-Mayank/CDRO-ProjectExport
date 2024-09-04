
report 'IndividualMeanProcessTime', {
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
          },"aggregations": {
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
          },"aggregations": {
            "taskName": {
              "terms": {
                "field": "taskName",
                "size": 10,
                "shard_size": 10,
                "min_doc_count": 1,
                "shard_min_doc_count": 0,
                "show_term_doc_count_error": false,
                "order": [
              {
                "individualProcessTime": "desc"
              }
            ]
              },
              "aggregations": {
                "individualProcessTime": {
                  "avg": {
                    "script": "doc[\'flowRuntimeStateFinish\'].value.toInstant().toEpochMilli() - doc[\'flowRuntimeStateStart\'].value.toInstant().toEpochMilli()"
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
  projectName = 'dummy project - Mayank2'
  reportObjectTypeName = 'pipelinerun'
}
