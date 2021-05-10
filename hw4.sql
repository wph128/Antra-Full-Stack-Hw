/* 1. view is the result set of a stored query on the data, which the database users can query just as
they would in a persistent database collection object.
a view can limit the degree of exposure of the underlying tables to the outer world: a given user
may have permission to query the view, while denied access to the rest of the base table.
*/

/* 2. View cannot be modify like group by and distinct. */
/* 3. A stored procedure is a prepared SQL code that you can save, so the code can be reused over
and over again. So if you have an SQL query that you write over and over again, save it as
a stored procedure, and then just call it to execute it.*/

/* 4.View is simple showcasing data stored in the database tables whereas a stored procedure is a
group of statements that can be executed. A view is faster as it displays data from the tables
referenced whereas a store procedure executes sql statements.*/

/*5. A function has a return type and returns a value. A procedure does not have a return type. But it
returns values using the OUT parameters*/

/* 6. Stored procedures contain IN and OUT parameters or both. They may return result sets in case
you use SELECT statements. Stored procedures can return multiple result sets. */

/* 7. Stored procedures are typically executed with an EXEC statement. However, you can execute a
stored procedure implicitly from within a SELECT statement, provided that the stored
procedure returns a result set. */

/* 8. Trigger is a Special kind of Stored Procedure or an operation that gets executed automatically
when an event occurs in the database.
DML Triggers, DDL Triggers, LOGON Triggers */

/* 9. a trigger can be invoked when a row is inserted into a specified table or when certain table
columns are being updated. */

/* 10. Stored procedures are a pieces of the code in written in PL/SQL to do some specific task. On the
other hand, trigger is a stored procedure that runs automatically when various events happen (eg
update, insert, delete).*/

/*1*/
insert into Region values(5, 'Middle Earth')
insert into Territories values(11111,'Gondor', 5)
insert into Employees(EmployeeID, LastName, FirstName, Territory)
values(10,'King', 'Aragorn', 'Gondor')
/*2*/
update Territories set TerritoryDescription = 'Arnor' where TerritoryID = 11111
/*3*/
delete from Territories where TerritoryID = 11111 and TerritoryDescription =
'Arnor' and RegionID = 5

delete from Region where RegionDescription = 'Middle Earth' and RegionID = 5
/*4*/
create view view_product_order_Wang as
select p.ProductName, Count(o.Quantity) QuantityCount from Products p inner join
[Order Details] o
on o.ProductID = p.ProductID
group by p.ProductName;
/*5*/
alter proc spProductOrderQuant2
@id int,
@total int out
as
begin
 select @id = view_product_quantity_order_Wang.ProductID,@total =
view_product_quantity_order_Wang.QuantityCount from
view_product_quantity_order_Wang
where view_product_quantity_order_Wang.ProductID = @id
end
declare @id int, @total int
exec spProductOrderQuant2 2, @total out
print @total
/*6*/

/*7*/

/*8*/
create trigger trg_ins_wang on territories
for update as
if exists(select e.employeeid,count(t.TerritoryDescription)from Territories t
join employeeterritories et on t.TerritoryID=et.TerritoryID
join Employees e on et.EmployeeID=e.EmployeeID
where t.TerritoryDescription='stevens point'
group by e.EmployeeID
having count(t.TerritoryDescription)>100)
begin
update Territories
set TerritoryDescription='Tory' where TerritoryDescription='stevens point'
End
drop trigger trg_ins_wang
/*9*/
create table people_wang(id int,name char(20),cityid int)
create table city_wang(cityid int,city char(20))
insert into people_wang(id,name,cityid)values(1,'Aaron Rodgers',2)
insert into people_wang(id,name,cityid)values(2,'Russell Wilson',1)
insert into people_wang(id,name,cityid)values(3,'Jody Nelson',2)
insert into city_wang(cityid,city)values(1,'Settle')
insert into city_wang(cityid,city)values(2,'Green Bay')

create view Packers_penghao_wang as
select p.id, p.name from people_wang p inner join city_wang c on p.cityid=c.cityid
where c.city='Green bay'
begin tran
rollback
drop table people_wang
drop table city_wang
drop view Packers_penghao_wang
/*10*/
create proc sp_birthday_employees_wang as
begin
select employeeid,LastName,FirstName,Title,
TitleOfCourtesy,BirthDate,HireDate,Photo into birthday_employees_wang from
Employees
where month(BirthDate)=2
end
drop table birthday_employees_wang
/*11*/
create procsp move_employees_wang
@terroityname char(50) = 'tory'
as
if exists(select e.EmployeeID,count(t.TerritoryDescription) c from Territories t join
employeeterritories et on t.TerritoryID=et.TerritoryID
join Employees e on et.EmployeeID=e.EmployeeID
where TerritoryDescription=@terroityname and count(t.TerritoryDescription)>0)
begin
insert into
Territories(TerritoryID,TerritoryDescription,RegionID)values(98432,'Stevens
Point',11)
insert into Region(RegionID,RegionDescription)values(11,'North')
end
go
/*12*/
I will store the total data number for both table and do the union, and check, if the
number of data for two table is not the same number of data with union table, then they
do not have same data.

/*14*/
1.declare @fullname varchar(20)
select @fullname = firstname + lastname+ middlename+'.' from people
print @fullname
2.select firstname +''+lastname+middlename+ '.' as fullname from table1
/*15*/
declare @student varchar(20)
declare @marks int
set @student
set @marks= (select max(marks) from student where sex='F')
print @student

/*16*/
declare @student varchar(20)
declare @marks int
set @student
set @marks= (select max(marks) from student order by sex)
print @student