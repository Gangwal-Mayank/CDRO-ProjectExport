
widget 'totalReleaseWidget', {
  description = ''
  attributeDataType = [
    'column1': 'STRING',
    'column4': 'PERCENT',
    'column3': 'DURATION',
    'column2': 'DURATION',
  ]
  attributePath = [
    'column1': 'releaseName',
    'column2Label': 'Total Process Time',
    'column4Label': 'Total Activity Ratio',
    'column4': 'percentage',
    'column3': 'leadTime',
    'column2': 'processTime',
    'column3Label': 'Total Lead Time',
    'column1Label': 'Release',
  ]
  dashboardName = 'VSM Dashboard Demo'
  orderIndex = '3'
  projectName = 'dummy project - Mayank2'
  reportName = 'TotalVSMMetrics copy 6'
  reportProjectName = 'dummy project - Mayank2'
  title = 'Total Releases'
  visualization = 'TABLE'
}
