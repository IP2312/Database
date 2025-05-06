SELECT distinct DEPT.DEPTNO, DEPT.DNAME from DEPT,EMP where DEPT.DEPTNO = EMP.DEPTNO (+) and  EMPNO is null;
SELECT EMPNO, ENAME from EMP WHERE JOB = (Select JOB from EMP WHERE ENAME = 'JONES');
SELECT EMPNO, ENAME, SAL from EMP WHERE SAL + NVL(COMM,0) > (Select avg(SAL + NVL(COMM,0)) from EMP where DEPTNO = 30);
SELECT EMPNO, ENAME from EMP where sal + nvl(COMM,0) > (Select max(SAL + nvl(COMM,0)) from EMP where DEPTNO = 30);
SELECT EMPNO, ENAME, JOB from EMP where DEPTNO = 10 and JOB not in (SELECT JOB from EMP where DEPTNO =30);
SELECT EMPNO,ENAME, JOB, SAL from EMP where SAL = (select max(SAL) from  EMP);

