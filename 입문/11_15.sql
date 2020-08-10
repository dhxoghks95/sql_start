SELECT ename, sal
    FROM emp
    WHERE sal BETWEEN 1000 and 3000;
    
SELECT ename, sal 
    FROM emp
    WHERE ename LIKE 'S%';
    
SELECT ename
    FROM emp
    WHERE ename LIKE '_M%';
    
SELECT ename
    FROM emp
    WHERE ename like '%T';
    
SELECT ename, comm
    FROM emp
    WHERE comm is null;
    
SELECT ename, sal, job
    FROM emp
    WHERE job in ('SALESMAN', 'ANALYST', 'MANAGER');
    
SELECT ename, sal, job
    FROM emp
    WHERE job not in ('SALESMAN', 'ANALYST', 'MANAGER');
    
SELECT ename, sal, job
    FROM emp
    WHERE job = 'SALESMAN' AND sal >= 1200;