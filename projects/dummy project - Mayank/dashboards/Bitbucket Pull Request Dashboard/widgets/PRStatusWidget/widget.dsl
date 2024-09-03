
widget 'PRStatusWidget', {
  attributeDataType = [
    'column1': 'STRING',
    'column5': 'DURATION',
    'column4': 'DATETIME',
    'column3': 'STRING',
    'column2': 'STRING',
    'column6': 'STRING',
  ]
  attributePath = [
    'column1': 'title',
    'column2Label': 'Repository',
    'column4Label': 'Created Date',
    'column5': 'Number of Days Open',
    'column4': 'createdTime',
    'column3': 'branch',
    'column2': 'repoName',
    'column3Label': 'Branch',
    'column6Label': 'State',
    'column6': 'state',
    'column5Label': 'Number of Days Open',
    'column1Label': 'Title',
  ]
  dashboardName = 'Bitbucket Pull Request Dashboard'
  linkParameter = [
    'externalUrl': '${url}',
  ]
  linkTarget = 'External'
  orderIndex = '72'
  projectName = 'dummy project - Mayank'
  reportName = 'BitbucketPRStatus copy'
  reportProjectName = 'dummy project - Mayank'
  title = 'Pull Requests Status'
  visualization = 'TABLE'
}
