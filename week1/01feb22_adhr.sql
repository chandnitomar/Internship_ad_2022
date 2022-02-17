SELECT
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno=10;

*******************************************************************************
--dept 10 or 20
SELECT
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno=10 or deptno=20;

--other way using IN
SELECT
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno IN (10,20);
*******************************************************************************    
--Not working in dept 10 or 20
SELECT
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno NOT IN (10,20);

*******************************************************************************
--NOt working in any department
SELECT
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno NOT IN (10,20,30);
    --Does not give any record as we are comparing values from LIST (10,20,30)
    
SELECT
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno IS NULL;

*******************************************************************************
--From dep 30 and earning some commission
SELECT
    empno,ename, comm, deptno
FROM
    emp 
WHERE   
    deptno = 30 AND comm IS NOT NULL AND comm > 0
ORDER BY
    comm;

*******************************************************************************

--Not earning any commision
SELECT
    empno,ename, comm, deptno
FROM
    emp 
WHERE   
    comm IS NULL OR comm = 0
ORDER BY
    comm;
    
    
********************************************************************************
--Earning salary[1000, 3000]
SELECT
    empno, ename, sal
FROM 
    emp
WHERE
    sal>=1000 AND sal<=3000
ORDER BY
    sal;

--Using BETWEEN Clause
SELECT
    empno, ename, sal
FROM 
    emp
WHERE
    sal BETWEEN 1000 AND 3000
ORDER BY
    sal;

********************************************************************************
--Not in Range 1000 to 3000
SELECT
    empno, ename, sal
FROM 
    emp
WHERE
    sal NOT BETWEEN 1000 AND 3000
ORDER BY
    sal;
    
********************************************************************************
--Earning exactly 5000
SELECT 
    empno,ename, sal
FROM
    emp
WHERE
    sal = 5000;
--earning sal!=5000
SELECT 
    empno,ename, sal
FROM
    emp
WHERE
    sal <> 5000
ORDER BY
    sal;
    
*******************************************************************************
--WHERE with ESCAPE clause
--In oracle data is case sensitive

--display all details of "SMITH"
SELECT 
    empno,ename
FROM
    emp
WHERE
    ename = 'SMITH';
    
--BEGINS WITH   'S%'
--ENDS WITH     '%S'
--CONTAINS      '%LL%'
--Single character  '_MITH'    _ is placeholder

--Display details whose name starts with S
SELECT 
    empno,ename
FROM
    emp
WHERE
    ename LIKE 'S%';


--Whose name contains an underscore
SELECT 
    empno,ename
FROM
    emp
WHERE
    ename LIKE '%\_%'; 
    ----above query tries to find name that has \ in it hence no record is displayed
    
SELECT 
    empno,ename
FROM
    emp
WHERE
    ename LIKE '%_%'; 
    -----avove query prints all the records cz "ANYTHING SINGLECHARACTER ANYTHING" satisfies all the names in ename column

SELECT 
    empno,ename
FROM
    emp
WHERE
    ename LIKE '%\_%' ESCAPE '\';
    ----this will correctly give the records that contain undersci=ore in the ename
    
*******************************************************************************************
--

SELECT
    COUNT(*), COUNT(empno), COUNT(deptno)
FROM   
    emp;

--Dsiplay MAX MIN salries

SELECT
    MIN(sal), MAX(sal),COUNT(sal), SUM(sal), AVG(sal)
FROM    
    emp;
    
******************************************************************************
--AGGREGATE functions with Grouping clause - GROUP BY
SELECT
    deptno, COUNT(empno)
FROM 
    emp
GROUP BY
    deptno
ORDER BY
    deptno;

--Display jobwise count 
    SELECT 
        job, COUNT (empno)
    FROM
        emp
    GROUP BY
        job
    ORDER BY
        COUNT(empno);
        
--Department wise MAX MIN AVG salaries
SELECT
    deptno, MAX(sal), MIN(sal), round(AVG(sal),2)
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno;

--Department wise MAX MIN AVG salaries having avg sal<2500
SELECT
    deptno, MAX(sal), MIN(sal), round(AVG(sal),2)
FROM
    emp
GROUP BY
    deptno
Having 
    avg(sal)<2500
ORDER BY
    deptno;
************************************************************************************
--Special Functions
-- 16. Special functions nvl() 
-- If comm is null display 0
-- Display empno,ename,sal,comm and total sal=sal+comm for all employees 
--for calculation purpose we can give some default values to null values
--nvl : null value replacement

SELECT 
    empno, ename, sal, comm, sal+comm "Total", sal+nvl(comm,0) "Total(right)"
FROM
    emp
ORDER BY
    comm;



--if comm is 0 or null then comm = 100
--if comm > 0 then comm =comm
SELECT 
    empno, ename, sal, comm, 
    case
        when comm = 0 or comm IS NULL
            then 100
        when comm>0
            then comm
    end as UPDATED_Commission,
    
    sal +  case
        when comm = 0 or comm IS NULL
            then 100
        when comm>0
            then comm
    end as Total_Commission
FROM
    emp
ORDER BY
    comm;
************************************************************************************
--Distinct Values

SELECT 
    distinct(ename)
FROM
    emp;



***********************************************************************************
--SUB QUERY

--Inner query
--Outer query depends on the result of inner query
--Display the employees empno, ename and sal who are earning more than avg(sal)
        --1.Display ename, empno and sal
SELECT
    empno, ename,sal, 
FROM
    emp;
    --2. Display Avg salary
SELECT
    AVG(sal)
FROM
    emp;
    -- 3. sal>avg(sal) final solution

SELECT 
    empno,ename,sal
FROM 
    emp
WHERE
    sal>(
    SELECT 
        AVG(sal)
    FROM 
    emp
    );

*************************************************************************************
--Display empno, ename, deptno, for all employees working in "ACCOUNTING"
-- 1.
    SELECT 
        empno,ename,deptno
    from 
        emp;
-- 2. 
    SELECT 
        deptno
    FROM
        dept
    WHERE
        dname='ACCOUNTING';

-- 3. Final Query
    SELECT 
        empno,ename,deptno
    FROM
        emp
    WHERE
        deptno=(
        SELECT 
        deptno
    FROM
        dept
    WHERE
        dname='ACCOUNTING'
        );

--Display empno,ename,deptno for all employees from department having employee earning max salary



    