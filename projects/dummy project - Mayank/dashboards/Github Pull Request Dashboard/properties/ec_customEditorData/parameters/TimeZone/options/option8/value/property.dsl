import java.io.File

def propertyContent = new File(propsDir, 'value.txt').text

property 'value', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
