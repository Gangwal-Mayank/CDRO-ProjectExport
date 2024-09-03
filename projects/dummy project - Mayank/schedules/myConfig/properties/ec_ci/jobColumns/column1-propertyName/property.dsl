import java.io.File

def propertyContent = new File(propsDir, 'column1-propertyName.txt').text

property 'column1-propertyName', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
