CREATE TABLE CRIME_CAUSE2
AS
SELECT *
FROM CRIME_CAUSE
UNPIVOT (CNT FOR TERM IN (������, ����, ����, �㿵��, ����, �ذ�, ¡��, ������ȭ, ȣ���, ��Ȥ, ���, �Ҹ�, ������, ��Ÿ));

SELECT ��������
    FROM CRIME_CAUSE2
    WHERE CNT = (SELECT MAX(CNT)
                    FROM CRIME_CAUSE2
                    WHERE TERM = '������ȭ')
    AND TERM = '������ȭ';
    
SELECT TERM as ��������
    FROM CRIME_CAUSE2
    WHERE CNT = (SELECT MAX(CNT)
                    FROM crime_cause2
                    WHERE �������� = '��ȭ')
    AND �������� = '��ȭ';
    
