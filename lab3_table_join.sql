create table Student(
	students_id Serial primary key,
	students_name varchar(50) not null,
	major varchar(50) not null
);

create table Course(
	course_id Serial primary key,
	course_name varchar(50) not null,
	course_credits int
);

create table Enrollments(
	students_id int,
	course_id int,
	enroll_date date,
	foreign key (students_id) references Student(students_id),
	foreign key (course_id) references Course(course_id)
);

insert into Student (students_name, major) 
Values('Emily Johnson', 'Computer Science'),
	('Michael Brown', 'Mathematics'),
	('Jessica Davis','Physics'),
	('Daniel Wilson', 'Biology');

insert into Course (course_name, course_credits)
Values('Data Structures', 4),
	('Calculus 1', 3),
	('General Physics', 4),
	('Orgamic Chemistry', 4);

select * from course;

insert into Enrollments (students_id, course_id, enroll_date)
Values(1, 1, '2023-01-10'),
	(1, 3, '2023-02-20'),
	(2, 1, '2023-03-05'),
	(2, 2, '2023-01-15'),
	(3, 3, '2023-02-25'),
	(4, 4, '2023-03-01');

--join the enrollments table with the students table to display CourseID, Name, EnrollmentDate
select Enrollments.course_id, Student.students_name, Enrollments.enroll_date 
from Student 
inner join Enrollments on Student.students_id = Enrollments.students_id
order by Student.students_id;

select Student.students_name, Student.major, Course.course_name
from Enrollments
join Student on Enrollments.students_id = Student.students_id
join Course on Course.course_id = Enrollments.course_id
order by Student.students_id;

select Student.students_name, Course.course_name, Enrollments.enroll_date 
from Enrollments
join Student on Enrollments.students_id = Student.students_id
join Course on Enrollments.course_id = Course.course_id
where Student.major like 'Mathematics';


