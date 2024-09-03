import java.io.File

def propertyContent = new File(propsDir, 'ciConfigDescription.txt').text
ciConfigDescription = """$propertyContent"""