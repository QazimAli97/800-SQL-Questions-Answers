

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

--36) Display FirstName and Gender as M/F (if Gender = Male ? M, Female ? F).
select FirstName, 
				case
					when Gender = 'Male' then 'M'
					when gender = 'Female' then 'F'
				end as Gender
from employeedetail

--37) Select FirstName from EmployeeDetail table prefixed with "Hello ".
select concat('Hello', ' ' ,FirstName)[Firstname] from EmployeeDetail


--38) Get employee details whose Salary is greater than 600000.
select * from EmployeeDetail
where Salary > 600000

--39) Get employee details whose Salary is less than 700000.
select * from EmployeeDetail
where salary < 700000

--40) Get employee details whose Salary is between 500000 and 600000.
select * from EmployeeDetail
where Salary between 500000 and 600000

--41) Select the second highest salary from EmployeeDetail table.
select max(salary) from EmployeeDetail
where Salary < (select max(salary) from EmployeeDetail)

SELECT TOP 1 salary from 
(select top 2 salary from EmployeeDetail order by salary desc)t 
order by Salary asc

--42)Write a query to get the Department and department-wise total (SUM) Salary from EmployeeDetail table.
select Department, sum(salary)[Department Wise Total Salary]
from EmployeeDetail
group by Department

--43) Write a query to get the Department and department-wise total Salary, and display the result in ascending order of Salary.
select Department, sum(salary)[Department Wise Total Salary]  from EmployeeDetail
group by Department
order by  [Department Wise Total Salary]

--44) Write a query to get the Department and department-wise total Salary, and display the result in descending order of Salary.
select Department, sum(salary)[Department Wise Total Salary]  from EmployeeDetail
group by Department
order by [Department Wise Total Salary] desc

--45)Write a query to get the Department, total number of employees, and department-wise total Salary from EmployeeDetail table.
select Department,count(EmployeeID)[Total No. of Employees],
sum(salary)[Department Wise Total Salary] from EmployeeDetail
group by Department

--46)Get department-wise average Salary from EmployeeDetail table and order the result by Salary (ascending).
select Department, avg(Salary)[Department Wise Avg Salary]  
from EmployeeDetail
group by Department
order by [Department Wise Avg Salary]

--47)Get department-wise maximum Salary from EmployeeDetail table and order the result by Salary (ascending).
select Department, max(salary)[Department Wise Max Salary]  
from EmployeeDetail
group by Department
order by [Department Wise Max Salary] 

--48) Get department-wise minimum Salary from EmployeeDetail table and order the result by Salary (ascending).
select Department, min(salary)[Department Wise Min Salary] 
from EmployeeDetail
group by Department
order by [Department Wise Min Salary] 


--49)Write a query to fetch ProjectName that is assigned to more than one employee.
--(Use HAVING clause)?
select projectname, COUNT(employeeDetail)[No. of Emp] from ProjectDetail
group by projectname
having COUNT(employeeDetail) > 1

--51) Get employee FirstName and ProjectName, ordered by FirstName, from EmployeeDetail and ProjectDetail tables for employees who have been assigned a project.

select FirstName, projectname from EmployeeDetail e
inner join ProjectDetail p
on e.EmployeeID = p.employeeDetail
order by FirstName 

--52) Get employee FirstName and ProjectName, ordered by FirstName,
--from EmployeeDetail and ProjectDetail tables for all employees, even if no project is assigned.

select FirstName,projectname from EmployeeDetail e
left outer join ProjectDetail p
on e.EmployeeID = p.employeeDetail
order by FirstName

 
--53) Get employee FirstName and ProjectName, ordered by FirstName, 
--from EmployeeDetail and ProjectDetail tables for all employees; 
--if a project is not assigned, display “-No Project Assigned”.

select FirstName,ISNULL(Projectname, '-No Project Assigned')[Project Name]
from EmployeeDetail e
left join ProjectDetail p 
on e.EmployeeID = p.employeeDetail
order by FirstName

--54) Get all ProjectNames, even if they do not match any employee, 
--ordered by FirstName, from EmployeeDetail and ProjectDetail tables.

select projectname,FirstName from EmployeeDetail e
right join ProjectDetail p
on e.EmployeeID = p.employeeDetail
order by FirstName

--55) Get complete records (EmployeeName, ProjectName)
--from EmployeeDetail and ProjectDetail; if no match is found in either table, show NULL.

select FirstName,LastName, projectname from EmployeeDetail e
full outer join ProjectDetail p
on e.EmployeeID = p.employeeDetail

--56) Write a query to find employees who have not been assigned any project, and display “-No Project Assigned”.
select FirstName,ISNULL(projectname, '-No Project Assigned')[Project Name]
from EmployeeDetail e
left join ProjectDetail p
on e.EmployeeID = p.employeeDetail
where projectname is null

--57) Write a query to find projects that are not assigned to any employee.
select projectname,FirstName
from ProjectDetail p
left join EmployeeDetail e
on p.employeeDetail = e.EmployeeID
where EmployeeID is null

--58) Write a query to fetch EmployeeName and ProjectName where an employee has been assigned more than one project.

select FirstName,projectname
from EmployeeDetail e
inner join ProjectDetail p
on e.EmployeeID = p.employeeDetail
where EmployeeID in (select employeeDetail from ProjectDetail 
					group by employeeDetail having count(*) > 1)

--59) Write a query to fetch ProjectName on which more than one employee is working, along with EmployeeName.
select projectname, FirstName
from ProjectDetail p
left join EmployeeDetail e
on p.employeeDetail = e.EmployeeID
where projectname in (select projectname from  ProjectDetail
group by projectname
having count(*) > 1 )