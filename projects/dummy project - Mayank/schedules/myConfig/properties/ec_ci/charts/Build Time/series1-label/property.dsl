import java.io.File

def propertyContent = new File(propsDir, 'series1-label.txt').text

property 'series1-label', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
