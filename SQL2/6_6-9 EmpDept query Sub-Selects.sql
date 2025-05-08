--6.in which city does the employee Allen work?
SELECT LOC
from DEPT
where DEPTNO = (Select DEPTNO from EMP where ENAME = 'ALLEN');

--7. search for all employees who earn more than their supervisor
SELECT e.ENAME
from EMP e
WHERE e.SAL > (select m.sal from emp m where m.EMPNO = e.MGR);

--8. output the number of hires in each year
SELECT count(*) as hires, extract(year from HIREDATE)
from emp
group by extract(year from HIREDATE);

SELECT ENAME, DEPTNO
from EMP
where JOB in (Select job from EMP where DEPTNO = (Select DEPTNO from DEPT where LOC = 'CHICAGO'))
  and DEPTNO != (Select DEPTNO from DEPT where LOC = 'CHICAGO');