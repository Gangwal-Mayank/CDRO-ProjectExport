import java.io.File

def propertyContent = new File(propsDir, 'showAsOfDate.txt').text

property 'showAsOfDate', value: """$propertyContent""", {
  expandable = '0'
  suppressValueTracking = '0'
}
