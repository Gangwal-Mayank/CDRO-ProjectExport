import java.io.File

def propertyContent = new File(propsDir, 'tag.txt').text

property 'tag', value: """$propertyContent""", {
  expandable = '1'
  suppressValueTracking = '0'
}
