SELECT ename || sal
    FROM emp;

SELECT ename || '의 월급은' || sal || '원 입니다.' as 월급정보
    FROM emp;
    
SELECT ename || '의 직업은' || job || '입니다.' as 직업정보
    FROM emp;
    
SELECT DISTINCT job
    FROM emp;
    
SELECT UNIQUE job
    FROM emp;
    
SELECT ename, sal
    FROM emp
    ORDER BY sal ASC;
    
SELECT ename, sal as 월급
    FROM emp
    ORDER BY 월급 ASC;
    
SELECT ename, deptno, sal
    FROM emp
    ORDER BY deptno asc, sal DESC;
    
SELECT ename, deptno, sal
    FROM emp
    ORDER BY 2 asc, 3 desc;
    
SELECT ename, sal, job
    FROM emp
    WHERE sal = 3000;
    
SELECT ename as 이름, sal as 월급
    FROM emp
    WHERE sal >= 3000;
    
SELECT ename, sal, job, hiredate, deptno
    FROM emp
    WHERE ename = 'SCOTT';
    
SELECT ename, hiredate
    FROM emp
    WHERE hiredate = '81/11/17';
    
SELECT *
    FROM nls_session_parameters
    WHERE parameter = 'NLS_DATE_FORMAT';
    
SELECT ename, sal * 12 as 연봉
    fROM emp
    WHERE sal * 12 >= 36000;
    
SELECT ename, sal, job, deptno
    FROM emp
    WHERE sal <= 1200;