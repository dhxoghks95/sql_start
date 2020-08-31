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
 
WITH JOB_SUMSAL AS (SELECT JOB, SUM(SAL) as ��Ż
                                    FROM emp
                                    GROUP BY JOB)
    SELECT JOB, ��Ż
        FROM JOB_SUMSAL
        WHERE ��Ż > (SELECT AVG(��Ż)
                            FROM JOB_SUMSAL);
                            
WITH JOB_SUMSAL AS (SELECT JOB, SUM(SAL) ��Ż
                            FROM EMP
                            GROUP BY JOB) ,
    DEPTNO_SUMSAL AS (SELECT DEPTNO, SUM(SAL) ��Ż
                            FROM emp
                            GROUP BY DEPTNO
                            HAVING SUM(SAL) > (SELECT AVG(��Ż) + 3000
                                                FROM JOB_SUMSAL)
                            )
    SELECT DEPTNO, ��Ż
        FROM DEPTNO_SUMSAL;
        
WITH LOOP_TABLE as (SELECT LEVEL as NUM
                        FROM DUAL
                        CONNECT BY LEVEL <= 9)
    SELECT '2' || ' x ' || NUM || '=' || 2 * NUM AS "2��"
        FROM LOOP_TABLE;
        
WITH LOOP_TABLE as (SELECT LEVEL as NUM
                        FROM DUAL
                        CONNECT BY LEVEL <= 9),
     GUGU_TABLE as (SELECT LEVEL + 1 as GUGU
                        FROM DUAL
                        CONNECT BY LEVEL  <=8)
    SELECT TO_CHAR(A.NUM) || 'x' || TO_CHAR(B.GUGU) || '=' || A.NUM * B.GUGU as ������
        FROM LOOP_TABLE A, GUGU_TABLE B;
        
WITH LOOP_TABLE as (SELECT LEVEL as NUM
                        FROM DUAL
                        CONNECT BY LEVEL <= 10)
    SELECT LPAD('*', NUM, '*') as STAR
        FROM LOOP_TABLE;

WITH LOOP_TABLE as (SELECT LEVEL as NUM
                        FROM DUAL
                        CONNECT BY LEVEL <= 8)
    SELECT LPAD(' ', 10 - NUM, ' ') || LPAD('*', NUM, '*')  as �ﰢ��
        FROM LOOP_TABLE;
        
undefine p_num
ACCEPT p_num prompt '�����Է� : '

SELECT lpad( ' ',  &p_num-level, ' ') || rpad('��',  level, '��')  as star
  FROM dual
  CONNECT BY level <&p_num+1
UNION ALL
SELECT lpad( ' ',  level, ' ') || rpad('��',  (&p_num)-level, '��')  as star
  FROM dual
  CONNECT BY level < &p_num ;
