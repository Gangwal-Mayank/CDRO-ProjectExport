import java.io.File

def propertyContent = new File(propsDir, 'commit.txt').text
commit = """$propertyContent"""