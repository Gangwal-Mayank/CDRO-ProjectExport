import java.io.File

def propertyContent = new File(propsDir, 'series1-scalingDivisor.txt').text

property 'series1-scalingDivisor', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
