UPDATE emp
    SET sal = 3200
    WHERE ename = 'SCOTT';
    
DELETE FROM emp
    WHERE ename = 'SCOTT';
    
ROLLBACK;

INSERT INTO emp(empno, ename, sal ,deptno)
    VALUES(1122, 'JACK', 3000, 20) ;

COMMIT;

UPDATE emp
    SET sal = 4000
    WHERE ename = 'SCOTT';
    
ROLLBACK;

ALTER TABLE emp
    ADD loc varchar2(10);

MERGE INTO emp e
USING dept d
ON (e.deptno = d.deptno)
WHEN MATCHED THEN
UPDATE set e.loc = d.loc
WHEN NOT MATCHED THEN
INSERT (e.empno, e.deptno, e.loc) VALUES (1111, d.deptno, d.loc) ;

CREATE TABLE emp2
    as
        SELECT *
            FROM emp
            WHERE 1 = 2;

INSERT INTO emp2(empno, ename, sal, deptno)
    SELECT empno, ename, sal, deptno
    FROM emp
    WHERE deptno = 10;
    
