--6.in which city does the employee Allen work?
SELECT LOC from DEPT join EMP on DEPT.DEPTNO = EMP.DEPTNO  where ENAME = 'ALLEN'

