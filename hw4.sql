/* 1. view is the result set of a stored query on the data, which the database users can query just as
they would in a persistent database collection object.
a view can limit the degree of exposure of the underlying tables to the outer world: a given user
may have permission to query the view, while denied access to the rest of the base table.
and over again. So if you have an SQL query that you write over and over again, save it as
a stored procedure, and then just call it to execute it.*/
group of statements that can be executed. A view is faster as it displays data from the tables
referenced whereas a store procedure executes sql statements.*/
returns values using the OUT parameters*/
you use SELECT statements. Stored procedures can return multiple result sets. */
stored procedure implicitly from within a SELECT statement, provided that the stored
procedure returns a result set. */
when an event occurs in the database.
DML Triggers, DDL Triggers, LOGON Triggers */
columns are being updated. */
other hand, trigger is a stored procedure that runs automatically when various events happen (eg
update, insert, delete).*/
values(10,'King', 'Aragorn', 'Gondor')
'Arnor' and RegionID = 5
select p.ProductName, Count(o.Quantity) QuantityCount from Products p inner join
[Order Details] o
on o.ProductID = p.ProductID
group by p.ProductName;
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
@terroityname char(50) = 'tory'
as
if exists(select e.EmployeeID,count(t.TerritoryDescription) c from Territories t join
join Employees e on et.EmployeeID=e.EmployeeID
where TerritoryDescription=@terroityname and count(t.TerritoryDescription)>0)
begin
insert into
Territories(TerritoryID,TerritoryDescription,RegionID)values(98432,'Stevens
Point',11)
insert into Region(RegionID,RegionDescription)values(11,'North')
end
go
number of data for two table is not the same number of data with union table, then they
do not have same data.