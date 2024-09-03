
widget 'PRStatusWidget', {
  description = ''
  attributeDataType = [
    'column1': 'STRING',
    'column5': 'DURATION',
    'column4': 'DATETIME',
    'column3': 'STRING',
    'column2': 'STRING',
    'column7': 'NUMBER',
    'column6': 'STRING',
  ]
  attributePath = [
    'column1': 'title',
    'column2Label': 'Repository',
    'column5': 'Number of Days Open',
    'column4': 'createdTime',
    'column3': 'branch',
    'column2': 'repoName',
    'column3Label': 'Branch',
    'column5Label': 'Number of Days Open',
    'column7Label': 'Pull Request Size',
    'column4Label': 'Created Date',
    'column6Label': 'State',
    'column7': 'pull request size',
    'column6': 'state',
    'column1Label': 'Title',
  ]
  dashboardName = 'Github Pull Request Dashboard'
  linkParameter = [
    'externalUrl': '${url}',
  ]
  linkTarget = 'External'
  orderIndex = '73'
  projectName = 'dummy project - Mayank'
  reportName = 'GithubPRStatus copy'
  reportProjectName = 'dummy project - Mayank'
  title = 'Pull Requests Status'
  visualization = 'TABLE'
}
