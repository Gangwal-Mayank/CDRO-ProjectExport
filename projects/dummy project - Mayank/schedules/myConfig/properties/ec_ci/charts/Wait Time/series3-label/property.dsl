import java.io.File

def propertyContent = new File(propsDir, 'series3-label.txt').text

property 'series3-label', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
