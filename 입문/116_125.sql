undefine p_n1
undefine p_n2
ACCEPT p_n1 prompt '���� ���ڸ� �Է��ϼ���~';
ACCEPT p_n2 prompt '���� ���ڸ� �Է��ϼ���~';

WITH LOOP_TABLE as (SELECT LEVEL as NUM
                        FROM DUAL
                        CONNECT BY LEVEL <= &p_n2)
        SELECT LPAD('*', &p_n1, '*') as Square
            FROM LOOP_TABLE;
            
undefine p_n
ACCEPT p_n prompt '���ڿ� ���� �� �Է� : ~"

SELECT SUM(LEVEL) as �հ�
    FROM DUAL
    CONNECT BY LEVEL <= &p_n
    
undefine p_n
ACCEPT p_n prompt '���ڿ� ���� �� �Է� : ~"
SELECT ROUND(EXP(SUM(LN(LEVEL)))) ��
    FROM DUAL
    CONNECT BY LEVEL <= &p_n;
    
undefine p_n
ACCEPT p_n prompt '���ڿ� ���� �� �Է� : ~"
SELECT LEVEL as ¦��
    FROM DUAL
    WHERE MOD(LEVEL, 2) = 0
    CONNECT BY LEVEL <= &p_n;
    
undefine p_n
ACCEPT p_n prompt '���ڿ� ���� �� �Է� : ~"

WITH LOOP_TABLE as (SELECT LEVEL AS NUM
                        FROM DUAL
                        CONNECT BY LEVEL <= &p_n)
                        
SELECT L1.NUM as �Ҽ�
    FROM LOOP_TABLE L1, LOOP_TABLE L2
    WHERE MOD(L1.NUM, L2.NUM) = 0
    GROUP BY L1.NUM
    HAVING COUNT(L1.NUM) = 2;
    
    
ACCEPT p_n1 prompt 'ù ��° ���ڸ� �Է��ϼ���~';
ACCEPT p_n2 prompt '�� ��° ���ڸ� �Է��ϼ���~';

WITH NUM_D AS(SELECT &p_n1 as NUM1, &p_n2 as NUM2
                    FROM DUAL)
SELECT MAX(LEVEL) AS "�ִ�����"
    FROM NUM_D
    WHERE MOD(NUM1, LEVEL) = 0
        AND MOD(NUM2, LEVEL) = 0
    CONNECT BY LEVEL <= NUM2;


ACCEPT p_n1 prompt 'ù ��° ���ڸ� �Է��ϼ���~';
ACCEPT p_n2 prompt '�� ��° ���ڸ� �Է��ϼ���~';

WITH NUM_D AS(SELECT &p_n1 as NUM1, &p_n2 as NUM2
                    FROM DUAL)
                    
SELECT NUM1, NUM2,
    (NUM1/MAX(LEVEL)) * (NUM2/MAX(LEVEL)) * MAX(LEVEL) AS "�ּҰ����"
    FROM NUM_D
    WHERE MOD(NUM1, LEVEL) = 0
        AND MOD(NUM2, LEVEL) = 0
    CONNECT  BY LEVEL <= NUM2;
    
ACCEPT p_n1 prompt '�غ��� ���̸� �Է��ϼ���~';
ACCEPT p_n2 prompt '���̸� �Է��ϼ���~';
ACCEPT p_n3 prompt '������ ���̸� �Է��ϼ���~';

SELECT CASE WHEN
    ( POWER(&p_n1, 2) + POWER(&p_n2, 2) ) = POWER(&p_n3, 2)
            THEN '�����ﰢ���� �½��ϴ�'
            ELSE '�����ﰢ���� �ƴմϴ�' END AS "��Ÿ����� ����"
    FROM DUAL;
    
SELECT SUM(CASE WHEN (POWER(NUM1,2) + POWER(NUM2,2)) <= 1  THEN 1
                ELSE 0 END ) / 100000 * 4 as "������"
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
