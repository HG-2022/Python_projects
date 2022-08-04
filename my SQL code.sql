---joins

select EmployeeDemographics.EmployeeID,FirstName,LastName,Jobtitle,Salary from EmployeeDemographics
right outer join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


select EmployeeDemographics.EmployeeID,FirstName,LastName,Jobtitle,Salary from EmployeeDemographics
right outer join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

select * from EmployeeDemographics
full outer join EmployeeSalary 
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

select * from EmployeeDemographics
left outer join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

select EmployeeSalary.EmployeeID,FirstName,LastName,Jobtitle,Salary from EmployeeDemographics
left outer join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


select * from EmpSalary_Test
--Insert into EmpSalary_Test Values
--(1010, 'Salesman', 53000),
--(1011, 'officer', 63000),
--(1012, 'Assistant', 35000),
--(1013, 'Accountant', 43000),
--(1014, 'HR', 60000),
--(1015, 'Regional Manager', 66000),
--(1016, 'Supplier Relations', 43000),
--(1017, 'Salesman', 58000),
--(1018, 'Accountant', 45000)

--union

select * from EmployeeSalary
union
select * from EmpSalary_Test


-- case
select FirstName, LastName, Jobtitle,Gender,Salary,
case
when Gender = 'Male' then 'No hike in salary'
--else 'hike'
when Gender = 'female' then Salary + (Salary*0.10)
END as newsalary
From EmployeeDemographics join EmployeeSalary on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--case statement usecase 2
select num_reviws
case
when num_reviws = 0 then 'NEW'
when num_reviws between 1 and 5 then 'Rising'
when num_reviws between 6 and 15 then 'trendingup' 
when num_reviws between 16 and 40 then 'popuar'
when num_reviws >40 then 'hot'
end from tablename


--having clause usecase 1
select jobtitle,count(Jobtitle) as people_with_jobtitle
from EmployeeDemographics join EmployeeSalary on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
group by jobtitle
having Jobtitle like 'S%' 
--order by count(Jobtitle) desc

--having clause usecase 2
select jobtitle,count(Jobtitle) as people_with_jobtitle
from EmployeeDemographics join EmployeeSalary on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
group by jobtitle
--having count(Jobtitle) >2
order by count(Jobtitle) desc

