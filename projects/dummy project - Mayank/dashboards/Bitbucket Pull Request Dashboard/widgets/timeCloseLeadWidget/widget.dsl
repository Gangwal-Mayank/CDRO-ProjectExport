
widget 'timeCloseLeadWidget', {
  attributeDataType = [
    'column1': 'STRING',
    'column5': 'STRING',
    'column4': 'STRING',
    'column3': 'STRING',
    'column2': 'DURATION',
  ]
  attributePath = [
    'column1': 'include_source_title',
    'column2Label': 'Duration',
    'column4Label': 'Branch',
    'column5': 'include_source_url',
    'column4': 'include_source_branch',
    'column3': 'include_source_repoName',
    'column2': 'avg_duration',
    'column3Label': 'Repository',
    'column5Label': 'Bitbucket URL',
    'column1Label': 'Title',
  ]
  dashboardName = 'Bitbucket Pull Request Dashboard'
  orderIndex = '64'
  projectName = 'dummy project - Mayank'
  reportName = 'BitbucketPRLead copy'
  reportProjectName = 'dummy project - Mayank'
  title = 'Top 10 Longest Time to Close (Lead)'
  visualization = 'TABLE'
}
