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
            WHERE TRIM(CRIME_TYPE) = '����'
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
                RANK() OVER (ORDER BY TUITION_FEE DESC NULLS LAST) ����
        FROM UNIVERSITY_FEE
    )
WHERE ���� = 1;

SELECT A_NAME as "��ǰ", A_PRICE as "����", M_NAME as "�����"
FROM PRICE
WHERE A_PRICE = (SELECT MAX(A_PRICE)
                    FROM PRICE);
                    
SELECT * 
FROM(
    SELECT c_loc, cnt, rank() over (order by cnt desc) rnk
        FROM crime_loc
        WHERE crime_type = '����'
        )
WHERE rnk = 1;
 
 SELECT * 
  FROM ( 
      SELECT ACC_LOC_NAME AS ������, ACC_CNT AS ���Ǽ�, 
                DENSE_RANK() OVER (ORDER BY ACC_CNT DESC NULLS LAST) AS ����
        FROM ACC_LOC_DATA
        WHERE ACC_YEAR=2017
        )
  WHERE ���� <= 5;
  
  SELECT �⵵, ġŲ�� as �Ǽ�
    FROM CLOSING
    WHERE ġŲ�� = (SELECT MAX(ġŲ��) FROM CLOSING);
    
    
CREATE TABLE WORKING_TIME2
AS
SELECT *
FROM WORKING_TIME
UNPIVOT ( CNT FOR Y_YEAR IN (Y_2014, Y_2015, Y_2016, Y_2017, Y_2018)); 

SELECT COUNTRY, CNT, RANK() over (ORDER BY CNT DESC) ����
FROM WORKING_TIME2
WHERE Y_YEAR = 'Y_2018';


SELECT DISTINCT(����), ����, ȯ�ڼ�
    FROM CANCER
    WHERE ȯ�ڼ� = (SELECT MAX(ȯ�ڼ�) FROM CANCER WHERE ���� = '����' AND ���� != '����')
UNION ALL
SELECT DISTINCT(����), ����, ȯ�ڼ�
    FROM CANCER
    WHERE ȯ�ڼ� = (SELECT MAX(ȯ�ڼ�) FROM CANCER WHERE ���� = '����' AND ���� != '����');
    

 