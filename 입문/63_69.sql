SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as 부서위치
    FROM emp e join dept d
    USING (deptno)
    WHERE e.job = 'SALESMAN';
    
SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as 부서위치
    FROM emp e natural join dept d
    WHERE e.job = 'SALESMAN';
    
SELECT e.ename as 이름, e.job as 월급, d.loc as 부서위치
    FROM emp e natural join dept d
    WHERE e.job = 'SALESMAN' and deptno = 30;
    
SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as 부서위치
    FROM emp e RIGHT OUTER JOIN dept d
    ON (e.deptno = d.deptno);
    
SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as 부서위치
    FROM emp e LEFT OUTER JOIN dept d
    ON (e.deptno = d.deptno);
    
SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as 부서위치
    FROM emp e FULL OUTER JOIN dept d
    ON (e.deptno = d.deptno);
    
SELECT deptno, sum(sal)
    FROM emp
    GROUP BY deptno
UNION ALL
SELECT TO_NUMBER(null) as deptno, sum(sal) 
    FROM emp;
    
SELECT deptno, sum(sal)
    FROM emp
    GROUP BY deptno
UNION
SELECT null as deptno, sum(sal)
    FROM emp;
    
SELECT ename, sal, job, deptno
    FROM emp
    WHERE deptno in (10,20)
INTERSECT
SELECT ename, sal, job, deptno
    FROM emp
    WHERE deptno in (20,30);