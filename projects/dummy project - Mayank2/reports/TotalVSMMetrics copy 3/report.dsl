
report 'TotalVSMMetrics copy 3', {
  description = ''
  definition = '''{"size":10,"query":{"bool":{"filter":[{"bool":{"must":[{"exists":{"field":"actualEndTime","boost":1.0}},{"exists":{"field":"actualStartTime","boost":1.0}}],"adjust_pure_negative":true,"boost":1.0}}],"adjust_pure_negative":true,"boost":1.0}},
"script_fields" : {

       "processTime" : {

           "script" : "doc.actualEndTime.value.toInstant().toEpochMilli() - doc.actualStartTime.value.toInstant().toEpochMilli()"
       },
         "leadTime" : {

           "script" : "doc.plannedEndTime.value.toInstant().toEpochMilli() - doc.plannedStartTime.value.toInstant().toEpochMilli()"
       },
           "percentage" : {

           "script" : "doc[\'releaseDuration\'].value / (doc.plannedEndTime.value.toInstant().toEpochMilli().floatValue() - doc.plannedStartTime.value.toInstant().toEpochMilli().floatValue()) * 100"
       } 
     }
      ,
        "_source": true
}
         '''
  projectName = 'dummy project - Mayank2'
  reportObjectTypeName = 'release'
}
