-- SQL Lab

-- 1.0	Setting up Oracle Chinook
-- In this section you will begin the process of working with the Oracle Chinook database
-- Task – Open the Chinook_Oracle.sql file and execute the scripts within.
-- 2.0 SQL Queries
-- In this section you will be performing various queries against the Oracle Chinook database.
select * from employee
-- Task – Select all records from the Employee table.
select *from employee where lastname = ('King');
-- Task – Select all records from the Employee table where last name is King.
select * from employee where firstname = 'Andrew'and reportsto is null;
-- Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
-- 2.2 ORDER BY
select * from album Order by title Desc;
-- Task – Select all albums in Album table and sort result set in descending order by title.
select firstname from customer Order by city Asc;
-- Task – Select first name from Customer and sort result set in ascending order by city
-- 2.3 INSERT INTO
insert into genre (genreid, name)
values (37, 'Tank'), (73, 'Goepele');
-- Task – Insert two new records into Genre table
insert into employee (employeeid, lastname, firstname)
values (8733, 'Cordon', 'Ignacio'), (931, 'Davis', 'Serefina');
-- Task – Insert two new records into Employee table
insert into customer (customerid, lastname, firstname, email)
values (7137, 'Gun', 'James', 'jgiggly@gmail.com'), (7814, 'Nunez', 'Eliza', 'Ellynone@yahoo.com')
-- Task – Insert two new records into Customer table
-- 2.4 UPDATE
update customer 
 set firstname ='Robert',
  	lastname = 'Walter'
 where customerid = 32;
-- Task – Update Aaron Mitchell in Customer table to Robert Walter
update artist 
set name ='CCR'
where name = 'Creedence Clearwater Revival';
-- Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
-- 2.5 LIKE
select * from invoice where billingaddress like 'T%';
-- Task – Select all invoices with a billing address like “T%”
-- 2.6 BETWEEN
select * from invoice where total between 15 and 50;
-- Task – Select all invoices that have a total between 15 and 50
select * from employee where hiredate between '2003/06/01' 
	and '2004/03/01';
-- Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
-- 2.7 DELETE
ALTER TABLE invoice
  DROP CONSTRAINT fk_invoicecustomerid 
 ALTER TABLE invoice
    ADD CONSTRAINT fk_invoice_customerid
    FOREIGN KEY (customerid) REFERENCES customer(customerid) 
	ON DELETE CASCADE
-- Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).

-- 3.0	SQL Functions
-- In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
-- 3.1 System Defined Functions
select current_timestamp;
-- Task – Use a function that returns the current time.
select length (name) as n
from mediatype where mediatypeid = 3;
-- Task – Use a function that returns the length of a mediatype from the mediatype table
-- 3.2 System Defined Aggregate Functions
select avg (total) from invoice;
-- Task – Use a function that returns the average total of all invoices
SELECT * FROM track
WHERE unitprice = (SELECT max(unitprice) FROM track) limit 1;
-- Task – Use a function that returns the most expensive track
-- 7.0 JOINS
-- In this section you will be working with combing various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.
-- 7.1 INNER
select invoice.customerid,
invoiceid
from customer
inner join invoice on customer.customerid = invoice.customerid;
-- Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
-- 7.2 OUTER
select invoice.customerid,
customer.customerid,
customer.firstname,
customer.lastname,
invoice.invoiceid,
invoice.total
from invoice
full outer join customer on invoice.customerid = customer.customerid;
-- Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.
-- 7.3 RIGHT
select album.artistid,
album.title,
artist.name
from artist
right join album on artist.artistid = album.artistid;
-- Task – Create a right join that joins album and artist specifying artist name and title.
-- 7.4 CROSS
select *
from album cross join artist
order by artist.name asc;
-- Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
-- 7.5 SELF
select * from employee 
as em
inner join employee as em2
on em.employeeid = em2.reportsto;
-- Task – Perform a self-join on the employee table, joining on the reportsto column.
