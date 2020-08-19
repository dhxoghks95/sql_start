drop  table order2;

create table order2
( ename  varchar2(10),
  bicycle  number(10),
  camera   number(10),
  notebook  number(10) );

insert  into  order2  values('SMITH', 2,3,1);
insert  into  order2  values('ALLEN',1,2,3 );
insert  into  order2  values('KING',3,2,2 );

commit;


SELECT *
    FROM order2
    UNPIVOT (건수 for 아이템 in (BICYCLE, CAMERA, NOTEBOOK));
    
SELECT *
    FROM order2
    UNPIVOT (건수 for 아이템 in (BICYCLE as 'B', CAMERA as 'C', NOTEBOOK as 'N'));
    
UPDATE ORDER2 SET NOTEBOOK=NULL WHERE ENAME = 'SMITH';

SELECT *
    FROM order2
    UNPIVOT INCLUDE NULLS(건수 for 아이템 in (BICYCLE as 'B', CAMERA as 'C', NOTEBOOK as 'N'));
    
SELECT empno, ename, sal, SUM(SAL) OVER (ORDER BY empno ROWS
                                         BETWEEN UNBOUNDED PRECEDING
                                         AND CURRENT ROW) 누적치
        FROM emp
        WHERE job in ('ANALYST', 'MANAGER');
        
SELECT empno, ename, sal, RATIO_TO_REPORT(sal) OVER () as 비율
    FROM emp
    WHERE deptno = 20;
    
SELECT empno, ename, sal, RATIO_TO_REPORT(sal) OVER () as 비율,
                          SAL/SUM(SAL) OVER () as "비교 비율"
        FROM emp
        WHERE deptno = 20;
        
SELECT job, sum(sal)
    FROM emp
    GROUP BY ROLLUP(job);
    
SELECT deptno, job, sum(sal)
    FROM emp
    GROUP BY ROLLUP(deptno, job);
    
SELECT job, sum(sal)
    FROM emp
    GROUP BY CUBE(job);
    
SELECT deptno, job, sum(sal)
    FROM emp
    GROUP BY CUBE(deptno, job);
    
SELECT deptno, job, sum(sal)
    FROM emp
    GROUP BY GROUPING SETS((deptno), (job), ());
    
SELECT empno, ename, sal, RANK() OVER (ORDER BY sal DESC) RANK,
                        DENSE_RANK() OVER (ORDER BY sal DESC) DENSE_RANK,
                        ROW_NUMBER() OVER (ORDER BY sal DESC) 번호
                        
    FROM emp
    WHERE deptno = 20;
    
SELECT deptno, ename, sal, ROW_NUMBER() OVER(PARTITION BY deptno
                                            ORDER BY sal DESC) 번호
        FROM emp
        WHERE deptno in (10,20);