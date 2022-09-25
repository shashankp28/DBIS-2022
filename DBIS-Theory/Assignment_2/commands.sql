-- Question 1 (a)
select ID, score,
    case 
        when score>=80 then 'A'
        when score>=60 then 'B'
        when score>=40 then 'C'
        else 'F'
    end as grade
from marks

-- Question 1 (b)
select grade, count(*) as grade_count,
    case 
        when score>=80 then 'A'
        when score>=60 then 'B'
        when score>=40 then 'C'
        else 'F'
    end as grade
from marks
group by grade

-- Question 2 (a)
update works
set salary = salary*1.1
where company_name='First Bank Corporation'

-- Question 2 (b)
update works
set salary = salary*1.1
where employee_name in 
    (select distinct M.manager_name
    from works as W inner join manages as M
    on W.employee_name=M.manager_name
    where W.company_name='First Bank Corporation')

-- Question 2 (c)
delete from works
where company_name='Small Bank Corporation'

-- Question 2 (d)
select employee.employee_name
from employee natural join (works natural join company)
where employee.city=company.city

-- Question 2 (e)
with manager(manager_name, street, city) as
    select employee_name, street, city
    from employee
    where employee_name in
        (select distinct T.manager_name
        from manages as T)
select distinct E.employee_name
from employee as E, manages as Ms, manager as Mr
where E.employee_name=Ms.employee_name
    and Mr.manager_name=Ms.manager_name
    and E.street=Mr.street
    and E.city=Mr.city

-- Question 2 (f)
with avg_salary(c_name, val) as
    select company_name, avg(salary)
    from works
    group by company_name
select distinct W.employee_name
from works as W inner join avg_salary
on W.company_name=avg_salary.c_name 
where W.salary>avg_salary.val

-- Question 2 (g)
with salary_sum(c_name, val) as
    select company_name, sum(salary)
    from works
    group by company_name
with min_sum(val) as
    select min(val)
    from salary_sum
select distinct salary_sum.c_name
from salary_sum
where salary_sum.val=min_sum.val

-- Question 2 (h)
with pay_counts(c_name, val) as
    select company_name, count(*)
    from works
    group by company_name
with max_count(val) as
    select max(val)
    from pay_counts
select distinct pay_counts.c_name
from pay_counts
where PC.val=max_count.val

-- Question 2 (i)
with FBC_avg(val) as
    select avg(salary)
    from works
    where company_name='First Bank Corporation'
with avg_salary(c_name, val) as
    select company_name, avg(salary)
    from works
    group by company_name
select distinct c_name
from avg_salary
where avg_salary.val>FBC_avg.val

-- Question 2 (j)
update employee
set city='Newtown'
where employee_name='Jones'

-- Question 2 (k)
update works
set salary = case
    when salary<=100000 then salary*1.1
    else salary*1.03
    end
where employee_name in 
    (select distinct M.manager_name
    from works as W inner join manages as M
    on W.employee_name=M.manager_name
    where W.company_name='First Bank Corporation')

-- Question 3
select *
from users natural join 
    (select user_id, training_id, training_date
    from training_details
    group by user_id, training_id, training_date
    having count(*)>1)
order by training_date desc

-- Question 4
-- Gives the details of all those runners who did not win in any of the races.

-- Question 5 (a)
select *
from books left join publishers
on books.publisher_id=publishers.publisher_id

-- Question 5 (b)
select *
from books right join publishers
on books.publisher_id=publishers.publisher_id