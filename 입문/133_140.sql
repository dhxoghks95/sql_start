CREATE TABLE CRIME_CAUSE2
AS
SELECT *
FROM CRIME_CAUSE
UNPIVOT (CNT FOR TERM IN (생계형, 유흥, 도박, 허영심, 복수, 해고, 징벌, 가정불화, 호기심, 유혹, 사고, 불만, 부주의, 기타));

SELECT 범죄유형
    FROM CRIME_CAUSE2
    WHERE CNT = (SELECT MAX(CNT)
                    FROM CRIME_CAUSE2
                    WHERE TERM = '가정불화')
    AND TERM = '가정불화';
    
SELECT TERM as 범죄유형
    FROM CRIME_CAUSE2
    WHERE CNT = (SELECT MAX(CNT)
                    FROM crime_cause2
                    WHERE 범죄유형 = '방화')
    AND 범죄유형 = '방화';
    
