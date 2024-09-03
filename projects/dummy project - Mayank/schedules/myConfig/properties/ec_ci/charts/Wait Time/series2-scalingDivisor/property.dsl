import java.io.File

def propertyContent = new File(propsDir, 'series2-scalingDivisor.txt').text

property 'series2-scalingDivisor', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
