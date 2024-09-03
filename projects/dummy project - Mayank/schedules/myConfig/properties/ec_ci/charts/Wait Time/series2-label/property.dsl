import java.io.File

def propertyContent = new File(propsDir, 'series2-label.txt').text

property 'series2-label', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
