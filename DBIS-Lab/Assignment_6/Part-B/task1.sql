create database library;
use library;

-- Create Book Table
create table book(
    book_id int,
    title varchar(50) not null,
    category varchar(20),
    author varchar(30) not null,
    primary key(book_id)
);


-- Create Student Table
create table student(
    student_id int,
    name varchar(30) not null,
    dept_name varchar(20),
    year int check(year > 1701 and year < 2100),
    semester varchar(6) check(semester in ('Fall', 'Winter', 'Spring', 'Summer')),
    primary key(student_id)
);

-- Create Issue table
create table issue(
    student_id int not null, 
    book_id int not null, 
    issue_date DATE not null, 
    return_date DATE,
    primary key(student_id, book_id, issue_date),
    foreign key(student_id) references student(student_id) on delete cascade,
    foreign key(book_id) references book(book_id) on delete cascade
);