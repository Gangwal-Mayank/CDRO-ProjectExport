import java.io.File

def propertyContent = new File(propsDir, 'config.txt').text
config = """$propertyContent"""