
widget 'totalReleaseChartWidget', {
  description = ''
  attributeDataType = [
    'yAxis': 'STRING',
    'xAxis': 'DURATION',
    'stacks': 'STRING',
  ]
  attributePath = [
    'yAxisLabel': 'releaseName',
    'yAxis': 'releaseName',
    'xAxis': 'leadTime',
    'stacks': 'releaseName',
  ]
  dashboardName = 'VSM Dashboard Demo'
  orderIndex = '1'
  projectName = 'dummy project - Mayank2'
  reportName = 'TotalVSMMetrics copy 4'
  reportProjectName = 'dummy project - Mayank2'
  title = 'Release Lead Time'
  visualization = 'STACKED_HORIZONTAL_BAR_CHART'
}
