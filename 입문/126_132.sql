SELECT REGEXP_SUBSTR('I never graduated from college', '[^ ]+', 1, 2) word
    FROM dual;
    
SELECT REGEXP_SUBSTR(lower(speech_text), '[^ ]+', 1, a) word
    FROM speech, ( SELECT level a
                    FROM dual
                    CONNECT BY level <= 52);
                    
SELECT word, count(*)
 FROM (
        SELECT REGEXP_SUBSTR(lower(speech_text), '[^ ]+', 1, a) word
            FROM speech,  ( SELECT level a
                              FROM dual
                              CONNECT BY level <= 52)
         )
 WHERE word is not null
 GROUP BY word
 ORDER BY count(*) desc;

CREATE TABLE POSITIVE (P_TEXT VARCHAR2(2000) );
CREATE TABLE NEGATIVE (P_TEXT VARCHAR2(2000) );

CREATE TABLE CRIME_DAY_UNPIVOT
AS
SELECT *
    FROM CRIME_DAY
    UNPIVOT (CNT FOR DAY_CNT IN(SUN_CNT, MON_CNT, TUE_CNT, WED_CNT, THU_CNT, FRI_CNT, SAT_CNT));
    
SELECT *
FROM(
        SELECT DAY_CNT, CNT, RANK() OVER(ORDER BY CNT DESC) RNK
            FROM CRIME_DAY_UNPIVOT
            WHERE TRIM(CRIME_TYPE) = '절도'
    )
WHERE RNK = 1;


CREATE TABLE UNIVERSITY_FEE
(DIVISION       VARCHAR2(20),
 TYPE           VARCHAR2(20),
 UNIVERSITY     VARCHAR2(60),
 LOC            VARCHAR2(40),
 ADMISSION_CNT  NUMBER(20),
 ADMISSION_FEE   NUMBER(20),
 TUITION_FEE      NUMBER(20) ) ;
 
 
 SELECT *
 FROM (
    SELECT UNIVERSITY, TUITION_FEE,
                RANK() OVER (ORDER BY TUITION_FEE DESC NULLS LAST) 순위
        FROM UNIVERSITY_FEE
    )
WHERE 순위 = 1;

SELECT A_NAME as "상품", A_PRICE as "가격", M_NAME as "매장명"
FROM PRICE
WHERE A_PRICE = (SELECT MAX(A_PRICE)
                    FROM PRICE);
                    
SELECT * 
FROM(
    SELECT c_loc, cnt, rank() over (order by cnt desc) rnk
        FROM crime_loc
        WHERE crime_type = '살인'
        )
WHERE rnk = 1;
 
 
