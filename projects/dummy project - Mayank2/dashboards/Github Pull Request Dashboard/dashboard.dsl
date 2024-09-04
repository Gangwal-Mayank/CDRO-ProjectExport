
dashboard 'Github Pull Request Dashboard', {
  layout = 'FLOW'
  projectName = 'dummy project - Mayank2'
  type = 'STANDARD'

  formalParameter 'TimeZone', defaultValue: 'GMT', {
    expansionDeferred = '0'
    options = [
      'Universal Time -00:00': 'GMT',
      'US/New_York -05:00': 'America/New_York',
      'US/Chicago -06:00': 'America/Chicago',
      'US/Phoenix -07:00': 'America/Phoenix',
      'US/Los_Angeles -08:00': 'America/Los_Angeles',
      'US/Anchorage -09:00': 'America/Anchorage',
      'US/Adak -10:00': 'America/Adak',
      'US/Honolulu -10:00': 'Pacific/Honolulu',
    ]
    orderIndex = '1'
    required = '0'
    type = 'select'
  }
}
