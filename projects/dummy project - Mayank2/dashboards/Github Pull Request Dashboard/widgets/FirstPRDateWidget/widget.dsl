
widget 'FirstPRDateWidget', {
  attributeDataType = [
    'column1': 'STRING',
    'column3': 'DATETIME',
    'column2': 'STRING',
  ]
  attributePath = [
    'column1': 'repoName',
    'column2Label': 'Branch',
    'column3': 'createdTime',
    'column2': 'branch',
    'column3Label': 'PR Creation Date',
    'column1Label': 'Repository',
  ]
  dashboardName = 'Github Pull Request Dashboard'
  orderIndex = '71'
  projectName = 'dummy project - Mayank2'
  reportName = 'GithubFirstPR copy 2'
  reportProjectName = 'dummy project - Mayank2'
  title = 'Date of First Pull Request'
  visualization = 'TABLE'
}
