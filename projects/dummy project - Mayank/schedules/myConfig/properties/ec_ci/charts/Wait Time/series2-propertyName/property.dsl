import java.io.File

def propertyContent = new File(propsDir, 'series2-propertyName.txt').text

property 'series2-propertyName', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
