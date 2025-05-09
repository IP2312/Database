--5.find all employees whose salary is higher than the average salary of their department
SELECT e.EMPNO, e.DEPTNO
from EMP e
where sal > (Select avg(d.sal) from emp d where e.DEPTNO = d.DEPTNO);

--6.identify all departments that have at least one employee
Select DEPTNO, count(*) as "Nr Employees"
from EMP
group by EMP.DEPTNO
having count(*) >= 1;

--7.output of all departments that have at least one employee earning over $1000

Select distinct DEPTNO from EMP WHERE SAL > 1000;


--8.output of all departments in which each employee earns at least 1000,-.
Select distinct DEPTNO from EMP group by DEPTNO having min(SAL) > 1000;