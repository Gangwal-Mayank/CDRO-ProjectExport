
widget 'timeCloseAverageWidget', {
  description = ''
  attributeDataType = [
    'yAxis': 'DURATION',
    'xAxis': 'STRING',
  ]
  attributePath = [
    'yAxis': 'avg_duration',
    'xAxis': 'branch',
    'xAxisLabel': 'branch',
  ]
  dashboardName = 'Github Pull Request Dashboard'
  linkParameter = [
    'drilldownParameterValue': 'Pacific/Honolulu',
    'drilldownWidgetName': 'daytimePRWidget',
    'drilldownParameterName': 'TimeZone',
  ]
  linkTarget = 'Widget'
  orderIndex = '65'
  projectName = 'dummy project - Mayank2'
  reportName = 'GithubPRAverage copy 2'
  reportProjectName = 'dummy project - Mayank2'
  title = 'Time To Close (Average)'
  visualization = 'VERTICAL_BAR_CHART'
}
