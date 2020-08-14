SELECT ename, sal
    FROM emp
    WHERE sal = '3000';
    
CREATE TABLE EMP32
(ENAME VARCHAR2(10),
SAL VARCHAR2(10));

INSERT INTO EMP32 VALUES('SCOTT', '3000');
INSERT INTO EMP32 VALUES('SMITH', '1200');

SELECT ename, sal
    FROM emp32
    WHERE sal = '3000';
    
SELECT ename, comm, NVL(comm, 0)
    FROM emp;
    
SELECT ename, sal, comm, sal+comm
    FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST');
    
SELECT ename, sal, comm, sal + comm
    FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST');
    
SELECT ename, sal, comm, NVL(comm, 0), sal + NVL(comm,0)
    FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST');
    
SELECT ename, sal, comm, NVL2(comm, sal+comm, sal)
    FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST');

SELECT ename, deptno, DECODE(deptno, 10, 300, 20, 400, 0) as 보너스
    FROM emp;
    
SELECT empno, mod(empno,2), DECODE(mod(empno, 2), 0, '짝수', 1, '홀수') as 보너스
    FROM emp;
    
SELECT ename, job, DECODE(job, 'SALESMAN', 5000, 2000) as 보너스
    FROM emp;
    
SELECT ename, job, sal, CASE WHEN sal >= 3000 THEN 500
                        WHEN sal >= 2000 THEN 300
                        WHEN sal >= 1000 THEN 200
                        ELSE 0 END as BONUS
    FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST');
    
SELECT ename, job, comm, CASE WHEN comm is null THEN 500
                         ELSE 0 END as BONUS
    FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST');
    
SELECT ename, CASE WHEN job in ('SALESMAN', 'ANALYST') THEN 500
              WHEN job in ('CLERK', 'MANAGER') THEN 400
              ELSE 0 END as BONUS
    FROM emp;
    

SELECT MAX(sal)
    FROM emp;
    
SELECT MAX(sal)
    FROM emp
    WHERE job = 'SALESMAN';
    
SELECT job, MAX(sal)
    FROM emp
    WHERE job = 'SALESMAN'
    GROUP BY job;
    
SELECT deptno, MAX(sal)
    FROM emp
    GROUP BY deptno;
    
SELECT MIN(sal)
    FROM emp
    WHERE job = 'SALESMAN';
    
SELECT job, MIN(sal) 최소값
    FROM emp
    GROUP BY job
    ORDER BY 최소값 desc;
    
SELECT MIN(sal)
    FROM emp
    WHERE 1=2;
    
SELECT job, MIN(sal)
    FROM emp
    WHERE job != 'SALESMAN'
    GROUP BY job
    ORDER BY MIN(sal) desc;
    
SELECT AVG(comm)
    FROM emp;
    
SELECT ROUND(AVG(NVL(comm, 0)))
    FROM emp;
    
SELECT deptno, SUM(sal)
    FROM emp
    GROUP BY deptno;
    
SELECT job, SUM(sal)
    FROM emp
    GROUP BY job
    ORDER BY sum(sal) desc;
    
SELECT job, SUM(sal)
    FROM emp
    GROUP BY job
    HAVING SUM(sal) >= 4000;
    
SELECT COUNT(empno)
    FROM emp;
    
SELECT COUNT(comm)
    FROM emp;
    
    