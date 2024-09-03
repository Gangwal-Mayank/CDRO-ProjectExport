import java.io.File

def propertyContent = new File(propsDir, 'autoSeries.txt').text
autoSeries = """$propertyContent"""