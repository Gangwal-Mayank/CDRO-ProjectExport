import java.io.File

def propertyContent = new File(propsDir, 'checkoutSCMConfigName.txt').text
checkoutSCMConfigName = """$propertyContent"""