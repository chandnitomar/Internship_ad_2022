SELECT * FROM BRANCH;
SELECT * FROM DEPT;
SELECT * FROM EMP;

ALTER TABLE emp
DROP COLUMN branchno;

-- JOIN 
-- THERE ARE TWO WAYS TO FETCH DATA FROM ORACLE DATABASE 
-- EITHER USING (+) OR USING ANSI LEFT/OUTER/INNER/RIGHT QURIES
-- Oracle syntax dont have full outer join but Ansi version has it
-- ################################################################ 


-- ################################################################
-- INNER JOIN
-- 18.0 Display employee details such that ename,deptname and location of work is printed by the query
-- ################################################################
SELECT
    emp.ename,dept.dname,branch.location
FROM 
    emp,dept,branch
where 
    emp.deptno=dept.deptno and dept.branchno=branch.branchno;

SELECT
    emp.ename,dept.dname,branch.location
FROM 
    emp JOIN dept 
    ON emp.deptno=dept.deptno
    JOIN branch
    ON dept.branchno=branch.branchno;
********************************************************************************
--LIST ename,job,mgr,hiredate, sal, dname,
--EMP (ename,job,mgr,hiredate, sal)
--dept(dname)
--emp.deptno = dept.deptno

SELECT
    ename, job, MGR, hiredate, sal, dname
FROM
    emp join dept
    ON
    emp.deptno =dept.deptno;
    
********************************************************************************
-- LIST All employees details suhc as  EMPNAME, JOB, MGR, HIGREDATE, SAL,DNAME
-- left join to dept table 
-- All employee details along with dname even if some employee has null value in deptno.
--    EMP [ EMPNAME, JOB, MGR, HIGREDATE, SAL]
--    DEPT[ DNAME]
--   EMP.DEPTNO=DEPT.DEPTNO
-- ################################################################ 
SELECT 
    ENAME,JOB,MGR,HIREDATE,SAL,DNAME
FROM
EMP LEFT OUTER JOIN DEPT
ON
EMP.DEPTNO=DEPT.DEPTNO;
-- ################################################################ 
-- Display ename,job,mgr,sal,hiredate,dname from emp and dept 
-- such that all deptartment names are displayed in ouput
-- Display ename,job,mgr,sal,hiredate,dname from emp showing right join with dept 
 ################################################################ 
SELECT 
    ENAME,JOB,MGR,HIREDATE,SAL,DNAME
FROM
EMP RIGHT OUTER JOIN DEPT
ON
EMP.DEPTNO=DEPT.DEPTNO;
*********************************************************************
-- ################################################################ 
-- Display ename,job,mgr,sal,hiredate,dname from emp and dept 
-- EVEN FOR THE NULL VALUES IN BOTH TABLES
 -- ################################################################ 
 SELECT 
    ENAME,JOB,MGR,HIREDATE,SAL,DNAME
FROM
    EMP FULL OUTER JOIN DEPT
ON
    EMP.DEPTNO=DEPT.DEPTNO
ORDER BY DNAME ;

--
 SELECT 
    ENAME,JOB,MGR,HIREDATE,SAL,e.deptno,DNAME
FROM
    EMP e JOIN DEPT d
ON
    e.DEPTNO=d.DEPTNO
ORDER BY DNAME ;



******************************************************************************
SELECT ENAME, E.job, MGR,HIREDATE,SAL,D.DNAME
FROM EMP E , DEPT D
WHERE E.DEPTNO=D.DEPTNO(+)

SELECT ENAME, E.job, MGR,HIREDATE,SAL,D.DNAME
FROM EMP E , DEPT D
WHERE E.DEPTNO(+)=D.DEPTNO
********************************************************************************
-- list ename,job,sal,branchname
-- emp
-- branch
-- ################################################################ 
SELECT
    ename,job,sal,branchname
from
    emp e join dept d
on
    e.deptno = d.deptno
join
    branch b
on
    d.branchno = b.branchno;
    
-- LIST ALL DNAME AND EMP COUNT FOR EACH DEPT 
-- ################################################################ 
SELECT
    DNAME,COUNT(EMPNO)
FROM
    DEPT JOIN EMP
ON
    DEPT.DEPTNO=EMP.DEPTNO
GROUP BY 
    DNAME;
    
********************************************************************************
--LIST beranchname and emp count for each branch
Select
    branchname, count(empno)
from
    branch b join dept d
on 
    b.branchno = d.branchno
join emp e
    on 
    e.deptno = d.deptno
group by
    branchname;
****************************************************************************
----LIST BRANCHNAME,DNAME,SUM OF SAL FOR THOSE BRANCH AND DEPT WHERE THE SUM IS >5000
select 
    branchname, dname,sum(sal)
from 
    branch b join dept d
on 
    b.branchno= d.branchno
join emp e
on
    e.deptno = d.deptno
group by
    dname,branchname
having
    sum(sal) > 5000;
    




*********************************************************************************
--LIST empno, ename, mgr, manager name
--SELF JOIN
select 
    e.empno, e.ename,e.mgr, m.ename
from 
    emp e  join emp m
ON
    e.mgr = m.empno;




