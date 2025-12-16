

use practice

select * from customer

select * from Departments

--1

select sales.PRODUCT_id, sales.CustomerID, quantity, totalamount from product
inner join  Sales
on PRODUCT.product_id = Sales.product_id
inner join Customer 
on sales.CustomerID = Customer.customerId

--2
select concat(firstname, ' ',lastname)[Customer_name],quantity  from product
inner join  Sales
on PRODUCT.product_id = Sales.product_id
inner join Customer 
on sales.CustomerID = Customer.customerId
where quantity > 5


--3
select concat(firstname, ' ',lastname)[Customer_name],PRODUCT.PRODUCT_id,PRODUCTname from product
inner join  Sales
on PRODUCT.product_id = Sales.product_id
inner join Customer 
on sales.CustomerID = Customer.customerId
where PRODUCT.PRODUCT_id =  10

--4
select PRODUCT.PRODUCT_id,PRODUCTname, totalamount from product
inner join  Sales
on PRODUCT.product_id = Sales.product_id
inner join Customer 
on sales.CustomerID = Customer.customerId
where totalamount > 1000

--6
select PRODUCTname,Quantity, totalamount from product
inner join  Sales
on PRODUCT.product_id = Sales.product_id

--7
select concat(firstname, ' ', lastname)[Customer_name],PRODUCTname from product
inner join  Sales
on PRODUCT.product_id = Sales.product_id
inner join Customer 
on sales.CustomerID = Customer.customerId

--8
select PRODUCTname, Totalamount from product
inner join  Sales
on PRODUCT.product_id = Sales.product_id
inner join Customer 
on sales.CustomerID = Customer.customerId

--9
select concat(firstname, ' ', lastname)[Customername],PRODUCTname, count(salesid) from product
inner join  Sales
on PRODUCT.product_id = Sales.product_id
inner join Customer 
on sales.CustomerID = Customer.customerId
group by concat(firstname, ' ', lastname),PRODUCTname

--10
select concat(firstname, ' ', lastname)[Customername],PRODUCTname, Quantity, Totalamount[Netamount] from product
inner join  Sales
on PRODUCT.product_id = Sales.product_id
inner join Customer 
on sales.CustomerID = Customer.customerId

--11
select top 5 PRODUCTname, Totalamount[Netamount] from product
inner join  Sales
on PRODUCT.product_id = Sales.product_id
order by Totalamount desc


--12
select concat(firstname, ' ', lastname)[Customername], sum(Totalamount) from sales
inner join Customer 
on sales.CustomerID = Customer.customerId
group by concat(firstname, ' ', lastname)
order by sum(Totalamount) desc


--13
select Category, AVG(totalamount)[Avg Selling Price] from product
inner join  Sales
on PRODUCT.product_id = Sales.product_id
group by Category
order by AVG(totalamount) desc

--14
select ProductName, sum(TotalAmount)[Net Sale Amount], ROW_NUMBER() over(order by sum(TotalAmount) desc)[Rank]
from product
inner join  Sales
on PRODUCT.product_id = Sales.product_id
group by ProductName

--15
select customer.CustomerID,concat(firstname, ' ', lastname)[Customername], totalamount,
sum(totalamount) over(partition by customer.customerid order by totalamount)[Running Total]
from product
inner join  Sales
on PRODUCT.product_id = Sales.product_id
inner join Customer 
on sales.CustomerID = Customer.customerId

--1 
select ProductName, sum(quantity)[Total Quantity] from Product p
right join sales s 
on p.product_id = s.Product_ID
group by ProductName


--2
select top 3 concat(firstname, ' ', LastName)[Customer name], sum(totalamount)[Total Amount]
from Customer c
left join Sales s
on c.CustomerID = s.CustomerID
group by concat(firstname, ' ', LastName)
order by sum(totalamount) desc;


with cte as (select  concat(firstname, ' ', LastName)[Customer name],
sum(totalamount)[Total Amount],
RANK() over (order by sum(totalamount) desc)[Top 3] 
from Customer c
left join Sales s
on c.CustomerID = s.CustomerID
group by concat(firstname, ' ', LastName))
select * from cte
where [Top 3] < 4


--3
select ProductName,sum(quantity)[Total Quantity order] from Product p
inner join sales s
on p.product_id = s.Product_ID
where quantity >= 50
group by ProductName
 
--4
select   concat(firstname, ' ', LastName)[Customer Name],
count(distinct sales.product_id)[No. of Distinct Product Purchase]
from product
inner join  Sales
on PRODUCT.product_id = Sales.product_id
inner join Customer 
on sales.CustomerID = Customer.customerId
group by concat(firstname, ' ', LastName)
order by concat(firstname, ' ', LastName) 
   


--5
	with cte as(
	select CONCAT(Firstname,' ', LastName)[Customer Name],ProductName,totalamount,
	rank() over(partition by CONCAT(Firstname,' ', LastName) order by totalamount desc)[Rank]
	from Customer c
	inner join sales s
	on c.CustomerID = s.CustomerID
	inner join Product p
	on s.Product_ID = p.product_id
	)
	select * from cte
	where Rank = 1;

	
	--Subquery
	select CONCAT(Firstname,' ', LastName)[Customer Name],ProductName, TotalAmount
	from Customer c
	inner join sales s
	on c.CustomerID = s.CustomerID
	inner join Product p
	on s.Product_ID = p.product_id
	where TotalAmount = (select max(s2.totalamount) from Sales s2 where s2.CustomerID = c.CustomerID)
	order by CONCAT(Firstname,' ', LastName)
	

	--6
	select CONCAT(Firstname,' ', LastName)[Customer Name], Quantity, SalesID
	from Customer c
	right join Sales s
	on c.CustomerID = s.CustomerID
	where Quantity > 5
	order by CONCAT(Firstname,' ', LastName)

	--7
	select Category, sum(totalamount)[NetAmount] from Product p
	inner join Sales s
	on p.product_id = s.Product_ID
	group by Category

	--8
	select ProductName, totalamount, cast(Round((totalamount * 100.0)/
	sum(TotalAmount) over (partition by p.product_id),2)as decimal(10,2))[Percentage contribution]
	from Product p
	inner join Sales s
	on p.product_id = s.Product_ID

	--9
	Select CONCAT(Firstname,' ', LastName)[Customer Name], sum(TotalAmount)[Avg Spending]
	from Customer c
	inner join sales s
	on c.CustomerID = s.CustomerID
	group by CONCAT(Firstname,' ', LastName)
	having sum(TotalAmount) > (select AVG(totalamount) from Sales)
	--where TotalAmount > (select AVG(totalamount) from Sales)

--10
select CONCAT(Firstname,' ', LastName)[Customer Name],
sum(TotalAmount)[Total Amount],
RANK() over (order by sum(TotalAmount) desc) [Rank]
from Customer c
right join sales s
on c.CustomerID = s.CustomerID
group by CONCAT(Firstname,' ', LastName) 

create database [800 SQL Questions & Answers]

use [800 SQL Questions & Answers]

create table EmployeeDetail (
EmployeeID INT Identity(1,1) Primary key,
FirstName Varchar(50),
LastName Varchar(50),
Salary int,
JoiningDate Datetime,
Department Varchar(20),
Gender Varchar(10)
)

insert into EmployeeDetail (FirstName, LastName, Salary, JoiningDate, Department, Gender)
values 
('Vikas', 'Ahlawat', 500000, '2013-02-15 11:26:28.290', 'IT', 'Male'),
('nikita', 'Jain', 530000, '2014-03-19 12:45:47.293', 'HR', 'Female'),
('Ashish', 'Kumar', 500000, '2014-01-09 17:09:37.793', 'HR', 'Male'),
('Nikhil', 'Kadam', 600000, '2014-05-31 09:37:27.090', 'Payroll', 'Male'),
('anish', 'Sharma', 480000, '2014-09-17 11:58:23.790', 'IT', 'Male');
--1
select * from EmployeeDetail

--2
select FirstName from EmployeeDetail

--3
select upper(FirstName) as [First Name ]from EmployeeDetail

--4
select lower(FirstName) from EmployeeDetail

--5
select CONCAT(firstname, ' ', lastname)[Name] from EmployeeDetail

--6
select * from EmployeeDetail
where FirstName = 'Vikas'

--7
select * from EmployeeDetail
where FirstName like 'a%'

--8
select * from EmployeeDetail
where FirstName like '%K%'

--9
select * from EmployeeDetail
where FirstName like '%h'

--10
select * from EmployeeDetail
where FirstName like '[a-p]%'

--11
select * from EmployeeDetail
where FirstName not like '[a-p]%'

--12
select * from EmployeeDetail
where Gender like '__le'

--13
select * from EmployeeDetail
where FirstName like 'a____'

--14
select * from EmployeeDetail
where FirstName like '%[%]%'

--15
select Distinct Department from EmployeeDetail

--16
select max(Salary)[Max Salary] from EmployeeDetail

--17
select min(Salary)[Min Salary]  from EmployeeDetail

--18
select convert(varchar(20),JoiningDate,106)[Joining Date] from EmployeeDetail

--19
select convert(varchar(20),JoiningDate,111)[Joining Date] from EmployeeDetail

--20
select convert(time, JoiningDate)[Time of Joining] from EmployeeDetail

select convert(varchar(10), JoiningDate,108)[Joining Time] from EmployeeDetail


--21
select year(JoiningDate)[Joining Year] from EmployeeDetail

--22
select month(JoiningDate)[Joining Month] from EmployeeDetail


--23
select GETDATE()[System Date] from EmployeeDetail

--24
select GETUTCDATE()[UTC Date] 

--25
select FirstName, GETDATE()[Current Date], JoiningDate,
DATEDIFF(MONTH, JoiningDate, GETDATE())[Diff between Current Date & Joining Date in Months]
from EmployeeDetail

--26
select FirstName,GETDATE()[Current Date],JoiningDate, 
DATEDIFF(day, JoiningDate, GETDATE())[Diff between Current Date & Joining Date in Days] from EmployeeDetail

--27
select * from EmployeeDetail
where year(JoiningDate) = 2013

--28
select * from EmployeeDetail
where month(JoiningDate) = 01

--29
select * from EmployeeDetail
where JoiningDate between '2013-01-01' and '2013-12-01'

--30
select count(*)[No. of Employees] from EmployeeDetail

--31
select top 1 *  from EmployeeDetail

--32
select * from EmployeeDetail
where FirstName in ('Vikas','Ashish','Nikhil')

--33
select * from EmployeeDetail
where  not FirstName in ('Vikas','Ashish','Nikhil')

--34
select rtrim(FirstName)as [First Name] from EmployeeDetail

--35
select ltrim(FirstName)[First Name] from EmployeeDetail

