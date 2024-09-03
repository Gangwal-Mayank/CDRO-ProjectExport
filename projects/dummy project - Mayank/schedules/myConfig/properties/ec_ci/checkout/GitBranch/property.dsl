import java.io.File

def propertyContent = new File(propsDir, 'GitBranch.txt').text
GitBranch = """$propertyContent"""