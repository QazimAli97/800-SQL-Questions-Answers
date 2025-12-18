
--1 Write a query to get all employee details from EmployeeDetail table.
select * from EmployeeDetail

--2 Write a query to get only FirstName column from EmployeeDetail table.
select FirstName from EmployeeDetail

--3 Write a query to get FirstName in upper case as First Name.
select upper(FirstName) as [First Name ]from EmployeeDetail

--4 Write a query to get FirstName in lower case as First Name.
select lower(FirstName) from EmployeeDetail

--5 Write a query to combine FirstName and LastName and display it as Name (with space).
select CONCAT(firstname, ' ', lastname)[Name] from EmployeeDetail

--6 Select employee detail whose name is "Vikas".
select * from EmployeeDetail
where FirstName = 'Vikas'

--7 Get all employee details whose FirstName starts with 'a'.
select * from EmployeeDetail
where FirstName like 'a%'

--8 Get all employee details whose FirstName contains 'k'.
select * from EmployeeDetail
where FirstName like '%K%'

--9 Get all employee details whose FirstName ends with 'h'.
select * from EmployeeDetail
where FirstName like '%h'

--10 Get all employee details whose FirstName starts with any letter between 'a–p'.
select * from EmployeeDetail
where FirstName like '[a-p]%'

--11 Get all employee details from EmployeeDetail table whose FirstName does not start with any single character between 'a'–'p'.
select * from EmployeeDetail
where FirstName not like '[a-p]%'

--12 Get all employee details from EmployeeDetail table whose Gender ends with "le" and contains 4 letters. (Underscore _ represents any single character.)
select * from EmployeeDetail
where Gender like '__le'

--13 Get all employee details from EmployeeDetail table whose FirstName starts with 'A' and contains 5 letters.
select * from EmployeeDetail
where FirstName like 'A____'

--14 Get all employee details from EmployeeDetail table whose FirstName contains the character '%'. Example: "Vik%as"
select * from EmployeeDetail
where FirstName like '%[%]%'

--15 Get all unique Department values from EmployeeDetail table.
select Distinct Department from EmployeeDetail

--16 Get the highest Salary from EmployeeDetail table.
select max(Salary)[Max Salary] from EmployeeDetail

--17 Get the lowest Salary from EmployeeDetail table.
select min(Salary)[Min Salary]  from EmployeeDetail

--18 Show JoiningDate in "dd mmm yyyy" format Example: 15 Feb 2013.
select convert(varchar(20),JoiningDate,106)[Joining Date] from EmployeeDetail

--19 Show JoiningDate in "yyyy/mm/dd" format Example: 2013/02/15
select convert(varchar(20),JoiningDate,111)[Joining Date] from EmployeeDetail

--20 Show only the time part of JoiningDate.
select convert(time, JoiningDate)[Time of Joining] from EmployeeDetail

select convert(varchar(10), JoiningDate,108)[Joining Time] from EmployeeDetail


--21 Get only the Year part of JoiningDate.
select year(JoiningDate)[Joining Year] from EmployeeDetail

--22 Get only the Month part of JoiningDate.
select month(JoiningDate)[Joining Month] from EmployeeDetail

--23 Get the system date.
select GETDATE()[System Date] from EmployeeDetail

--24 Get the UTC date.
select GETUTCDATE()[UTC Date] 

--25 Get the FirstName, current date, JoiningDate, and the difference between current date and JoiningDate in months.
select FirstName, GETDATE()[Current Date], JoiningDate,
DATEDIFF(MONTH, JoiningDate, GETDATE())[Diff between Current Date & Joining Date in Months]
from EmployeeDetail

--26 Get the FirstName, current date, JoiningDate, and the difference between current date and JoiningDate in days.
select FirstName,GETDATE()[Current Date],JoiningDate, 
DATEDIFF(day, JoiningDate, GETDATE())[Diff between Current Date & Joining Date in Days] from EmployeeDetail

--27 Get all employee details from EmployeeDetail where the joining year is 2013.
select * from EmployeeDetail
where year(JoiningDate) = 2013

--28 Get all employee details where the joining month is January (1).
select * from EmployeeDetail
where month(JoiningDate) = 01

--29 Get all employee details whose JoiningDate is between '2013-01-01' and '2013-12-01'.
select * from EmployeeDetail
where JoiningDate between '2013-01-01' and '2013-12-01'

--30 Get how many employees exist in the EmployeeDetail table.
select count(*)[No. of Employees] from EmployeeDetail

--31 Select only one / top 1 record from EmployeeDetail table.
select top 1 *  from EmployeeDetail

--32 Select all employee details whose FirstName is "Vikas", "Ashish", or "Nikhil".
select * from EmployeeDetail
where FirstName in ('Vikas','Ashish','Nikhil')
 
--33 Select all employee details whose FirstName is NOT "Vikas", "Ashish", or "Nikhil".
select * from EmployeeDetail
where  not FirstName in ('Vikas','Ashish','Nikhil')

--34 Select FirstName from EmployeeDetail table after removing white spaces from the right side.
select rtrim(FirstName)as [First Name] from EmployeeDetail

--35 Select FirstName from EmployeeDetail table after removing white spaces from the left side.
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

create table ProjectDetail(
projectid int identity(1,1) primary key,
projectname varchar(50),
employeeDetail int);



