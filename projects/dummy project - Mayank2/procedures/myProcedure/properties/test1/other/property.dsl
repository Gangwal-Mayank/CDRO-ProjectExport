import java.io.File

def propertyContent = new File(propsDir, 'other.txt').text
other = """$propertyContent"""