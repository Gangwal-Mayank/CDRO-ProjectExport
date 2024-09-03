import java.io.File

def propertyContent = new File(propsDir, 'runDuplicates.txt').text

property 'runDuplicates', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
