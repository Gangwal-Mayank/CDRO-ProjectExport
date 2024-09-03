
widget 'meanTimeToRecover', {
  description = 'Average time taken to resolve an incident in Service Now.'
  actualParameter = [
    'showAsOfDate': '$[/javascript var date = new Date(); var d = \'\' + date.getDate(); var m = \'\' + (date.getMonth() + 1); \'\' + date.getFullYear() + \'-\' + (m<=9 ? \'0\' + m : m) + \'-\' + (d <= 9 ? \'0\' + d : d);]',
  ]
  attributeDataType = [
    'metricValue': 'DURATION',
  ]
  attributePath = [
    'metricValue': 'output_metric_average_incident_resolution_duration',
  ]
  colorRanges = '[]'
  dashboardName = 'DemoDashboard'
  linkParameter = [
    'externalUrl': '${drilldown_base_url}${drilldown_release_uri}^incident_state=6^ORincident_state=7',
  ]
  linkTarget = 'External'
  orderIndex = '29'
  projectName = 'dummy project - Mayank'
  reportName = 'MeanTimeToRecover copy'
  reportProjectName = 'dummy project - Mayank'
  title = 'Mean Time To Recover'
  visualization = 'METRIC'
}
