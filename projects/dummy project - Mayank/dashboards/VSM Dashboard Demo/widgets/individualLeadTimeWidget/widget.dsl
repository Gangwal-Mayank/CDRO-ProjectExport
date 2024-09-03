
widget 'individualLeadTimeWidget', {
  description = ''
  attributeDataType = [
    'column1': 'STRING',
    'column5': 'DURATION',
    'column4': 'DURATION',
    'column3': 'STRING',
    'column2': 'STRING',
    'column7': 'STRING',
    'column6': 'PERCENT',
  ]
  attributePath = [
    'column1': 'releaseName',
    'column2Label': 'Stage',
    'column5': 'individualProcessTime',
    'column4': 'individualLeadTime',
    'column3': 'taskName',
    'column2': 'stageName',
    'column3Label': 'Task',
    'column5Label': 'Process Time',
    'column7Label': 'Task Type',
    'column4Label': 'Lead Time (Milliseconds)',
    'column6Label': 'Individual Activity Ratio',
    'column7': 'automation_type',
    'column6': 'percentage',
    'column1Label': 'Release',
  ]
  dashboardName = 'VSM Dashboard Demo'
  orderIndex = '6'
  projectName = 'dummy project - Mayank'
  reportName = 'VSMMetrics copy 2'
  reportProjectName = 'dummy project - Mayank'
  title = 'Average Lead & Process Time Per Task'
  visualization = 'TABLE'
}
