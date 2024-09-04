import java.io.File

def propertyContent = new File(propsDir, 'c.txt').text
c = """$propertyContent"""