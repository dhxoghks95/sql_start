SELECT ename, sal, job, deptno
    FROM emp
    WHERE deptno in (10,20)
MINUS
SELECT ename, sal, job, deptno
    FROM emp
    WHERE deptno in (20,30);
    
SELECT ename, sal
    FROM emp
    WHERE sal > (SELECT sal
                 FROM emp
                 WHERE ename = 'JONES');

SELECT ename, sal
    FROM emp
    WHERE sal > (SELECT sal
                 FROM emp
                 WHERE job = 'SALESMAN');
                 
SELECT ename, sal
    FROM emp
    WHERE sal in (SELECT sal
                 FROM emp
                 WHERE job = 'SALESMAN');
                 
SELECT ename, sal, job
    FROM emp
    WHERE empno not in (SELECT mgr
                            FROM emp
                            WHERE mgr is not null);
                            
SELECT *
    FROM dept d
    WHERE EXISTS (SELECT *
                    FROM emp e
                    WHERE e.deptno = d.deptno);
                    
SELECT *
    FROM dept d
    WHERE NOT EXISTS (SELECT *
                        FROM emp e
                        WHERE e.deptno = d.deptno);
                        
SELECT job, sum(sal)
    FROM emp
    GROUP BY job
    HAVING sum(sal) > (SELECT sum(sal)
                        FROM emp
                        WHERE job = 'SALESMAN');
                        
SELECT v.ename, v.sal, v.����
    FROM (SELECT ename, sal, rank() over (order by sal desc) ����
                FROM emp) v
    WHERE v.���� = 1;
    
SELECT ename, sal, (SELECT max(sal) FROM emp WHERE job = 'SALESMAN') as �ִ����,
                   (SELECT min(sal) FROM emp WHERE job = 'SALESMAN') as �ּҿ���
    FROM emp
    WHERE job = 'SALESMAN';
    
INSERT INTO emp (empno, ename, sal, hiredate, job)
    VALUES(2812, 'JACK', 3500, TO_DATE('2019/06/05', 'RRRR/MM/DD'), 'ANALYST');
    

                            

                 
        