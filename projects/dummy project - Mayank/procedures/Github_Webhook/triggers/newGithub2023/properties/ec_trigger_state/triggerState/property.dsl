import java.io.File

def propertyContent = new File(propsDir, 'triggerState.txt').text
triggerState = """$propertyContent"""