-- create tables from csv with data type guessing
CREATE TABLE students AS SELECT * FROM read_csv('students.csv', header = true);
CREATE TABLE courses AS SELECT * FROM read_csv('courses.csv', header = true);
CREATE TABLE enrollments AS SELECT * FROM read_csv('enrollments.csv', header = true);

-- show student records
FROM students;

-- return courses taken by student "John Smith"
SELECT c."Course Title" FROM students s, courses c, enrollments e WHERE s."First Name" = 'John' and s."Last Name"= 'Smith' AND s."Student ID" = e."Student ID" AND e."Course ID" = c."Course ID";

-- compute the average grade by gender
SELECT gender, AVG(GPA) from students group by gender;
