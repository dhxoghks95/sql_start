SELECT ename || sal
    FROM emp;

SELECT ename || '�� ������' || sal || '�� �Դϴ�.' as ��������
    FROM emp;
    
SELECT ename || '�� ������' || job || '�Դϴ�.' as ��������
    FROM emp;
    
SELECT DISTINCT job
    FROM emp;
    
SELECT UNIQUE job
    FROM emp;
    
SELECT ename, sal
    FROM emp
    ORDER BY sal ASC;
    
SELECT ename, sal as ����
    FROM emp
    ORDER BY ���� ASC;
    
SELECT ename, deptno, sal
    FROM emp
    ORDER BY deptno asc, sal DESC;
    
SELECT ename, deptno, sal
    FROM emp
    ORDER BY 2 asc, 3 desc;
    
SELECT ename, sal, job
    FROM emp
    WHERE sal = 3000;
    
SELECT ename as �̸�, sal as ����
    FROM emp
    WHERE sal >= 3000;
    
SELECT ename, sal, job, hiredate, deptno
    FROM emp
    WHERE ename = 'SCOTT';
    
SELECT ename, hiredate
    FROM emp
    WHERE hiredate = '81/11/17';
    
SELECT *
    FROM nls_session_parameters
    WHERE parameter = 'NLS_DATE_FORMAT';
    
SELECT ename, sal * 12 as ����
    fROM emp
    WHERE sal * 12 >= 36000;
    
SELECT ename, sal, job, deptno
    FROM emp
    WHERE sal <= 1200;