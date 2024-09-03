import java.io.File

def propertyContent = new File(propsDir, 'clone.txt').text
clone = """$propertyContent"""