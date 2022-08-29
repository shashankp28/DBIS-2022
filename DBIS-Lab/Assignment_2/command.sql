select * from (
    select * from (
        select * from (
            select * from (select * from student, department where student.dept_name=departement.dept_name and student.name='Zhang')
            ) as sd, takes where takes.ID = sd.ID 
        ) as sdt, advisor where advisor.s_ID=sdt.ID
    ) as sdta, instructor where sdta.dept_name=instructor.dept_name;

select * from student, department, takes, advisor, instructor where student.name='Zhang' and student.dept_name=department.dept_name and
    stduent.ID=takes.ID and student.ID=advisor.s_ID and student.dept_name=instructor.dept_name