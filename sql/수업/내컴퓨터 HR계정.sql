-- ��� ���̺��� ��� ���̵�, �̸� , �޿��� ��ȸ�ϱ�
SELECT JOB_ID, JOB_TITLE
FROM jobs;
-- �μ����̺��� �μ����̵�, �μ����� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM departments;
-- ����̵�, ��Ÿ��Ʋ�� ��ȸ�ϱ�
SELECT JOB_ID, JOB_TITLE
FROM jobs;
--�����̸� ��ȸ�ϱ�
SELECT COUNTRY_NAME
FROM countries;
-- ������̵�, �̸�, �޿�, ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, first_name, FIRST_NAME, SALARY*12 as years
FROM employees;
-- ������̵�, �̸�, �޿�, 10%�λ�� �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID as ID, FIRST_NAME as NAME, salary , SALARY*1.1 as "110%SALARY"
FROM employees;
-- ������̵�, �̸�, �޿�, ������ ��ȸ�ϱ�
-- ������̵��� ��Ī�� ID, �̸��� NAME, �޿��� SAL, ������ ANN_SAL�� �����ϱ�
SELECT EMPLOYEE_ID as ID, FIRST_NAME || ' ' ||last_name as NAME, salary as SAL, SALARY*12 as ANN_SAL
FROM employees;
-- ������̵�, �̸�, �޿�, 10%�λ�� �޿��� ��ȸ�ϱ�
-- ������̵��� ��Ī�� ID, �̸��� NAME, �޿��� SAL, 10%�λ�� �޿��� INCREMENT SALARY�� �����ϱ�
SELECT EMPLOYEE_ID AS ID, first_name || ' ' ||last_name as NAME ,salary as SAL, SALARY*1.1 as "INCEREMENT SALARY"
FROM employees;

-- NULL ���� �ִ� �÷� ��ȸ�ϱ�
-- �μ����̵�, �μ���, �μ������ ���̵� ��ȸ�ϱ�
SELECT DEPARTMENT_ID AS ID, department_NAME AS DEP_NAME, MANAGER_ID AS MNAN_ID
FROM departments WHERE MANAGER_ID IS NOT NULL;

-- ������̵�, �̸�, �޿�, Ŀ�̼�, Ŀ�̼��� ���Ե� �޿� ��ȸ�ϱ�
-- Ŀ�̼��� ���Ե� �޿��� �޿�+ �޿�*Ŀ�̼�
SELECT EMPLOYEE_ID as ID, FIRST_NAME || ' ' ||last_name as NAME, salary as SAL,commission_pcT AS COMMISSION, salary+SALARY*commission_pct as COM_SAL
FROM employees WHERE commission_pcT IS NOT NULL;

-- �ߺ������ ��ȸ�ϱ�
-- ������� �����ϰ� �ִ� �������̵� ���� ��ȸ�ϱ�
SELECT DISTINCT JOB_ID
FROM employees;

-- 60�� �μ��� �ٹ��ϴ� ����� ���̵�, �̸� ,����, �޿�, �μ����̵� ��ȸ�ϱ�
SELECT employee_id AS ID, FIRST_NAME || ' ' ||last_name as NAME, job_id ,salary, department_id AS DEP_ID
FROM employees WHERE department_id = 60;

-- �޿��� 150000�޷� �̻� �޴� ����� ���̵�, �̸� ����, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' ||last_name as NAME, JOB_ID, SALARY
FROM employees
WHERE salary >=15000;


