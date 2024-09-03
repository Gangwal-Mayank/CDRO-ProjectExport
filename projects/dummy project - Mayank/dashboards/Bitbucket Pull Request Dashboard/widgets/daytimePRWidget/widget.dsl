
widget 'daytimePRWidget', {
  actualParameter = [
    'TimeZone': 'GMT',
  ]
  attributeDataType = [
    'total': 'NUMBER',
    'yAxis': 'NUMBER',
    'xAxis': 'STRING',
  ]
  attributePath = [
    'total': 'total',
    'yAxis': 'Daytime PR Category_count',
    'xAxis': 'Daytime PR Category',
  ]
  dashboardName = 'Bitbucket Pull Request Dashboard'
  orderIndex = '75'
  projectName = 'dummy project - Mayank'
  reportName = 'BitbucketDT_PR copy'
  reportProjectName = 'dummy project - Mayank'
  title = 'Daytime Pull Requests vs. Off Hours'
  visualization = 'DONUT_CHART'
}
