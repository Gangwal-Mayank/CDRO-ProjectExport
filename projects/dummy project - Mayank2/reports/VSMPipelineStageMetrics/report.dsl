
report 'VSMPipelineStageMetrics', {
  description = ''
  projectName = 'dummy project - Mayank2'
  reportObjectTypeName = 'pipelinerun'
  reportQuery = '{"searchCriteria":[{"criterion":"MUST","conditions":[{"field":"reportEventType","operator":"EQUALS","value":"ef_pipeline_run_stage_completed"}]}],"groupBy":[{"field":"flowRuntimeStart"},{"field":"projectName"},{"field":"pipelineName"},{"field":"stageName"}],"aggregationFunctions":[{"field":"flowRuntimeStateElapsedTime","function":"AVERAGE"}]}'
}
