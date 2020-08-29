CREATE GLOBAL TEMPORARY TABLE EMP37
    (EMPNO NUMBER(10),
     ENAME VARCHAR2(10),
     SAL NUMBER(10))
     ON COMMIT DELETE ROWS;
     
    insert into emp37 values(1111, 'scott', 3000);
    
    insert into emp37 values(2222, 'smith', 4000);
    
select * from emp37;

commit;

select * from emp37;

CREATE VIEW EMP_VIEW
AS
SELECT empno, ename, sal, job, deptno
    FROM emp
    WHERE job = 'SALESMAN';
    
SELECT * FROM emp_view;

CREATE VIEW EMP_VIEW2
AS
SELECT deptno, round(avg(sal)) Æò±Õ¿ù±Þ
    FROM emp
    GROUP BY deptno;
    
SELECT * FROM emp_view2;

CREATE INDEX EMP_SAL
    ON EMP(sal);
    
CREATE SEQUENCE SEQ1
START WITH 1
INCREMENT BY 1
MAXVALUE 100
NOCYCLE;

SELECT max(empno)
    FROM emp;
    