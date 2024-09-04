import java.io.File

def propertyContent = new File(propsDir, 'a.txt').text
a = """$propertyContent"""