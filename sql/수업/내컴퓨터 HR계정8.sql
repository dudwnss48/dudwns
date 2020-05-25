-- ��ȭ��ȣ ��ȸ�ϱ�, ���༺��
SELECT *
FROM SCOTT.CONTACTS;

-- ��ȭ��ȣ �����ϱ�, ���༺��
UPDATE SCOTT.CONTACTS
SET 
    CONTACT_TEL = '010-1122-3344'
WHERE 
    contact_name = 'ȫ�浿';

-- �̸� �����ϱ�, ��ü���� �������� �������    
UPDATE SCOTT.contacts
SET 
    contact_name = '������'
WHERE 
    contact_name = '������';
    
      
-- SCOTT.CONTACTS�� ���� ���̺��� ���Ǿ �����ϱ�
CREATE SYNONYM CONTACTS FOR SCOTT.CONTACTS;

SELECT
    *
FROM CONTACTS;

-- ������� ��� ���̺� ���� ��ȸ
SELECT
    *
FROM USER_TABLES;

-- ������� ��� �� ���� ��ȸ
SELECT
    *
FROM USER_VIEWS;

-- ������� ��� ������ ���� ��ȸ
SELECT
    *
FROM user_sequences;

-- ��� ����� ���� ��ȸ
SELECT
    *
FROM USER_USERS;


-- ���� ������ ����ϱ�
-- ��� ����� ���� �� ������ �ٹ��ߴ� ������ ��ȸ�ϱ�
-- ������� �ѹ����� ǥ���ϱ�
SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
UNION
SELECT EMPLOYEE_ID, JOB_ID
FROM JOB_HISTORY;

-- ��� ����� ���� �μ����̵�� ���� �ҼӺμ� ���̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, department_id
FROM EMPLOYEES
UNION ALL
SELECT EMPLOYEE_ID, department_id
FROM JOB_HISTORY;

-- ���� �����ϴ� ������ ���� �������� �����ϰ� �ִ� ����� ���̵�� �������̵� ��ȸ�ϱ�
SELECT EMPLOYEE_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

SELECT A.EMPLOYEE_ID, A.JOB_ID
FROM EMPLOYEES A, job_history B
WHERE A.EMPLOYEE_ID = b.employee_id
AND a.job_id = b.job_id;

-- ������ ����� ���� ���� ����� ���̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID
FROM employees
MINUS
SELECT EMPLOYEE_ID 
FROM job_history;


-- ������ ����� ���� ���� ����� ���̵�, �̸��� ��ȸ�ϱ�
SELECT a.employee_id, b.FIRST_NAME
FROM (SELECT EMPLOYEE_ID
      FROM employees
      MINUS
      SELECT EMPLOYEE_ID 
      FROM job_history) A, employees B
WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID
ORDER BY 1;

-- ������ ����� ���� ���� ����� ���̵�, �̸�, ������ ��ȸ�ϱ�
SELECT a.employee_id, b.FIRST_NAME, b.job_id
FROM (SELECT EMPLOYEE_ID
      FROM employees
      MINUS
      SELECT EMPLOYEE_ID 
      FROM job_history) A, employees B
WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID
ORDER BY 1;

-- ��� ����� ���� �� ������ �ٹ��ߴ� ������ ��ȸ�ϱ�
-- ������̵�, ����, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, JOB_ID, SALARY
FROM EMPLOYEES
UNION
SELECT EMPLOYEE_ID, JOB_ID, 0
FROM JOB_HISTORY;



















    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    