import java.io.File

def propertyContent = new File(propsDir, 'column1-label.txt').text

property 'column1-label', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
