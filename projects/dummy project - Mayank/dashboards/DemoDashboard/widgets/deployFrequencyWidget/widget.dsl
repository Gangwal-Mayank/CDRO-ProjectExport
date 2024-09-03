
widget 'deployFrequencyWidget', {
  actualParameter = [
    'showAsOfDate': '$[/javascript var date = new Date(); var d = \'\' + date.getDate(); var m = \'\' + (date.getMonth() + 1); \'\' + date.getFullYear() + \'-\' + (m<=9 ? \'0\' + m : m) + \'-\' + (d <= 9 ? \'0\' + d : d);]',
    'timeSlice': '30',
  ]
  attributeDataType = [
    'trend': 'NUMBER',
    'metricValue': 'PERCENT',
  ]
  attributePath = [
    'trend': 'output_metric_trend',
    'metricValue': 'output_metric_current_percent',
  ]
  colorRanges = '[]'
  dashboardName = 'DemoDashboard'
  orderIndex = '41'
  projectName = 'dummy project - Mayank'
  reportName = 'DeploymentFrequency copy'
  reportProjectName = 'dummy project - Mayank'
  title = 'Pipeline Deployment Frequency (Success)'
  visualization = 'METRIC'
}
