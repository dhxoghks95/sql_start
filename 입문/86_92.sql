UPDATE emp
    SET sal = (SELECT sal  
                FROM emp
                WHERE ename = 'ALLEN')
WHERE job = 'SALESMAN';

ROLLBACK;

DELETE FROM emp WHERE sal > (SELECT sal
                                FROM emp
                                WHERE ename = 'SCOTT');
                                
ROLLBACK;

ALTER TABLE dept
    ADD sumsal number(10);

MERGE INTO dept d
USING (SELECT deptno, sum(sal) sumsal
        FROM emp
        GROUP BY deptno) v
ON (d.deptno = v.deptno)
WHEN MATCHED THEN
UPDATE set d.sumsal = v.sumsal;

SELECT rpad(' ', level * 3) || ename as employee, level, sal, job
    FROM emp
    START WITH ename = 'KING'
    CONNECT BY prior empno = mgr;
    
SELECT rpad(' ', level * 3) || ename as employee, level, sal, job
    FROM emp
    START WITH ename = 'KING'
    CONNECT BY prior empno = mgr AND ename != 'BLACKE';
    
SELECT rpad(' ', level * 3) || ename as employee, level, sal, job
    FROM emp
    START WITH ename = 'KING'
    CONNECT BY prior empno = mgr
    ORDER SIBLINGS BY sal desc;
    
SELECT rpad(' ', level * 3) || ename as employee, level, sal, job
    FROM emp
    START WITH ename = 'KING'
    CONNECT BY prior empno = mgr
    ORDER BY sal desc;
    
SELECT ename, SYS_CONNECT_BY_PATH(ename, '/') as path
    FROM emp
    START WITH ename = 'KING'
    CONNECT BY prior empno = mgr;
    
SELECT ename, LTRIM(SYS_CONNECT_BY_PATH(ename, '/'), '/') as path
    FROM emp
    START WITH ename = 'KING'
    CONNECT BY prior empno = mgr;    
