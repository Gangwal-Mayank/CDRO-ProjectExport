
widget 'meanLeadTimeTotalWidget', {
  description = ''
  attributeDataType = [
    'yAxis': 'STRING',
    'xAxis': 'DURATION',
    'stacks': 'STRING',
  ]
  attributePath = [
    'yAxisLabel': 'pipelineName',
    'yAxis': 'pipelineName',
    'xAxis': 'mean Lead Time',
    'stacks': 'pipelineName',
  ]
  dashboardName = 'DemoDashboard'
  linkParameter = [
    'drilldownFilterName': 'Pipeline',
    'drilldownFilterValue': '${pipelineName}',
    'drilldownWidgetName': 'changeFailureRateWidget',
  ]
  linkTarget = 'Widget'
  orderIndex = '31'
  projectName = 'dummy project - Mayank2'
  reportName = 'TotalMeanLeadTime copy 2'
  reportProjectName = 'dummy project - Mayank2'
  title = 'Mean Lead Time (Total)'
  visualization = 'STACKED_HORIZONTAL_BAR_CHART'
}
