import java.io.File

def propertyContent = new File(propsDir, 'resultPropertySheet.txt').text
resultPropertySheet = """$propertyContent"""