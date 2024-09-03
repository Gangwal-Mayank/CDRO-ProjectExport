import java.io.File

def propertyContent = new File(propsDir, 'series3-propertyName.txt').text

property 'series3-propertyName', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
