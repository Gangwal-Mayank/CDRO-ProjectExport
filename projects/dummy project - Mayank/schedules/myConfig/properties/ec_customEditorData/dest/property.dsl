import java.io.File

def propertyContent = new File(propsDir, 'dest.txt').text
dest = """$propertyContent"""