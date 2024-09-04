import java.io.File

def propertyContent = new File(propsDir, 'stepProperty.txt').text
stepProperty = """$propertyContent"""