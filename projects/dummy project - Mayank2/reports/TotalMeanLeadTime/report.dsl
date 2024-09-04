
report 'TotalMeanLeadTime', {
  definition = '''{"size":0,"query":{"bool":{"filter":[{"bool":{"must":[{"term":{"reportEventType":{"value":"ef_pipeline_run_completed","boost":1.0}}}],"adjust_pure_negative":true,"boost":1.0}}],"adjust_pure_negative":true,"boost":1.0}},
"aggregations":{
      "projectName":{
         "terms":{
            "field":"projectName",
            "size":10,
            "shard_size":10,
            "min_doc_count":1,
            "shard_min_doc_count":0,
            "show_term_doc_count_error":false,
            "order":[
               {
                  "_count":"desc"
               },
               {
                  "_key":"asc"
               }
            ]
         },
           "aggregations":{
      "pipelineName":{
         "terms":{
            "field":"pipelineName",
            "size":10,
            "shard_size":10,
            "min_doc_count":1,
            "shard_min_doc_count":0,
            "show_term_doc_count_error":false,
            "order":[
               {
                  "_count":"desc"
               },
               {
                  "_key":"asc"
               }
            ]
         },
        "aggregations": {
                "mean Lead Time": {
                  "avg": {
                    "script": "doc[\'flowRuntimeFinish\'].value.toInstant().toEpochMilli() - doc[\'flowRuntimeStart\'].value.toInstant().toEpochMilli()"
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
