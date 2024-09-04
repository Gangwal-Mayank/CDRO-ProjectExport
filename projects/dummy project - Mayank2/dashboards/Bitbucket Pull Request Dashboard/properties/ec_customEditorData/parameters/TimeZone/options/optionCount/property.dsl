import java.io.File

def propertyContent = new File(propsDir, 'optionCount.txt').text
optionCount = """$propertyContent"""