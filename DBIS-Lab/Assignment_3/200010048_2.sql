/* Question 4 */

/* i) Inserting Values */
insert into part values(30, 'Clip', 'yellow', '20');
insert into part values(45, 'Holder', 'red', '120');
insert into part values(60, 'Bolt', 'gray', '70');

insert into supplier values(25, 'Jane', 'Boston', 'American Bank');
insert into supplier values(40, 'Jack', 'New York', 'Western Union');

insert into shipment values(101, 15, 10, '2022-12-03', 18, 12.3);
insert into shipment values(102, 15, 25, '2020-03-04', 45, 15.6);
insert into shipment values(103, 15, 25, '2022-01-06', 150, 2.56);
insert into shipment values(104, 15, 40, '2020-05-12', 60, 24);

insert into shipment values(105, 30, 10, '2021-05-25', 100, 65);
insert into shipment values(106, 30, 40, '2022-04-16', 120, 12.35);
insert into shipment values(107, 30, 25, '2022-03-11', 50, 1.22);
insert into shipment values(108, 30, 10, '2021-02-28', 80, 90);

insert into shipment values(109, 45, 10, '2020-11-27', 95, 45.12);
insert into shipment values(110, 45, 10, '2022-10-14', 11, 120);
insert into shipment values(111, 45, 25, '2021-09-07', 154, 0.5);
insert into shipment values(112, 45, 25, '2022-09-01', 20, 1.3);

insert into shipment values(113, 60, 25, '2020-05-05', 8, 65);
insert into shipment values(114, 60, 40, '2021-06-04', 1, 1200);
insert into shipment values(115, 60, 40, '2021-08-21', 60, 100);
insert into shipment values(116, 60, 25, '2022-12-18', 90, 0.30);

/* ii) Checking updated tables */
select * from part;
select * from supplier;
select * from shipment;