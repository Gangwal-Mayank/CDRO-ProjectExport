import java.io.File

def propertyContent = new File(propsDir, 'series1-propertyName.txt').text

property 'series1-propertyName', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
