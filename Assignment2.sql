--DB Queries
-- Display all the information of the EMP table?
SELECT * FROM EMP;


 --Display unique Jobs from EMP table?
SELECT    
    DISTINCT JOB 
FROM EMP;


 --List the emps in the asc order of their Salaries?
 SELECT
    EMPNO, ENAME, SAL
FROM
    EMP
ORDER BY
    SAL;
    
    
 --List the details of the emps in asc order of the Dptnos and desc of Jobs?
 SELECT *
 FROM EMP
 ORDER BY
    DEPTNO,
    JOB DESC;
    
    
 --Display all the unique job groups in the descending order?
 SELECT    
    DISTINCT JOB 
FROM EMP
ORDER BY
    JOB DESC;
    
    
 --Display all the details of all ‘Mgrs’
 SELECT * 
 FROM 
    EMP
 WHERE
    JOB = 'MANAGER';
    
    
 --List the emps who joined before 1981
 SELECT 
    EMPNO, ENAME, HIREDATE
FROM 
    EMP
WHERE
    HIREDATE < ('01-jan-81');
    
    
 --List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal
 SELECT 
    EMPNO, ENAME, SAL, ROUND(SAL/30,2) DAILYSAL, 12*sal ANNSAL
FROM 
    EMP
ORDER BY
    ANNSAL;
    
    
 --Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
 SELECT EMPNO,
       ENAME,
       JOB,
       HIREDATE,
       MONTHS_BETWEEN(SYSDATE,HIREDATE) EXP
FROM EMP
WHERE EMPNO IN
    (SELECT MGR
     FROM EMP);


 --List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369
 SELECT
    EMPNO, ENAME,SAL,MONTHS_BETWEEN(SYSDATE,HIREDATE) EXP
FROM 
    EMP
WHERE
    MGR = 7369;
    
    
 --Display all the details of the emps whose Comm  Is more than their Sal
  select * 
  from 
    emp 
  where
    comm > sal;
    
    
 --List the emps along with their Exp and Daily Sal is more than Rs 100
 select * 
 from emp 
 where (sal/30) >100;
 
 
 --List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
 SELECT * 
 FROM EMP
 WHERE 
    JOB = 'CLERK' OR JOB = 'ANALYST'
ORDER BY
    JOB DESC;
    
    
 --List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority
 SELECT EMPNO, ENAME, HIREDATE
 FROM EMP
 WHERE
    HIREDATE IN('1-MAY-81','3-DEC-81','17-DEC-81','19-JAN-80')
ORDER BY
    HIREDATE;
    
    
 --List the emp who are working for the Deptno 10 or20
 SELECT 
    EMPNO, ENAME, DEPTNO
FROM EMP
    WHERE DEPTNO IN(10,20)
ORDER BY 
    DEPTNO;
    
    
 ----List the emps who are joined in the year 81
 SELECT EMPNO, ENAME, HIREDATE
 FROM EMP
 WHERE HIREDATE BETWEEN '01-jan-81' AND '31-dec-81';
 
 
 --List the emps Who Annual sal ranging from 22000 and 45000
 SELECT
    EMPNO, ENAME, 12*SAL ANNSAL
FROM EMP
WHERE 
    12*SAL BETWEEN 22000 AND 45000;
    
    
 --List the Enames those are having five characters in their Names
 SELECT ENAME
 FROM EMP
 WHERE
    LENGTH(ENAME) = 5;
    
    
 --List the Enames those are starting with ‘S’ and with five characters
 SELECT ENAME
 FROM EMP
 WHERE
    SUBSTR(ENAME,1,1) = 'S' AND LENGTH(ENAME) = 5;
    
    --OR
    
select ename from emp where ename like 'S%' and length (ename) = 5;


 --List the emps those are having four chars and third character must be ‘r’
  SELECT ENAME
 FROM EMP
 WHERE
    SUBSTR(ENAME,3,1) = 'R' AND LENGTH(ENAME) = 4;
    
    --OR
    
    select * from emp where length(ename) = 4 and ename like '__R%';
    
    
 --List the Five character names starting with ‘S’ and ending with ‘H’
     select * from emp where length(ename) = 5 and ename like 'S%H';
     
     
 --List the emps who joined in January
 SELECT ENAME, HIREDATE
 FROM EMP
 WHERE TO_CHAR(HIREDATE,'MON')='JAN';
 
 
 --List the emps whose names having a character set ‘ll’ together
 SELECT ENAME
 FROM EMP
 WHERE
    ENAME LIKE '%LL%';
    
    
 --List the emps who does not belong to Deptno 20
 SELECT EMPNO, ENAME, DEPTNO
 FROM EMP
 WHERE DEPTNO <>20
 ORDER BY DEPTNO;
 
 
 --List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries
 SELECT *
 FROM EMP
 WHERE
    JOB NOT IN('PRESIDENT','MANAGER')
ORDER BY SAL;


 --List the emps whose Empno not starting with digit78
 SELECT 
    EMPNO, ENAME
FROM EMP
WHERE
        EMPNO NOT LIKE '78%';
        
        
 --List the emps who are working under ‘MGR’
 SELECT E.ENAME "EMPLOYEE", M.ENAME "MANAGER NAME"
 FROM
    EMP E JOIN EMP M
ON
    E.MGR = M.EMPNO;
    

 --List the emps who joined in any year but not belongs to the month of March
 
 SELECT EMPNO, ENAME,HIREDATE
 FROM EMP
 WHERE
    TO_CHAR(HIREDATE,'MON')<>'MAR'
ORDER BY HIREDATE;


 --List all the Clerks of Deptno 20
 SELECT EMPNO, ENAME, JOB, DEPTNO
 FROM EMP
 WHERE 
    DEPTNO = 20 AND JOB='CLERK';
    
    
 --List the emps of Deptno 30 or 10 joined in the year 1981
 SELECT
    EMPNO, ENAME, DEPTNO, HIREDATE
FROM 
    EMP
WHERE
    DEPTNO IN (10,30) AND TO_CHAR(HIREDATE,'YYYY') = '1981'
ORDER BY
    HIREDATE;
    
    
 --Display the details of SMITH
 SELECT *
 FROM EMP
 WHERE ENAME = 'SMITH';
 
 
 --Display the location of SMITH
SELECT EMPNO, ENAME, LOCATION
FROM 
    EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
JOIN BRANCH B
ON D.BRANCHNO = B.BRANCHNO
WHERE
    ENAME LIKE 'SMITH';
    
