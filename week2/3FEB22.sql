--Agenda
--1. Decode
--2. Subqueries
--3. copying the data to tables 
-- ################################################################
-- Function called DECODE
-- ################################################################
CREATE TABLE COLOR(
ID INT,
COLORCODE VARCHAR2(7)
);

INSERT INTO COLOR VALUES(1,'#FF0000');
INSERT INTO COLOR VALUES(2, '#00FF00');
INSERT INTO COLOR VALUES(3,'#0000FF');
INSERT INTO COLOR VALUES(4,NULL);


SELECT ID,COLORCODE FROM COLOR;

SELECT
    ID,COLORCODE,
    DECODE(COLORCODE,
    '#FF0000','RED',
    '#00FF00','GREEN',
    '#0000FF','BLUE',
    'NO COLOR') AS COLOR_NAME
FROM
    COLOR;


**********************************************************************************************
--Function called RANK DENSE_RANK, ROW_NUMBER
--USING ROW_NUMBER OVER ORDER BY(SAL)
SELECT EMPNO, ENAME, DEPTNO, SAL FROM EMP order By SAL;

SELECT 
    EMPNO, ENAME, DEPTNO,SAL,
    ROW_NUMBER() OVER  (ORDER BY SAL)
FROM
    EMP
ORDER BY 
    SAL;
    

-- ################################################################
-- USING ROW_NUMBER OVER( ORDER BY SAL) - FOR EVER DEPT
-- ################################################################
SELECT 
    EMPNO, ENAME, DEPTNO,SAL,
    ROW_NUMBER() OVER  (PARTITION BY DEPTNO ORDER BY SAL)
FROM
    EMP
ORDER BY 
    DEPTNO,SAL;
-- ################################################################
-- USING RANK ()
--A. RANK(CONSTANT_VALUES,CONSTANT_VALUES,....) WITHIN GROUP (ORDER BY COL1, COL2)
--B. RANK() OVER (PARTITION BY department_id
-- ################################################################
--A. RANK(3000) WITHIN GROUP (ORDER BY sal)
-- WE GET SINGLE RECORD 
-- IN EMP.SAL THE FIRST 3000 RANK IS RETURN BY THE RANK(3000) WITHIN GROUP(ORDER BY SAL)
--RANK(3000) WITHIN GROUP (ORDER BY sal) WITH THIS WE CAN'T PRESENT OTHER COLUMNS
--RANK(3000) WITHIN GROUP (ORDER BY sal) WE CAN PASS COLUMN VALUES AS IT EXPECT ONLY CONSTANT VALUES
-- ################################################################
SELECT    
    RANK(3000) WITHIN GROUP(ORDER BY SAL)
FROM EMP ORDER BY SAL;
-- ################################################################
--RANK(3000)WITHINGROUP(ORDERBYSAL)
-----------------------------------
--                               12
-- ################################################################

-- ################################################################
-- USING DENSE_RANK
--A. DENSE_RANK(CONSTANT_VALUES,CONSTANT_VALUES,....) WITHIN GROUP (ORDER BY COL1, COL2)
--B. DENSE_RANK() OVER (PARTITION BY department_id)
-- ################################################################
--A. RANK(CONSTANT_VALUES,CONSTANT_VALUES,....) WITHIN GROUP (ORDER BY COL1, COL2)
-- ################################################################
SELECT    
    DENSE_RANK(3000) WITHIN GROUP(ORDER BY SAL)
FROM EMP ORDER BY SAL;
-- ################################################################
--B. DENSE_RANK() OVER (PARTITION BY department_id)
-- ################################################################
SELECT    
    EMPNO,ENAME,DEPTNO,SAL, 
    DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL)
FROM EMP ORDER BY DEPTNO,SAL;


SELECT    
    EMPNO,ENAME,DEPTNO,SAL, 
    ROW_NUMBER() OVER(PARTITION BY DEPTNO ORDER BY SAL),
    RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL),
    DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL)
FROM EMP ORDER BY DEPTNO,SAL;


-- ################################################################
-- USING RANK ()
--A. RANK(CONSTANT_VALUES,CONSTANT_VALUES,....) WITHIN GROUP (ORDER BY COL1, COL2)
--B. RANK() OVER (PARTITION BY department_id
-- ################################################################
--A. RANK(3000) WITHIN GROUP (ORDER BY sal)
-- WE GET SINGLE RECORD 
-- IN EMP.SAL THE FIRST 3000 RANK IS RETURN BY THE RANK(3000) WITHIN GROUP(ORDER BY SAL)
--RANK(3000) WITHIN GROUP (ORDER BY sal) WITH THIS WE CAN'T PRESENT OTHER COLUMNS
--RANK(3000) WITHIN GROUP (ORDER BY sal) WE CAN PASS COLUMN VALUES AS IT EXPECT ONLY CONSTANT VALUES
-- ################################################################
SELECT    
    RANK(3000) WITHIN GROUP(ORDER BY SAL)
FROM EMP ORDER BY SAL;
-- ################################################################
--RANK(3000)WITHINGROUP(ORDERBYSAL)
-----------------------------------
--                               12
-- ################################################################
-- ################################################################	 	
-- The following example returns, within each department of the sample table hr.employees, 
-- the minimum salary among the employees who make the lowest commission and the maximum 
-- salary among the employees who make the highest commission:
-- ################################################################	 
SELECT department_id,
MIN(salary) KEEP (DENSE_RANK FIRST ORDER BY commission_pct) "LOW",
MAX(salary) KEEP (DENSE_RANK LAST ORDER BY commission_pct) "MAX"
   FROM employees
   GROUP BY department_id;

-- ################################################################	  
-- TO_CHAR() : 'MM' OR 'MM:YY'
--List all employees join in dec 81 and working for dept 30 as CLERK as 
--per the highest to lowest salary
-- ################################################################	 
SELECT
    empno,ename,deptno,hiredate
FROM
    EMP
    WHERE 
        TO_CHAR(HIREDATE,'MM')='12'
        AND
            TO_CHAR(HIREDATE,'YY')='81'
        AND
            DEPTNO=30 
            AND 
                JOB='CLERK';
    

SELECT
    empno,ename,deptno,hiredate
FROM
    EMP
    WHERE 
        HIREDATE LIKE '%-DEC-81'
        AND
            DEPTNO=30 
            AND 
                JOB='CLERK';
    
-- ################################################################	 
-- List all emp who have joined in same month and year with martin 
-- ################################################################	 
SELECT * FROM EMP 
    WHERE 
    TO_CHAR(HIREDATE,'MM:YY')=(SELECT TO_CHAR(HIREDATE,'MM:YY') FROM EMP WHERE ename='MARTIN')







