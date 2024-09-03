
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
  dashboardName = 'Bitbucket Pull Request Dashboard'
  orderIndex = '70'
  projectName = 'dummy project - Mayank'
  reportName = 'BitbucketFirstPR copy'
  reportProjectName = 'dummy project - Mayank'
  title = 'Date of First Pull Request'
  visualization = 'TABLE'
}
