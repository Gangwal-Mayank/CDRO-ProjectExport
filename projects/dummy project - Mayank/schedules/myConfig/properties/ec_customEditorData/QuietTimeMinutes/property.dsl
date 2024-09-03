import java.io.File

def propertyContent = new File(propsDir, 'QuietTimeMinutes.txt').text
QuietTimeMinutes = """$propertyContent"""