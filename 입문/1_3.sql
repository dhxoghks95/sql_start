SELECT empno, ename, sal
    FROM emp;
    
SELECT *
    FROM emp;
    
SELECT empno as "사원 번호", ename as "사원 이름", sal as "Salary"
    FROM emp;
    
SELECT ename, sal * (12 * 1000) as 월급
     FROM emp;