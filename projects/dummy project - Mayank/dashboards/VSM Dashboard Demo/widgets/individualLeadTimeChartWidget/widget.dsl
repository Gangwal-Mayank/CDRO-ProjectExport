
widget 'individualLeadTimeChartWidget', {
  description = ''
  attributeDataType = [
    'yAxis': 'STRING',
    'xAxis': 'DURATION',
    'stacks': 'STRING',
  ]
  attributePath = [
    'yAxisLabel': 'taskName',
    'yAxis': 'taskName',
    'xAxis': 'individualLeadTime',
    'stacks': 'taskName',
  ]
  dashboardName = 'VSM Dashboard Demo'
  orderIndex = '18'
  projectName = 'dummy project - Mayank'
  reportName = 'VSMMetrics copy'
  reportProjectName = 'dummy project - Mayank'
  title = 'Individual Task Lead Time'
  visualization = 'STACKED_HORIZONTAL_BAR_CHART'
}
