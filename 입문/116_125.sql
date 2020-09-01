undefine p_n1
undefine p_n2
ACCEPT p_n1 prompt '가로 숫자를 입력하세요~';
ACCEPT p_n2 prompt '세로 숫자를 입력하세요~';

WITH LOOP_TABLE as (SELECT LEVEL as NUM
                        FROM DUAL
                        CONNECT BY LEVEL <= &p_n2)
        SELECT LPAD('*', &p_n1, '*') as Square
            FROM LOOP_TABLE;
            
undefine p_n
ACCEPT p_n prompt '숫자에 대한 값 입력 : ~"

SELECT SUM(LEVEL) as 합계
    FROM DUAL
    CONNECT BY LEVEL <= &p_n
    
undefine p_n
ACCEPT p_n prompt '숫자에 대한 값 입력 : ~"
SELECT ROUND(EXP(SUM(LN(LEVEL)))) 곱
    FROM DUAL
    CONNECT BY LEVEL <= &p_n;
    
undefine p_n
ACCEPT p_n prompt '숫자에 대한 값 입력 : ~"
SELECT LEVEL as 짝수
    FROM DUAL
    WHERE MOD(LEVEL, 2) = 0
    CONNECT BY LEVEL <= &p_n;
    
undefine p_n
ACCEPT p_n prompt '숫자에 대한 값 입력 : ~"

WITH LOOP_TABLE as (SELECT LEVEL AS NUM
                        FROM DUAL
                        CONNECT BY LEVEL <= &p_n)
                        
SELECT L1.NUM as 소수
    FROM LOOP_TABLE L1, LOOP_TABLE L2
    WHERE MOD(L1.NUM, L2.NUM) = 0
    GROUP BY L1.NUM
    HAVING COUNT(L1.NUM) = 2;
    
    
ACCEPT p_n1 prompt '첫 번째 숫자를 입력하세요~';
ACCEPT p_n2 prompt '두 번째 숫자를 입력하세요~';

WITH NUM_D AS(SELECT &p_n1 as NUM1, &p_n2 as NUM2
                    FROM DUAL)
SELECT MAX(LEVEL) AS "최대공약수"
    FROM NUM_D
    WHERE MOD(NUM1, LEVEL) = 0
        AND MOD(NUM2, LEVEL) = 0
    CONNECT BY LEVEL <= NUM2;


ACCEPT p_n1 prompt '첫 번째 숫자를 입력하세요~';
ACCEPT p_n2 prompt '두 번째 숫자를 입력하세요~';

WITH NUM_D AS(SELECT &p_n1 as NUM1, &p_n2 as NUM2
                    FROM DUAL)
                    
SELECT NUM1, NUM2,
    (NUM1/MAX(LEVEL)) * (NUM2/MAX(LEVEL)) * MAX(LEVEL) AS "최소공배수"
    FROM NUM_D
    WHERE MOD(NUM1, LEVEL) = 0
        AND MOD(NUM2, LEVEL) = 0
    CONNECT  BY LEVEL <= NUM2;
    
ACCEPT p_n1 prompt '밑변의 길이를 입력하세요~';
ACCEPT p_n2 prompt '높이를 입력하세요~';
ACCEPT p_n3 prompt '빗변의 길이를 입력하세요~';

SELECT CASE WHEN
    ( POWER(&p_n1, 2) + POWER(&p_n2, 2) ) = POWER(&p_n3, 2)
            THEN '직각삼각형이 맞습니다'
            ELSE '직각삼각형이 아닙니다' END AS "피타고라스의 정리"
    FROM DUAL;
    
SELECT SUM(CASE WHEN (POWER(NUM1,2) + POWER(NUM2,2)) <= 1  THEN 1
                ELSE 0 END ) / 100000 * 4 as "원주율"
 FROM ( 
           SELECT DBMS_RANDOM.VALUE(0,1) AS NUM1,
                  DBMS_RANDOM.VALUE(0,1) AS NUM2
             FROM DUAL
             CONNECT BY LEVEL < 100000
        ) ; 
        
WITH LOOP_TABLE AS ( SELECT LEVEL  AS NUM 
                                  FROM DUAL 
                                  CONNECT BY LEVEL <= 1000000
                     ) 
SELECT RESULT
  FROM ( 
           SELECT NUM, POWER( (1 + 1/NUM) ,NUM) AS RESULT
             FROM LOOP_TABLE
                )
  WHERE NUM = 1000000;
