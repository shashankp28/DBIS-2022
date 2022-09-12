  insert into department values('My New Department', 'Watson', 200000);
  select * from department where budget between 50000 and 210000;

  insert into course values('NN-101', 'A New Course', 'History', 5);
  select max(credits) from course;

  insert into instructor values('12345', 'A New Instructor', 'Comp. Sci.', 50000);
  select ID, name from instructor where dept_name in ('Comp. Sci.', "Physics");

  insert into section values('CS-101', '3', 'Summer', 2019, 'Watson', '100', 'A');
  select * from section where course_id='CS-101' order by time_slot_id asc;

  insert into teaches values('45565', 'CS-101', '1', 'Fall', 2009);
  select max(year), min(year) from teaches where ID='45565';

  insert into student values('99999', 'New Name', 'Comp. Sci.', 250);
  select ID, name from student where tot_cred in (select max(tot_cred) from student);

  insert into takes values('44553', 'CS-347', '1', 'Fall', 2009, 'A-');
  select * from takes where ID=='44553';

  insert into advisor values('19991', '22222');
  select * from advisor where i_ID='22222';

  insert into time_slot values('NEW', 'R', 13, 31, 14, 45);
  select * from time_slot where day='R';

  insert into prereq values('PHY-101', 'BIO-101');
  select * from prereq where prereq_id='BIO-101';