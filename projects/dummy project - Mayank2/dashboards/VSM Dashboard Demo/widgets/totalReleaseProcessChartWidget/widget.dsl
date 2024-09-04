
widget 'totalReleaseProcessChartWidget', {
  description = ''
  attributeDataType = [
    'yAxis': 'STRING',
    'xAxis': 'DURATION',
    'stacks': 'STRING',
  ]
  attributePath = [
    'yAxisLabel': 'releaseName',
    'yAxis': 'releaseName',
    'xAxis': 'releaseDuration',
    'stacks': 'releaseName',
  ]
  dashboardName = 'VSM Dashboard Demo'
  orderIndex = '2'
  projectName = 'dummy project - Mayank2'
  reportName = 'TotalVSMMetrics copy 5'
  reportProjectName = 'dummy project - Mayank2'
  title = 'Release Process Time'
  visualization = 'STACKED_HORIZONTAL_BAR_CHART'
}
