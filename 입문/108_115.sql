CREATE TABLE DEPT7
(DEPTNO NUMBER(10) CONSTRAINT DEPT7_DEPTNO_PK PRIMARY KEY,
 DNAME VARCHAR2(14),
 LOC VARCHAR2(10));
 
CREATE TABLE EMP7
(EMPNO NUMBER(10),
 ENAME VARCHAR2(20),
 SAL NUMBER(10),
 DEPTNO NUMBER(10)
 CONSTRAINT EMP7_DEPTNO_FK REFERENCES DEPT7(DEPTNO));
 
WITH JOB_SUMSAL AS (SELECT JOB, SUM(SAL) as ≈‰≈ª
                                    FROM emp
                                    GROUP BY JOB)
    SELECT JOB, ≈‰≈ª
        FROM JOB_SUMSAL
        WHERE ≈‰≈ª > (SELECT AVG(≈‰≈ª)
                            FROM JOB_SUMSAL);
                            
WITH JOB_SUMSAL AS (SELECT JOB, SUM(SAL) ≈‰≈ª
                            FROM EMP
                            GROUP BY JOB) ,
    DEPTNO_SUMSAL AS (SELECT DEPTNO, SUM(SAL) ≈‰≈ª
                            FROM emp
                            GROUP BY DEPTNO
                            HAVING SUM(SAL) > (SELECT AVG(≈‰≈ª) + 3000
                                                FROM JOB_SUMSAL)
                            )
    SELECT DEPTNO, ≈‰≈ª
        FROM DEPTNO_SUMSAL;
        
WITH LOOP_TABLE as (SELECT LEVEL as NUM
                        FROM DUAL
                        CONNECT BY LEVEL <= 9)
    SELECT '2' || ' x ' || NUM || '=' || 2 * NUM AS "2¥‹"
        FROM LOOP_TABLE;
        
WITH LOOP_TABLE as (SELECT LEVEL as NUM
                        FROM DUAL
                        CONNECT BY LEVEL <= 9),
     GUGU_TABLE as (SELECT LEVEL + 1 as GUGU
                        FROM DUAL
                        CONNECT BY LEVEL  <=8)
    SELECT TO_CHAR(A.NUM) || 'x' || TO_CHAR(B.GUGU) || '=' || A.NUM * B.GUGU as ±∏±∏¥‹
        FROM LOOP_TABLE A, GUGU_TABLE B;
        
WITH LOOP_TABLE as (SELECT LEVEL as NUM
                        FROM DUAL
                        CONNECT BY LEVEL <= 10)
    SELECT LPAD('*', NUM, '*') as STAR
        FROM LOOP_TABLE;

WITH LOOP_TABLE as (SELECT LEVEL as NUM
                        FROM DUAL
                        CONNECT BY LEVEL <= 8)
    SELECT LPAD(' ', 10 - NUM, ' ') || LPAD('*', NUM, '*')  as ªÔ∞¢«¸
        FROM LOOP_TABLE;
        
undefine p_num
ACCEPT p_num prompt 'º˝¿⁄¿‘∑¬ : '

SELECT lpad( ' ',  &p_num-level, ' ') || rpad('°⁄',  level, '°⁄')  as star
  FROM dual
  CONNECT BY level <&p_num+1
UNION ALL
SELECT lpad( ' ',  level, ' ') || rpad('°⁄',  (&p_num)-level, '°⁄')  as star
  FROM dual
  CONNECT BY level < &p_num ;
