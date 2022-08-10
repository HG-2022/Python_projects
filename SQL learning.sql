--updating/deleting data in a table
select * from EmployeeSalary
update EmployeeSalary
set EmployeeID = 1011 where Jobtitle ='saesman'

usecase 2
update EmployeeSalary
set Jobtitle ='salesman'
 where EmployeeID= 1011

 --delete
-- delete from EmployeeSalary
--where employeeid = 1009


-- Aliasing

select firstname as fname
from EmployeeDemographics

select lastname lname
from EmployeeDemographics

select FirstName + ' ' +LastName as fullname
from EmployeeDemographics


select fname from EmployeeDemographics -- throws error as alias is the derived coloumn name and cannot be used in query.

---Partition by
--- We use PARTITION BY to divide the result set into partitions and perform computation on each subset of partitioned data.

---Usecase 1 [to partition data by Lastname]
----  SQL PARTITION BY clause with the OVER clause to specify the column on which we need to perform query.

select FirstName,LastName, salary, jobtitle, row_number() over (partition by LastName order by salary desc) as rownumber from EmployeeDemographics demo full outer join EmployeeSalary sal
on demo.EmployeeID = sal.EmployeeID
select FirstName,LastName, salary, jobtitle, row_number() over (partition by LastName order by salary desc) as rownumber from EmployeeDemographics demo full outer join EmployeeSalary sal
on demo.EmployeeID = sal.EmployeeID

--- usecase 2 finding avg salary by jobtype
select Salary,jobtitle,Gender,
Avg (Salary) over(partition by jobtitle) as avgsal,
MIN (Salary) over(partition by jobtitle) as minsal, 
SUM (Salary) over(partition by jobtitle) as totalsal, 
AVG (Salary) over(partition by Gender) as sal from EmployeeDemographics demo full outer join EmployeeSalary sal
on demo.EmployeeID = sal.EmployeeID



select Salary,jobtitle,
Avg (Salary) over(partition by jobtitle) as avgsal,
MIN (Salary) over(partition by jobtitle) as minsal, 
SUM (Salary) over(partition by jobtitle) as totalsal from EmployeeSalary 

--- CTE (Common Table Expression)

---Use case 1

with CTE_EMPLOYEE as
(select FirstName,LastName, Gender, salary, 
COUNT(Gender) over(Partition by gender) as totalgender, 
AVG (Salary) over(partition by Gender) as avgsal from EmployeeDemographics demo full outer join EmployeeSalary sal
on demo.EmployeeID = sal.EmployeeID)

select FirstName,LastName from CTE_EMPLOYEE
where Salary>45000

---use case 2 
---- finding avg salary by department
with Average_salary as(
select AVG(Salary) as averagesal,jobtitle
from EmployeeDemographics demo full outer join EmployeeSalary sal
on demo.EmployeeID = sal.EmployeeID
group by jobtitle)

select jobtitle,averagesal
from Average_salary
order by averagesal desc




---- looking for jobtitle with highest salary
select jobtitle, salary
from EmployeeDemographics demo full outer join EmployeeSalary sal
on demo.EmployeeID = sal.EmployeeID 
where salary= (select MAX(Salary) from EmployeeDemographics demo full outer join EmployeeSalary sal
on demo.EmployeeID = sal.EmployeeID)

---- looking for jobtitle with highest salary using groupby orderby

select jobtitle, salary
from EmployeeDemographics demo full outer join EmployeeSalary sal
on demo.EmployeeID = sal.EmployeeID 
group by jobtitle, Salary
order by salary desc

-- querying for records with firstname starting H
select FirstName, LastName
from EmployeeDemographics
where FirstName like 'M%' or LastName like 'H%'


select*from EmployeeSalary

--- Temp tables
create table #temp_employee(
EmployeeID int,
jobtitle varchar(50),
salary int
)
insert into #temp_employee values 
(1020, 'Security', 33000)

select*from #temp_employee

insert into #temp_employee
select employeeID, jobtitle,salary 
from EmployeeSalary
where employeeID=1001





---- window function
----date, time, rownumber, in, not in





