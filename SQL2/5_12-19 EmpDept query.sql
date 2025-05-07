-- 12.output of all employees from department 30 sorted by their salary starting with the highest salary.
SELECT empno, ENAME, SAL
from emp
where DEPTNO = 30
order by SAL desc;

-- 13.output of all employees sorted by job and within the job by their salary
SELECT EMPNO, ENAME, Job, SAL
from emp
where DEPTNO = 30
order by JOB, SAL desc;
-- 14.output of all employees sorted by their year of employment in descending order and within the year by their name
SELECT EMPNO, ENAME, extract(year from HIREDATE)
from EMP
order by extract(year from HIREDATE) desc, ENAME;

-- 15.output of all salesmen in descending order regarding the ratio commission to salary
SELECT EMPNO, ENAME, COMM, SAL, (COMM / SAL)
from EMP
where JOB = 'SALESMAN'
order by (COMM / SAL) desc;

-- 16.output the average salary to each department number
SELECT DEPTNO, Round(avg(SAL), 2)
from EMP
group by DEPTNO;

-- 17.calculate the average annual salaries of those jobs that are performed by more than 2 employees
SELECT 12 * avg(SAL) as "Annual Salerie", Job
from EMP
group by JOB
having count(*) > 2;

-- 18.output all department numbers with at least 2 office workers
SELECT DEPTNO
from EMP
where JOB not in ('SALESMAN', 'PRESIDENT', 'MANAGER')
group by DEPTNO
having count(*) >= 2;

-- 19.find the average value for salary and commission of all employees from department 30
SELECT round(avg(SAL),2), round(avg(COMM),2) from EMP WHERE DEPTNO = 30;