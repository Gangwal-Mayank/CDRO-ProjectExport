import java.io.File

def propertyContent = new File(propsDir, 'ec_lastResponseTime.txt').text
ec_lastResponseTime = """$propertyContent"""