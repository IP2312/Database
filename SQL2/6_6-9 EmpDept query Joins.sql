--6.in which city does the employee Allen work?
SELECT LOC
from DEPT
         join EMP on DEPT.DEPTNO = EMP.DEPTNO
where ENAME = 'ALLEN';

--7. search for all employees who earn more than their supervisor
Select e.EMPNO, e.ENAME
from EMP e
         join EMP m on e.MGR = m.EMPNO
where e.SAL > m.SAL;
--8. output the number of hires in each year
SELECT extract(year from HIREDATE) as year, count(*) as Hires
from EMP
group by extract(year from HIREDATE);

--9. output all employees who have a job like an employee from CHICAGO.
SELECT EMPNO, Ename, JOB
from emp
where JOB in (Select Job
              from EMP
                       join DEPT on EMP.DEPTNO = DEPT.DEPTNO
              WHERE LOC = 'CHICAGO') and DEPTNO != (Select DEPTNO from DEPT where LOC = 'CHICAGO');