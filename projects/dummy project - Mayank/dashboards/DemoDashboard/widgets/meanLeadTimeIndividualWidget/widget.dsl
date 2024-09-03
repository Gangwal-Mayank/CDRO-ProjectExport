
widget 'meanLeadTimeIndividualWidget', {
  attributeDataType = [
    'column1': 'STRING',
    'column5': 'DURATION',
    'column4': 'STRING',
    'column3': 'STRING',
    'column2': 'STRING',
  ]
  attributePath = [
    'column1': 'ProjectName',
    'column2Label': 'Pipeline Name',
    'column4Label': 'Task Name',
    'column5': 'individualProcessTime',
    'column4': 'taskName',
    'column3': 'stageName',
    'column2': 'pipelineName',
    'column3Label': 'Stage Name',
    'column5Label': 'Lead Time',
    'column1Label': 'Project Name',
  ]
  dashboardName = 'DemoDashboard'
  orderIndex = '39'
  projectName = 'dummy project - Mayank'
  reportName = 'IndividualMeanProcessTime copy'
  reportProjectName = 'dummy project - Mayank'
  title = 'Mean Lead Time (Individual)'
  visualization = 'TABLE'
}
