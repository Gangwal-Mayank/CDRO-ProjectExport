import java.io.File

def propertyContent = new File(propsDir, 'timeSlice.txt').text

property 'timeSlice', value: """$propertyContent""", {
  expandable = '0'
  suppressValueTracking = '0'
}
