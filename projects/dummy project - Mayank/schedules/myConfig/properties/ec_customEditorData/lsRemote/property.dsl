import java.io.File

def propertyContent = new File(propsDir, 'lsRemote.txt').text
lsRemote = """$propertyContent"""