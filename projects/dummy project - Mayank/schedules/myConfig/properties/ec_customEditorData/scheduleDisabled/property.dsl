import java.io.File

def propertyContent = new File(propsDir, 'scheduleDisabled.txt').text

property 'scheduleDisabled', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
