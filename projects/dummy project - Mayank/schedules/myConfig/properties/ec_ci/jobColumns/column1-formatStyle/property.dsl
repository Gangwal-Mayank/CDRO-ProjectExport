import java.io.File

def propertyContent = new File(propsDir, 'column1-formatStyle.txt').text

property 'column1-formatStyle', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
