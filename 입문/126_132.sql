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
 
 SELECT * 
  FROM ( 
      SELECT ACC_LOC_NAME AS 사고장소, ACC_CNT AS 사고건수, 
                DENSE_RANK() OVER (ORDER BY ACC_CNT DESC NULLS LAST) AS 순위
        FROM ACC_LOC_DATA
        WHERE ACC_YEAR=2017
        )
  WHERE 순위 <= 5;
  
  SELECT 년도, 치킨집 as 건수
    FROM CLOSING
    WHERE 치킨집 = (SELECT MAX(치킨집) FROM CLOSING);
    
    
CREATE TABLE WORKING_TIME2
AS
SELECT *
FROM WORKING_TIME
UNPIVOT ( CNT FOR Y_YEAR IN (Y_2014, Y_2015, Y_2016, Y_2017, Y_2018)); 

SELECT COUNTRY, CNT, RANK() over (ORDER BY CNT DESC) 순위
FROM WORKING_TIME2
WHERE Y_YEAR = 'Y_2018';


SELECT DISTINCT(암종), 성별, 환자수
    FROM CANCER
    WHERE 환자수 = (SELECT MAX(환자수) FROM CANCER WHERE 성별 = '남자' AND 암종 != '모든암')
UNION ALL
SELECT DISTINCT(암종), 성별, 환자수
    FROM CANCER
    WHERE 환자수 = (SELECT MAX(환자수) FROM CANCER WHERE 성별 = '여자' AND 암종 != '모든암');
    

 