import java.io.File

def propertyContent = new File(propsDir, 'GitRepo.txt').text
GitRepo = """$propertyContent"""