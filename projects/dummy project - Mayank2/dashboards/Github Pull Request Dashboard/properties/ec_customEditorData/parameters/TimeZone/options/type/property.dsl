import java.io.File

def propertyContent = new File(propsDir, 'type.txt').text

property 'type', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
