use class6;
desc department;
desc emp_personal_detail
desc employee25;
select e.emp_name,d.dept_name from employee25
join department d on e.dept_id=d.dept_id 
where salary =(select max(e.salary) from employee25 where d.dept_id=e.dept_id);
select e.emp_name,e.salary , m.emp_name as manager_name, m.salary as manager_salary 
from employee25 e 
join employee25 m 
on e.manager_id=m.emp_id
where e.salary>m.salary;

-- Q3. Show department(s) where the average salary of employees is greater than the overall company average salary.
select d.dept_name from department d join employee25 e  on e.dept_id=d.dept_id
group by  d.dept_name having 
avg(e.salary) >(select avg(salary) from employee25)


-- Q4. Find employees whose age is more than 30 and are working in the same city as their department’s location.
SELECT e.emp_name, ep.city, d.location
FROM Employee25 e
JOIN Emp_Personal_Detail ep ON e.emp_id = ep.emp_id
JOIN Department d ON e.dept_id = d.dept_id
WHERE YEAR(CURDATE()) - YEAR(ep.dob) > 30
AND ep.city = d.location;

-- Q5. Display employees who are the only employee in their department (single employee department).
select e.emp_name from employee25 e join department d on e.emp_id=d.dept_id group by d.dept_name ,e.emp_id having count(*)=1

Q6. Show employees with duplicate city entries in Emp_Personal_Detail table (i.e., more than one employee from the same city).
select e.emp_name,ep.city from employee25 e join emp_personal_detail ep on e.emp_id=ep.emp_id where ep.city=(select city from emp_personal_detail group by city having count(*)>1)
Q7. Display employees with email IDs that do not follow proper format (use REGEXP to detect invalid emails).

 select e.emp_name,em.email_id from employee25 inner join Emp_Personal_Detail em on e.emp_id=em.emp_id where em.email_id not like  regex " " 
Q8. Find employees whose salary is within 10% of the highest salary in the company.
select emp_name ,salary from employee25 where salary >=(select max(salary)*0.1from employee25)

Q9. List departments where all employees are Single (based on marital_status in Emp_Personal_Detail).
select emp_name  from employee25 
union
select marital_status from  emp_personal_detail
where marital_status="single"


-- Q10. How to find the second highest salary in a table?
SELECT MAX(salary) AS second_highest
FROM Employee25
WHERE salary < (SELECT MAX(salary) FROM Employee25);



-- Q11. What is the difference between WHERE and HAVING clause?
-- where first rows are filter 
   having first rows filter then  group data are filter i.e is grp is filter afterwards the condtion 
Q12. What are Aggregate functions in SQL? Explain with example.
min,max,sum,avg 
Q13. Write a query to find duplicate records in a table.

Q14. Write a query to find employees who have the same salary as another employee.
SELECT emp_id, COUNT(*)
FROM Employee25
GROUP BY emp_id
HAVING COUNT(*) > 1;
 or you can use distinct keyword too 
Q15. What is a Subquery? Difference between Correlated Subquery and Simple Subquery.

Q16. List employees hired in year 2020 or later.
select emp_name, hire_date
from  employee25
where year(hire_date) >= 2020;
Q17. What is the difference between WHERE and HAVING clause?
where first rows are filter 
   having first rows filter then  group data are filter i.e is grp is filter afterwards the condtion 
  Q18. Explain Primary Key, Foreign Key, Unique Key differences?

primary key - uniquely identifies rows cannot be null
foreign key -refers primary key of other table 
unique -unique charchetrs are check and null is allow 
Q19. What is the difference between DELETE, TRUNCATE, and DROP?
delete- rows delete specific
truncate - delete all rows 
drop - delete whole table

Q20. Difference between INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN with example?

INNER JOIN: Only matching rows.

LEFT JOIN: All left + matching right.

RIGHT JOIN: All right + matching left.


