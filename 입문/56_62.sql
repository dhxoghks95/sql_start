SELECT ROWNUM, empno, ename, job, sal
    From emp
    WHERE ROWNUM <= 5;
    
SELECT empno, ename, job, sal
    FROM emp
    ORDER BY sal DESC FETCH FIRST 4 ROWS ONLY;
    
SELECT empno, ename, job, sal
    FROM emp
    ORDER BY sal desc
    FETCH FIRST 20 PERCENT ROWS ONLY;
    
SELECT empno, ename, job, sal
    FROM emp
    ORDER BY sal DESC FETCH FIRST 2 ROWS WITH TIES;
    
SELECT empno, ename, job, sal
    FROM emp
    ORDER BY sal DESC OFFSET 9 ROWS;
    
SELECT empno, ename, job, sal
    FROM emp
    ORDER BY sal DESC OFFSET 9 ROWS
    FETCH FIRST 2 ROWS ONLY;
    
SELECT ename ,loc
    FROM emp, dept
    WHERE emp.deptno = dept.deptno;
    
SELECT ename, loc
    FROM emp, dept;
    
SELECT ename, loc
    FROM emp, dept
    WHERE emp.deptno = dept.deptno;
    
SELECT ename, loc, job
    FROM emp, dept
    WHERE emp.deptno = dept.deptno and emp.job = 'ANALYST';
    
SELECT ename, loc, job, deptno
    FROM emp, dept
    WHERE emp.deptno = dept.deptno and emp.job = 'ANALYST';
    
SELECT ename, loc, job, emp.deptno
    FROM emp, dept
    WHERE emp.deptno = dept.deptno and emp.job = 'ANALYST';
    
SELECT emp.ename, dept.loc, emp.job
    FROM emp, dept
    WHERE emp.deptno = dept.deptno and emp.job = 'ANALYST';
    
SELECT e.ename, d.loc, e.job
    FROM emp e, dept d
    WHERE e.deptno = d.deptno and e.job = 'ANALYST';
    
SELECT e.ename, e.sal, s.grade
    FROM emp e, salgrade s
    WHERE e.sal between s.losal and s.hisal;
    
SELECT e.ename, e.sal, s.grade
    FROM emp e, salgrade s
    WHERE e.sal between s.losal and s.hisal;
    
SELECT e.ename, d.loc
    FROM emp e, dept d
    WHERE e.deptno (+) = d.deptno;
    
SELECT e.ename as 사원, e.job as 직업, m.ename as 관리자, m.job as 직업
    FROM emp e, emp m
    WHERE e.mgr = m.empno and e.job = 'SALESMAN';
    
SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as "부서 위치"
    FROM emp e JOIN dept d
    ON (e.deptno = d.deptno)
    WHERE e.job = 'SALESMAN';
    



