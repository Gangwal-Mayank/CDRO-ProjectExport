
report 'VSMPipelineMetrics', {
  description = ''
  projectName = 'dummy project - Mayank2'
  reportObjectTypeName = 'pipelinerun'
  reportQuery = '{"searchCriteria":[{"criterion":"SHOULD","conditions":[{"field":"reportEventType","operator":"EQUALS","value":"ef_pipeline_run_task_completed"}]}],"groupBy":[{"field":"flowRuntimeStart"},{"field":"projectName"},{"field":"pipelineName"},{"field":"stageName"},{"field":"taskName"}],"aggregationFunctions":[{"field":"flowRuntimeStateElapsedTime","function":"AVERAGE","name":"Task Elapsed Time"}]}'
}
