SELECT EMPNO, ENAME
from emp
where comm > sal;

SELECT  EMPNO, ENAME from EMP WHERE  DEPTNO = 30 AND SAL >= 1500;
SELECT EMPNO, ENAME from EMP WHERE  JOB = 'MANAGER' and  DEPTNO != 30;
SELECT  EMPNO, ENAME from EMP where DEPTNO = 10 and JOB != 'CERK' and JOB != 'MANAGER';
SELECT EMPNO, ENAME, sal, COMM from EMP where (SAL + NVL(COMM,0)) between 1200 and 1300;
select  EMPNO, ENAME from EMP where  ENAME  LIKE 'ALL%' and length(ENAME) <=5;
select Sal, COMM, (SAL + COMM) as total from EMP;
SELECT  EMPNO, ENAME from EMP where (COMM / SAL) > 0.25;
select AVG(SAL) as average from emp;
select  COUNT (EMPNO) from EMP where  COMM > 0;
SELECT COUNT(Distinct JOB) from  EMP where  DEPTNO = 30;
select count(EMPNO) from  EMP where DEPTNO = 30;
SELECT  EMPNO, ENAME, HIREDATE from EMP where HIREDATE between to_date('04-01-1981', 'DD-MM-YY') and to_date('15-04-1981', 'DD-MM-YY');