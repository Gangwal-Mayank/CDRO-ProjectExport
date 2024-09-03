import java.io.File

def propertyContent = new File(propsDir, 'depth.txt').text
depth = """$propertyContent"""