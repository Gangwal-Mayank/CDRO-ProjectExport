import java.io.File

def propertyContent = new File(propsDir, 'monitorTags.txt').text
monitorTags = """$propertyContent"""