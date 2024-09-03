import java.io.File

def propertyContent = new File(propsDir, 'TriggerFlag.txt').text
TriggerFlag = """$propertyContent"""