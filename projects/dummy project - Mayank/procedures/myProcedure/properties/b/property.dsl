import java.io.File

def propertyContent = new File(propsDir, 'b.txt').text
b = """$propertyContent"""