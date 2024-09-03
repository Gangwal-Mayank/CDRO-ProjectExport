
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
  projectName = 'dummy project - Mayank'
  reportName = 'TotalVSMMetrics copy 2'
  reportProjectName = 'dummy project - Mayank'
  title = 'Release Process Time'
  visualization = 'STACKED_HORIZONTAL_BAR_CHART'
}
