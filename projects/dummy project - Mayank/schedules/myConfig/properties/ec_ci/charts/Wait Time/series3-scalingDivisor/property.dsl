import java.io.File

def propertyContent = new File(propsDir, 'series3-scalingDivisor.txt').text

property 'series3-scalingDivisor', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
