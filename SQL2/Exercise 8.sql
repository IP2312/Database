--Display the whole hierarchy of those parts that make up P3 and P9
SELECT  LPAD('-',(LEVEL-1) *3) || SUB, LEVEL from Parts  START WITH  SUB in ('P3','P9') connect by  prior  SUB = SUPER;


--At which hierarchy level is P12 used in P1
SELECT sub, LEVEL from Parts WHERE SUB = 'P12' START WITH  SUB = 'P1' connect by  prior  SUB = SUPER;


--How many parts to P1 cost more than $20
SELECT count(*) as over_20 from Parts WHERE PRICE > 20 START WITH  SUB = 'P1' connect by  prior  SUB = SUPER;

--Output of all direct and indirect employees belonging to JONES (without JONES itself, with corresponding indentation per hierarchy)

SELECT LPAD('-', (LEVEL-1)*3)|| ENAME from EMP Start WITH MGR = (SELECT EMPNO from EMP WHERE ENAME = 'JONES') connect by prior EMPNO = MGR;

SELECT LPAD('-', (LEVEL-1) *3) || ENAME from EMP Start with EMPNO = (Select EMPNO from emp where ENAME = 'SMITH') connect by prior MGR = EMPNO;

SELECT LEVEL, round(avg(sal),2) from EMP Start WITH EMPNO = (SELECT EMPNO from emp Where JOB = 'PRESIDENT' ) connect by prior EMPNO = MGR group by  LEVEL;
