SELECT ename, job, sal, RANK() over (ORDER BY sal DESC) 순위
    FROM emp
    WHERE job in ('ANALYST', 'MANAGER');
    
SELECT job ename, sal, DENSE_RANK() over (PARTITION BY job
                                          ORDER BY sal DESC) 순위
    FROM emp
    WHERE hiredate BETWEEN to_date('1981/01/01', 'RRRR/MM/DD')
                       AND to_date('1981/12/31', 'RRRR/MM/DD');
                       
SELECT DENSE_RANK(2975) within group (ORDER BY sal DESC) 순위
    FROM emp;
    
SELECT ename, job, sal,
            NTILE(4) over (order by sal desc nulls last) 등급
        FROM emp
        WHERE job in ('ANALYST' , 'MANAGER', 'CLERK');
        
SELECT ename, sal, RANK() over (order by sal desc) as RANK,
                   DENSE_RANK() over (order by sal desc) as DENSE_RANK,
                   CUME_DIST()  over (order by sal desc) as CUM_DIST
        FROM emp;
        
SELECT job, ename, sal, RANK() over (partition by job
                                     order by sal desc) as RANK,
                        CUME_DIST() over (partition by job
                                          order by sal desc) as CUM_DIST
        FROM emp;
        
SELECT deptno, LISTAGG(ename, ',') within group (order by ename) as EMPLOYEE
    FROM emp
    GROUP BY deptno;
    
SELECT job, LISTAGG(ename, ',') within group (order by ename) as EMPLOYEE
    FROM emp
    GROUP BY job;
    
SELECT deptno, 
LISTAGG(ename||'('||sal||')', ',') within group (order by ename) as EMPLOYEE
    FROM emp
    GROUP BY deptno;
    
SELECT empno, ename, sal,
    LAG(sal, 1) over (order by sal asc) "전 행",
    LEAD(sal, 1) over (order by sal asc) "다음 행"
FROM emp
WHERE job in  ('ANALYST', 'MANAGER');

SELECT empno, ename, hiredate,
                LAG(hiredate, 1) over (order by hiredate asc) "전 행",
                LEAD(hiredate,1) over (order by hiredate asc) "다음 행"
    FROM emp
    WHERE job in ('ANALYST', 'MANAGER');
    
SELECT deptno, empno, ename, hiredate,
            LAG(hiredate, 1) over (partition by deptno
                                   order by hiredate asc) "전 행",
            LEAD(hiredate, 1) over (PARTITION by deptno
                                    order by hiredate asc) "다음 행"
        FROM emp;
        
SELECT SUM(DECODE(deptno, 10, sal)) as "10",
       SUM(DECODE(deptno, 20, sal)) as "20",
       SUM(DECODE(deptno, 30, sal)) as "30"
    FROM emp;
    
SELECT SUM(DECODE(job, 'ANALYST', sal)) as "ANALYST",
       SUM(DECODE(job, 'SALESMAN', sal)) as "SALESMAN"
    FROM emp;
    
SELECT deptno, SUM(DECODE(job, 'ANALYST', sal)) as "ANALYST",
       SUM(DECODE(job, 'SALESMAN', sal)) as "SALESMAN"
    FROM emp
    GROUP by deptno;
    
    
SELECT *
    FROM(SELECT deptno, sal from emp)
    PIVOT(sum(sal) for deptno in (10,20,30));
    
SELECT *
    FROM (SELECT job, sal from emp)
    PIVOT (sum(sal) for job in ('ANALYST', 'CLERK', 'MANAGER', 'SALESMAN'));
    
SELECT *
    FROM (select job, sal from emp)
    PIVOT (sum(sal) for job in ('ANALYST' as "ANALYST", 'CLERK' as "CLERK",
                                'MANAGER' as "MANAGER", 'SALESMAN' as "SALESMAN"));
    