SELECT MOD(10, 3)
    FROM dual;
    
SELECT empno, MOD(empno, 2)
    FROM emp;
    
SELECT empno, ename
    FROM emp
    WHERE MOD(empno, 2) = 0;
    
SELECT FLOOR(10/3)
    FROM dual;
    
SELECT ename, MONTHS_BETWEEN(sysdate, hiredate)
    FROM emp;
    
SELECT TO_DATE('2019-06-01', 'RRRR-MM-DD') - TO_DATE('2018-10-01', 'RRRR-MM-DD') FROM DUAL;

SELECT ROUND((TO_DATE('2019-06-01', 'RRRR-MM-DD') - TO_DATE('2018-10-01', 'RRRR-MM-DD')) / 7) AS 총주수
    FROM DUAL;

SELECT ADD_MONTHS(TO_DATE('2019-05-01', 'RRRR-MM-DD'), 100) FROM dual;

SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + 100 FROM dual;

SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + interval '100' month FROM dUAL;

SELECT '2019/05/22' as 날짜, NEXT_DAY('2019/05/22', '월요일') FROM dual;

SELECT ename, TO_CHAR(hiredate, 'DAY') as 요일, TO_CHAR(sal, '999,999') as 월급
    FROM emp
    WHERE ename = 'SCOTT';
    
    
SELECT ename, hiredate
    FROM emp
    WHERE hiredate = TO_DATE('81/11/17', 'RR/MM/DD');