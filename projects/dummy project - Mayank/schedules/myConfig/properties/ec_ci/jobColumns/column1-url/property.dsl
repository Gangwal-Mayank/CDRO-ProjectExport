import java.io.File

def propertyContent = new File(propsDir, 'column1-url.txt').text

property 'column1-url', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
