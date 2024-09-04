import java.io.File

def propertyContent = new File(propsDir, 'ec_lastResponseMessage.txt').text
ec_lastResponseMessage = """$propertyContent"""