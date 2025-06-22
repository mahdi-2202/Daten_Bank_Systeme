import csv
import sys

students = []
enrollments = []
courses = []

def addRecord(rec, data):
    if (len(rec) != len(data[0])):
        print("error")
        sys.exit()
    data.append(rec)

def writeFile(fname, data):
    with open(fname, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile, delimiter=',', quotechar='|')
        for row in data:
            writer.writerow(row)

def readFile(fname, data):
    with open(fname, newline='') as csvfile:
        for row in csv.reader(csvfile, delimiter=',', quotechar='|'):
            # ignore "deleted entries"
            if not(",".join(row).startswith("#")):
                data.append(row)

def readStudents():
    readFile('students.csv', students)

def readEnrollments():
    readFile('enrollments.csv', enrollments)

def readCourses():
    readFile('courses.csv', courses)

# read all data into memory
def initialLoading():
    readStudents()
    readEnrollments()
    readCourses()

def printRecords(table):
    for i,item in enumerate(table):
        print(i,item)

def printStudents():
    printRecords(students)

def printCourses():
    printRecords(courses)

def printEnrollments():
    printRecords(enrollments)

def getCoursesTakenByStudentName(name):
    fname = name.split()[0]
    lname = name.split()[1]
    # identify student id
    studentId = -1
    for i,item in enumerate(students):
        if fname == item[1] and lname == item[2]:
            studentId = int(item[0])
    if (studentId < 0):
        print("error")
        return

    # (2) identify course ids
    course_ids = []
    for i,item in enumerate(enrollments[1:]):
        if int(item[0]) == studentId:
            course_ids.append(item[3])

    # (3) resolve course ids to course names
    taken_courses = []
    for i,item in enumerate(courses[1:]):
        for c in course_ids:
            if item[0] == c:
                taken_courses.append(item[1])
    return taken_courses

if __name__ == '__main__':
    # 1
    initialLoading()
    printStudents()

#    sys.exit()






    # 2
    taken_courses = getCoursesTakenByStudentName("John Smith")
    for c in taken_courses:
        print(c)

    sys.exit()



    # 3
    addRecord(['1016','Martha','Miller','24','Female','Nursing','2nd','2.0'], students)
    writeFile("students.csv", students)