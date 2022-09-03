/* Question 1 */

create user 'Shashank'@'localhost' identified by 'MyPassword@123';
grant all privileges on lab3.* to 'Shashank'@'localhost';
/* Logout and login as user Shashank */
create database lab3;
use lab3;

/* Question 2 */

create table part(
    part_no int,
    part_name varchar(50) not null,
    color varchar(10),
    weight numeric(10, 5) check(weight>0),
    primary key (part_no)
);
create table supplier(
    supplier_no int,
    sup_name varchar(80) not null,
    city varchar(25),
    bank varchar(25),
    primary key (supplier_no)
);
create table shipment(
    shipment_no int,
    part_no int,
    supplier_no int,
    date DATE,
    quantity int check(quantity>=0),
    price numeric(15, 5) check(price>=0),
    primary key (shipment_no),
    foreign key (part_no) references part(part_no),
    foreign key (supplier_no) references supplier(supplier_no)
);

/* Question 3 */

insert into part values(15, 'Rubber', 'red', '100');
insert into supplier values(10, 'John', 'Paris', 'Citi-Bank');
insert into shipment values(20, 15, 10, '2022-09-03', 50, 10);

/* Question 5 */

/* Part (i) */
select distinct supplier.supplier_no, supplier.sup_name
from (shipment natural join part) natural join supplier
where part.color='red';

/* Part (ii) */
select supplier.supplier_no, supplier.sup_name, supplier_costs.total_cost, supplier.bank
from supplier natural join (
        select shipment.supplier_no, sum(shipment.quantity * shipment.price)
        from shipment natural join supplier
        group by shipment.supplier_no
    ) 	as supplier_costs(supplier_no, total_cost);

/* Part (iii) */
select supplier_no, sup_name
from supplier as S
where not exists (
    select part_no
    from part
    
    except

    select T.part_no
    from supplier natural join shipment as T
);