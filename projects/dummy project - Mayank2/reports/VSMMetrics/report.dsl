
report 'VSMMetrics', {
  description = ''
  definition = '''{
  "size":0,
    "query":{
      "bool":{
         "filter":[
            {
               "bool":{
                  "must":[
                    {
                        "exists":{
                           "field":"releaseName",
                           "boost":1.0
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
                  "adjust_pure_negative":true,
                  "boost":1.0
               }
            }
         ],
         "adjust_pure_negative":true,
         "boost":1.0
      }
   },
  "aggregations": {
    "releaseName": {
      "terms": {
        "field": "releaseName",
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
                    "aggregations":{
                      
                    "automation_type": {

                       "terms": {

                           "script" : "doc.containsKey(\'manual\') && doc[\'manual\'].value == true ? \'Manual\' : \'Automated\'"

                       },
                  "aggregations": {
                    "individualLeadTime": {
                      "avg": {
                        "script": "doc[\'flowRuntimeStateFinish\'].value.toInstant().toEpochMilli() - doc[\'flowRuntimeStateStart\'].value.toInstant().toEpochMilli()"
                      }
                    },
                    "individualProcessTime": {
                      "avg": {
                        "script": " def total = 0; if (doc[\'evidence\'].length > 0) { def evidence = doc[\'evidence\'].value; def splitAuthor = /:/.split(evidence); def splitTime = /,/.split(splitAuthor[1].trim()); for (time in splitTime) { def splitUnit = /[a-z]/.split(time);  def splitInt = /[0-9]+/.split(time); if(splitInt.length > 1){int num = Integer.parseInt(splitUnit[0].trim()); if (splitInt[1].trim() == \'days\') { total = total + (num * 86400000); } else if (splitInt[1].trim() == \'hours\') { total = total + (num * 3600000) ; } else if (splitInt[1].trim() == \'minutes\') { total = total + (num * 60000) ; } }else{ total = doc[\'flowRuntimeStateFinish\'].value.toInstant().toEpochMilli() - doc[\'flowRuntimeStateStart\'].value.toInstant().toEpochMilli();} }} else { total = doc[\'flowRuntimeStateFinish\'].value.toInstant().toEpochMilli() - doc[\'flowRuntimeStateStart\'].value.toInstant().toEpochMilli();} return total;"
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
}
  }}'''
  projectName = 'dummy project - Mayank2'
  reportObjectTypeName = 'pipelinerun'
}
