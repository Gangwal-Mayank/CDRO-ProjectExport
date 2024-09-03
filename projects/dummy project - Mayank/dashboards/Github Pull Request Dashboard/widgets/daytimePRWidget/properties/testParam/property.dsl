import java.io.File

def propertyContent = new File(propsDir, 'testParam.txt').text

property 'testParam', value: """$propertyContent""", {
  expandable = '0'
  suppressValueTracking = '0'
}
