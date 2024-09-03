import java.io.File

def propertyContent = new File(propsDir, 'scmConfig.txt').text
scmConfig = """$propertyContent"""