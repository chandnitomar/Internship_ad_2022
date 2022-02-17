--########################################################################
-- Display the employee details (empno,ename,dname,job,sal,location).
-- emp (empno,ename,job,sal)
-- dept(dname)
-- branch(location)
--########################################################################
SELECT
e.empno,e.ename,e.job,e.sal,d.dname,b.location
FROM
emp e join dept d
on
e.deptno=d.deptno
join branch b
on b.branchno=d.branchno
Order by d.deptno;
############################################################################
-- View
--########################################################################
CREATE VIEW vw_empdetails
AS
SELECT
e.empno,e.ename,e.job,e.sal,d.dname,b.location
FROM
emp e join dept d
on
e.deptno=d.deptno
join branch b
on b.branchno=d.branchno
Order by d.deptno;


SELECT     *     FROM        vw_empdetails;
SELECT     *     FROM        vw_empdetails where dname='ACCOUNTING';
SELECT empno,ename,dname from vw_empdetails;
SELECT empno,ename,dname from vw_empdetails where dname='ACCOUNTING';


--Display ename and mgr name for all departments

SELECT e.ename, m.ename
FROM emp e JOIN emp m
ON e.mgr = m.empno;

--VIEW
CREATE VIEW vw_mgrdetails(ename, mgrname, deptno)
AS
SELECT e.ename, m.ename
FROM emp e JOIN emp m
ON e.mgr = m.empno;

******************************************************************************
SELECT
DEPTNO,EMPNO,ENAME,JOB,SAL,COMM
FROM
EMP
ORDER BY DEPTNO,EMPNO;

--########################################################################
-- VIEW IS CREATED ON SINGLE TABLE 
-- WE CAN USE DML OPERATION ON IT SUCH AS INSERT/UPDAE/DELETE
-- INCASE OF INSERT MUST HANDLE THE NULL/NOT NULL VALUES
--########################################################################
-- DISPLAY EMPNO,ENAME,JOB,SAL,COMM,DEPTNO FOR AN EMPLOYEE
-- DEPARTMENT WISE EMPLOYEE COMPLETE DETAILS RELATED TO JOB,SAL COMM ALONG WITH 
-- EMPNO AND ENAME
SELECT 
    DEPTNO,EMPNO,ENAME,JOB,SAL,COMM
    FROM
        EMP
    ORDER BY DEPTNO,EMPNO;
    
CREATE VIEW vw_dept_wise_emp_details
(DEPTNO,EMPNO,ENAME,JOB,SAL,COMM)
AS
SELECT 
    DEPTNO,EMPNO,ENAME,JOB,SAL,COMM
    FROM
        EMP
    ORDER BY DEPTNO,EMPNO;

SELECT * FROM VW_DEPT_WISE_EMP_DETAILS;
SELECT * FROM VW_DEPT_WISE_EMP_DETAILS WHERE DEPTNO=30;
SELECT * FROM VW_DEPT_WISE_EMP_DETAILS WHERE DEPTNO=10;
UPDATE vw_dept_wise_emp_details
    SET COMM=0
    WHERE DEPTNO=10;

SELECT * FROM VW_DEPT_WISE_EMP_DETAILS WHERE DEPTNO=10;

INSERT INTO VW_DEPT_WISE_EMP_DETAILS VALUES(10,2345,'JASMIN','CLERK',1300,0);
*********************************************************************************************************
--Create view for displaying employee details as follows
--deptno,empno,ename,sal,comm(if null -o),totalsalary(sal+comm[comm=null=>0])
CREATE VW_SALARYDETAILS
(DEPTNO, EMPNO, ENAME,SAL,SAL+COMM 'TOTALSAL')
AS
    CREATE VIEW vw_temp(deptno,empno,ename,sal,comm,toalsal)
AS
SELECT
deptno,empno,ename,sal,nvl(comm,0),nvl(sal,0)+nvl(comm,0)as totalsal
FROM
emp
WHERE
deptno=30 AND sal>(SELECT min(sal) FROM emp);
    
****************************************************************************************
-- get employees in first 5 rows
-- 1 getting empdetails(deptno,empno,ename,job,sal) sorted on deptno,sal
SELECT
deptno,empno,ename,job,sal
FROM
emp
ORDER BY deptno,sal;
-- 2. create an inline view to show first 5 records
-- getting top 5 records based on sal in desceding order
SELECT
*
FROM
( SELECT
deptno,empno,ename,job,sal
FROM
emp
ORDER BY sal desc
)
WHERE
ROWNUM <= 5;

*********************************************************************************
-- branch(branchname), dept(dname)
-- Using Lateral keyword on inline view
SELECT
DNAME,
BRANCHNAME
From
dept d,
Lateral( select * from branch b where b.branchno=d.branchno)
order by
dname;

