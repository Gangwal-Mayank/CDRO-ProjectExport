import java.io.File

def propertyContent = new File(propsDir, 'overwrite.txt').text

property 'overwrite', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
