import java.io.File

def propertyContent = new File(propsDir, 'TimeZone.txt').text

property 'TimeZone', value: """$propertyContent""", {
  expandable = '0'
  suppressValueTracking = '0'
}
