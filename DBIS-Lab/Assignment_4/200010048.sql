select distinct(course.course_id), course.title, instructor.ID, instructor.name
from (instructor natural join teaches), course
where course.course_id=teaches.course_id 
	and instructor.dept_name='Comp. Sci.'
	and teaches.year=2009 
    and course.dept_name='Civil'
order by instructor.name ASC;


insert into course values('CS-303', 'DBIS', 'Comp. Sci.', 6),
                        ('CS-333', 'New Course', 'Comp. Sci.', 3);
insert into prereq values('CS-333', 'CS-303');
select * from prereq;

update instructor
set salary = salary*1.1
where dept_name in (select department.dept_name 
                    from department 
                    where departmenet.budget>90000);


select count(ID), course_id
from takes natural join course
where course.dept_name="Comp. Sci."
    and takes.year=2009
    and takes.semester="Fall"
group by course_id
having count(ID)>2
order by course_id ASC; 