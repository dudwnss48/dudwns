SELECT EMPLOYEE_ID, job_ID, SALARY, SALARY/(5*24) AS HOURPAY
FROM employees;

--- ���� �����ؼ� ��ȸ�ϱ�
-- 60�� �μ����� �ٹ��ϴ� ����� ���̵�, �̸�, ����, �μ� ���̵� ��ȸ�ϱ�
SELECT employee_id, first_name || ' ' || last_name AS NAME, job_id, department_id
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;
-- �޿��� 5000�޷� ���Ϸ� �޴� ������̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name || ' ' || last_name AS NAME, job_id, SALARY
FROM EMPLOYEES
WHERE salary<=5000;
-- 100�� �������� �����ϴ� ������ ���̵�, �̸� ��ȸ�ϱ�
SELECT EMPLOYEE_ID,  first_name || ' ' || last_name AS NAME
FROM employees
WHERE manager_id=100;
-- 100�� ����� �μ� ����ڷ� ������ �μ��� ���̵�, �μ����� ��ȸ�ϱ�
SELECT department_id, department_NAME
FROM departments
WHERE manager_id = 100;
-- ���� �ִ� �޿��� 15000�޷� �̻�Ǵ� ������ ���̵�, ��������, �ִ�޿� ��ȸ�ϱ�
SELECT JOB_ID, JOB_TITLE, MAX_SALARY
FROM JOBS
WHERE max_salary>=15000;
-- �ñ��� 100�޷� �̻�޴� ������ ���̵�, �̸�, �������̵�, �޿�, �ñ��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID,  first_name || ' ' || last_name AS NAME, job_ID, SALARY, SALARY/(20*24) AS HOURPAY
FROM employees
WHERE SALARY/(5*8)>=100;

-- �̸��� Neena�� ����� �������̵�, �̸�, �̸���, ��ȭ��ȣ�� ��ȸ�ϱ�
SELECT employee_id, first_name, last_name, email, phone_number
From EMPLOYEEs
where first_name = 'Neena';

-- null �� ���� null�� �ƴѰ�츦 �����ؼ� ��ȸ�ϱ�
-- Ŀ�̼��� null�� ������ �������̵�, �̸�, �������̵�, �ҼӺμ� ���̵� ��ȸ�ϱ�
SELECT EMPLOYee_ID, FIRST_name, job_id ,DEPARTMENT_id
from employees
where commission_pct is null;
-- Ŀ�̼��� null�� �ƴ� ������ �������̵�, �̸� ,�������̵�, �ҼӺμ� ���̵� ��ȸ�ϱ�
SELECT EMPLOYee_ID, FIRST_name, job_id ,DEPARTMENT_id
from employees
where commission_pct is not null;
-- �ҼӺμ��� �������� ���� ������ ���̵�, �̸� ,�Ի��� ��ȸ�ϱ�
SELECT EMPLOYEE_id, FIRST_name, hire_date
from employees
where department_id is null;
-- �μ� ����ڰ� �������� ���� �μ��� ���̵�, �μ����� ��ȸ�ϱ�
SELECT DEPARTMENT_id, department_name
from departments
where manager_id is null;
-- �μ�����ڰ� ������ �μ��� �μ����̵�, �μ���, ����� �������̵� ��ȸ�ϱ�
SELECT DEPARTMENT_id, department_name, manager_id
from departments
where manager_id is not null;

-- between a and b ����ϱ�
-- �޿��� 1000�̻� 2000 ���Ϸ� �޴� ����� ���̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name, job_id, salary
from employees
where salary BETWEEN 2000 and 3000;

-- IN(��1, ��2, ��3, ...) ����ϱ�
-- 10�� �μ��� 20���μ��� �Ҽӵ� ����� ���̵�, �̸� , �ҼӺμ� ���̵� ��ȸ�ϱ�
SELECT employee_id, first_name, department_id
from employees
WHERE department_id in(10,20);

-- 50, 60, 70, 80�� �μ���  �Ҽӵ��� ���� ����� ���̵�, �̸�, �ҼӺμ� ���̵� ��ȸ�ϱ�
SELECT employee_id, first_name, department_id
from employees
WHERE department_id not in(50,60,70,80);

-- �������̵� JP,US�� ������ ��ġ���̵�, �ּ�, �������̵� ��ȸ�ϱ�
select location_id, street_address ,country_id
from locations
where country_id in ('JP','US');
-- ������ �������̵� AD_PRES�̰ų� AD_VP�� ������ ���̵�, �̸�, ������ ��ȸ�ϱ�
SELECT employee_id, first_name || ' ' || last_name as name , job_id
from EMPLOYEEs
where job_id in ('AD_PRES', 'AD_VP');
-- 50�� Ȥ�� 60�� �μ��� �ٹ��� ���� �ִ� ����� ���̵�, �ٹ�������, �ٹ��������� ��ȸ�ϱ�
SELECT employee_id, start_date, end_date
from job_history
where department_id in (50,60);
-- 101 Ȥ�� 102�� ������ ���� ������ ����� ���̵�, �̸�, �Ŵ������̵� ��ȸ�ϱ�
SELECT employee_id, first_name || ' ' || last_name as name , manager_id
from employees
where manager_id in (101,102);

-- �������̵� **_MAN�� ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name || ' ' || last_name as name , job_id, salary
from employees
where job_id like '%MAN';

-- �̸��� 'A'�� �����ϰ� �̸��� �ױ����� ������ �̸��� ���� ��ȸ�ϱ�
SELECT first_name
from EMPLOYEES
where first_name like 'A___';

-- �̸��� 'e'�� ���Ե� ������ �̸��� ���� ��ȸ�ϱ�
SELECT first_name
from EMPLOYEEs
where first_name like '%e%';

-- �� �����ڸ� ����ؼ� 2�� �̻��� ������ �����ϴ� ���� ��ȸ�ϱ�
-- 80�� �μ����� ���ϴ� ������ �޿��� 3000�޷� �̸��� ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name || ' ' || last_name as name, salary
from employees
where department_id = 80
and salary < 3000;
-- 50�� �μ����� ���ϴ� ���� �� ������ �Ŵ����� ������ �������̵�, �̸� , �������̵�, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name || ' ' || last_name as name , job_id, salary
from EMPLOYEES
where department_id = 50
and job_id like '%MAN%';
-- 50�� �μ����� ���ϰ�, �޿��� 2500�� ���Ϸ� �ް�,  �ڽ��� �Ŵ����� ���̵� 121���� ������
-- ���̵�, �̸�, �Ի���, �޿�, �������̵� ��ȸ�ϱ�
select employee_id, first_name || ' ' || last_name as name, hire_date, salary, job_id
from EMPLOYEEs
where department_id =50
and salary<2500
and manager_id = 121;
-- 50���̳� 60�� �μ��� �Ҽӵ� ���� �߿��� �̸��� 'A' �� �����ϴ� ������ ���̵�, �̸�, �μ����̵� ��ȸ�ϱ�
SELECT employee_id, first_name || ' ' || last_name as name, department_id
from EMPLOYEEs
where department_id in (50,60)
and last_name like 'A%';
SELECT employee_id, first_name || ' ' || last_name as name, department_id
from EMPLOYEEs
where (department_id= 50 or department_id =60)
and last_name like 'A%';

-- Ŀ�̼��� �޴� ���� �߿��� �޿��� 10000�޷� �̻� �޴�
-- ������ ���̵�, �̸�, ����, �Ի���, �޿�, ������ ��ȸ�ϱ�
-- ���� = �޿�*4*12 + �޿� *Ŀ�̼�*4*12 ��.
SELECT
    employee_id
    , first_name || ' ' || last_name as name
    , job_id, hire_date
    , salary
    , salary*4*12+salary*commission_pct*4*12 as ann_salary
from EMPLOYEES
where commission_pct is not null
and salary >=10000;

--- �����ϱ�
-- 60�� �μ��� �Ҽӵ� ������� ���̵�, �̸�, �޿�, �Ի��ϸ� ��ȸ�ϱ�
-- �̸������� �������� �����ϱ�
SELECT employee_id, last_name || ' ' || first_name AS NAME, salary, hire_date
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY first_name ASC;
-- 60�μ��� �Ҽӵ� ������� ���̵�, �̸� �޿�, �Ի����� ��ȸ�ϱ�
-- �̸������� �������� �����ϱ�
SELECT employee_id, last_name || ' ' || first_name AS NAME, salary, hire_date
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY first_name DESC;

-- 60�μ��� �Ҽӵ� ������� ���̵�, �̸� �޿�, ����, �Ի����� ��ȸ�ϱ�
--���������� �������� �����ϱ�
SELECT employee_id, last_name || ' ' || first_name AS NAME, salary, salary*48 ANNUAL_SALARY, hire_date
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY salary*48; --������� ����ؼ� �����ϱ�
-- 60�μ��� �Ҽӵ� ������� ���̵�, �̸� �޿�,����, �Ի����� ��ȸ�ϱ�
-- ���������� �������� �����ϱ�
SELECT employee_id, last_name || ' ' || first_name AS NAME, salary, salary*48 ANNUAL_SALARY, hire_date
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY 4; --�÷��� ������ ����ؼ� �����ϱ�
-- 60�μ��� �Ҽӵ� ������� ���̵�, �̸� �޿�, ����, �Ի����� ��ȸ�ϱ�
--���������� �������� �����ϱ�
SELECT employee_id, last_name || ' ' || first_name AS NAME, salary, salary*48 ANNUAL_SALARY, hire_date
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY ANNUAL_SALARY; --��Ī�� ����ؼ� �����ϱ�
-- 50�� �μ��� �Ҽӵ� ���� �߿��� ������ 200000�޷� �̻���
-- �������� ���̵�, �̸� �޿�, ����, �Ի����� ��ȸ�ϱ�
-- ���������� �������� �����ϱ�
SELECT employee_id, last_name || ' ' || first_name AS NAME, salary, salary*48 ANNUAL_SALARY, hire_date
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
AND salary*48 >= 200000
ORDER BY ANNUAL_SALARY; --��Ī�� ����ؼ� �����ϱ�
-- �������
-- SELECT������ ������ ��Ī�� WHERE������ ����� �� ����.
-- SELECT������ ������ ��Ī�� ORDER BY �������� ����� �� �ִ�.
SELECT employee_id, last_name || ' ' || first_name AS NAME, salary, salary*48 ANNUAL_SALARY, hire_date--3
FROM EMPLOYEES --1
WHERE DEPARTMENT_ID = 50--2
AND ANNUAL_SALARY >= 200000 -- ����
ORDER BY ANNUAL_SALARY; --��Ī�� ����ؼ� �����ϱ� --4

-- 50�� �μ����� �ٹ��ϴ� �������� �̸�, �޿��� ��ȸ�ϰ�
-- �޿������� �������������ϰ�, ���� �޿��� �����ϸ� �̸������� �������� �����ϱ�
SELECT first_name AS NAME, SALARY
from EMPLOYEEs
where department_id = 50
ORDER by salary DESC,  first_name;

-- ������ �Լ� �� �����Լ� ����ϱ�
-- ����� ���̵�, �̸��� ��ȸ�ϱ�(�̸��� �빮�ڷ� ǥ��)
SELECT employee_id
    , upper(first_name)
    , lower(first_name)
    , length(first_name)
    , substr(first_name,1)
    , concat(first_name,last_name)
    , LPAD(first_name, 10, '#')
    , RPAD(first_name, 10, '@')
from EMPLOYEES;

SELECT first_name || ' ' || last_name as name
from employees;

SELECT substr('940703',3,2)
from employees;

select substr(street_address,1,instr(street_address,' ')-1),instr(street_address,' ')
FROM locations;

select replace(first_name,'Ell','eee')
from employees;

-- ���� �Լ� �ݿø�
SELECT
ROUND(1265.737,2) "2",      -- �Ҽ��� 2�ڸ��� �ݿø� �ض�
ROUND(1265.737,1) "1",      -- �Ҽ��� 1�ڸ��� �ݿø� �ض�
ROUND(1265.737,0) "0",      -- �����ڸ��� �ݿø� �ض�
ROUND(1265.737)" ",         -- �����ڸ��� �ݿø� �ض�
ROUND(1265.737,-1) "-1",    -- �����ڸ��� �ݿø� �ض�
ROUND(1265.737,-2) "-2"     -- �����ڸ��� �ݿø� �ض�
FROM DUAL;

-- ���� �Լ� ����
SELECT
TRUNC(1265.737,2) "2",      -- �Ҽ��� 2�ڸ����� ������
TRUNC(1265.737,1) "1",      -- �Ҽ��� 1�ڸ����� ������
TRUNC(1265.737,0) "0",      -- �����ڸ����� ������
TRUNC(1265.737)" ",         -- �����ڸ����� ������
TRUNC(1265.737,-1) "-1",    -- �����ڸ����� ������
TRUNC(1265.737,-2) "-2"     -- �����ڸ����� ������
FROM DUAL;

-- �������� �ñ��� ��ȸ�ϱ�
-- �������̵�, �̸�, �������̵�, �޿�, �ñ�
-- �ñ� = �޿�*ȯ��/(5*8) �ñ��� ������������ ǥ���Ѵ�.
SELECT employee_id
    , first_name
    , job_id
    , salary
    , TRUNC(salary*1220.40/(5*8)) PAY_FOR_HOUR
FROM employees
ORDER BY PAY_FOR_HOUR DESC;

-- ���� �Լ� �������� ���ϱ�
SELECT MOD(12,5)
FROM DUAL;

-- ��¥ �Լ�
-- ���� ��¥�� �ð����� ��ȸ�ϱ�
SELECT SYSDATE
FROM DUAL;

-- �������̵�, ������, �Ի���, ���ñ��� �ٹ��� ��¥ ��ȸ�ϱ�
SELECT EMPLOYEE_ID , FIRST_NAME, HIRE_DATE, TRUNC(SYSDATE-HIRE_DATE) AS "���ñ��� �ٹ��� ��¥"
FROM EMPLOYEES;

-- ����, 3����, 1������, 1������, 3������
SELECT SYSDATE "����"
    , SYSDATE - 3 "3����"
    , SYSDATE - 7 "��������"
    , ADD_MONTHS(SYSDATE,-1) "�Ѵ���"
FROM DUAL;

-- 60�� �μ��� �Ҽӵ� ������� ���̵�, �̸�, �Ի���, �ٹ��� �������� ��ȸ�ϱ�
-- �������� �Ҽ����κ��� ������.
SELECT EMPLOYEE_ID
    , first_name
    , hire_date
    , TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date))
FROM employees
WHERE department_id = 60;

-- ���ú��� 3���� ���� ��¥��?
SELECT ADD_MONTHS(SYSDATE,3)
FROM DUAL;

-- ��¥ �ݿø��ϱ�, ������
SELECT ROUND(SYSDATE), TRUNC(SYSDATE)
FROM DUAL;

-- �� ��¥���� �� �� ����ϱ�
-- ���� ��¥�� ���� TRUNC() �Լ��� �ú��ʸ� ���� 0���� ���� �� ��¥�� ����ߴ�.
SELECT employee_id
    , first_name
    , HIRE_DATE
    , SYSDATE - hire_date
    , TRUNC(SYSDATE) -hire_date
FROM employees;

SELECT LAST_DAY(TRUNC(SYSDATE))
FROM DUAL;

--������ �������� ���� �� �����
SELECT NEXT_DAY(TRUNC(SYSDATE),7)
FROM DUAL;

SELECT NEXT_DAY(TRUNC(SYSDATE),6)
FROM DUAL;
-- ������ �������� ���� �� �Ͽ���
SELECT NEXT_DAY(TRUNC(SYSDATE),1)
FROM DUAL;

-- ��ȯ �Լ�
-- ��¥�� ���ڷ� ��ȯ�ϱ�
SELECT TO_CHAR(SYSDATE,'YYYY') ��
    , TO_CHAR(SYSDATE,'MM') ��
    , TO_CHAR(SYSDATE,'DD') ��
    , TO_CHAR(SYSDATE,'DAY') ����
    , TO_CHAR(SYSDATE,'AM') "����/����"
    , TO_CHAR(SYSDATE,'HH') �ð�  
    , TO_CHAR(SYSDATE,'HH24') �ð�
    , TO_CHAR(SYSDATE,'MI') ��
    , TO_CHAR(SYSDATE,'SS') ��
FROM DUAL;

-- 2003�⵵�� �Ի��� ����� ���̵�, �̸�, �Ի��� ���� ��ȸ�ϱ�
SELECT employee_id, first_name, TO_CHAR(hire_date,'MM')
FROM EMPLOYEES
WHERE TO_CHAR(hire_date, 'YYYY') = '2003';
-- �Ի����� ���� ��¥�� ���� ��¥�� �Ի��� ����� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT employee_id, first_name, hire_date
FROM EMPLOYEES
WHERE TO_CHAR(hire_date, 'MMDD') = TO_CHAR(SYSDATE,'MMDD');

-- Ư�� ��¥�� ��Ÿ���� ���ڸ� ��¥(DATE Ÿ��)�� ��ȯ�ϱ�
SELECT TO_DATE('2018-12-31', 'YYYY-MM-DD')+1000
FROM DUAL;

-- Ư����¥�� ��Ÿ���� ���ڸ� ��¥�� ��ȯ�ؼ� ���ñ����� �ϼ�, �������� ��ȸ�ϱ�
SELECT TRUNC(SYSDATE) - TO_DATE('2016-04-17', 'YYYY-MM-DD')
    , MONTHS_BETWEEN(TRUNC(SYSDATE), TO_DATE('2016-04-17', 'YYYY-MM-DD'))
FROM DUAL;

-- 2005-01-01 ~ 2005-03-31 ���̿� �Ի��� ����� ���̵�, �̸� , �Ի���, �������̵�, ��ȸ�ϱ�
SELECT employee_id, first_name, hire_date, job_id
FROM EMPLOYEES
WHERE hire_date >= TO_DATE('2005-01-01', 'YYYY-MM-DD')
AND hire_date <= TO_DATE('2005-03-31', 'YYYY-MM-DD')
ORDER BY hire_date;

-- 2003�⿡ �Ի��� ������ ���̵�, �̸� ,�Ի��� ��ȸ
SELECT employee_id, first_name, hire_date
FROM employees
WHERE TO_CHAR(HIRE_DATE, 'YYYY')= 2003
ORDER BY hire_date;

SELECT employee_id, first_name, hire_date
FROM employees
WHERE hire_date >= TO_DATE('20030101', 'YYYYMMDD')
AND hire_date < TO_DATE('20040101', 'YYYYMMDD')
ORDER BY hire_date;

--�������� ����ȯ
SELECT employee_id, first_name, hire_date
FROM employees
WHERE hire_date >= '2003-01-01'
AND hire_date < '20040101'
ORDER BY hire_date;

SELECT employee_id, first_name, hire_date
FROM employees
WHERE hire_date >= '2003-01-01'
AND hire_date < '2004/01/01'
ORDER BY hire_date;


-- ���ڸ� õ�������� �����ڰ� ���Ե� �ؽ�Ʈ�� ��ȯ�ؼ� ��ȸ�ϱ�
SELECT TO_CHAR(10000,'9,999,999'), TO_CHAR(10000,'0,000,000')
FROM DUAL;
-- ���ڸ� �Ҽ��� 2�ڸ����� �ݿø��� �� �ؽ�Ʈ�� ��ȯ�ؼ� ��ȸ�ϱ�
SELECT TO_CHAR(123.456,'999,999.99'), TO_CHAR(123.456,'000,000.00')
FROM DUAL;

-- ���ڸ� ���ڷ� ��ȯ�ؼ� ����ϱ�
-- �޿��� 15000�޷� �̻��� ������ ���̵�, �̸� ,�޿��� ��ȸ�ϱ�
SELECT employee_id, first_name, salary
FROM EMPLOYEES
WHERE salary >= '15000';

SELECT employee_id, first_name, salary
FROM EMPLOYEES
WHERE salary >= TO_NUMBER('15000');

-- TO_NUMBER() �Լ��� �ݵ�� ����ؾ� �ϴ� ���
SELECT employee_id, first_name, salary
FROM EMPLOYEES
WHERE salary >= TO_NUMBER('15,000', '99,999');

-- NVL()�Լ�
SELECT NVL(10,1)    -- 10�� �������̴�.
    ,NVL(NULL, 1)   -- 1�� �������̴�,
FROM DUAL;

-- �������̵�, �̸� ,�޿�, Ŀ�̼��� ��ȸ�ϱ�
-- Ŀ�̼ǰ��� NULL�� ��� 0���� ��ȸ�Ѵ�.
SELECT employee_id, first_name, salary, NVL(commission_pct, 0) COMM
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- �������̵�, �̸� ,�Ǳ޿��� ��ȸ�ϱ�
-- �Ǳ޿� = �޿� + �޿�*Ŀ�̼��̴�.
SELECT employee_id
    , first_name
    , salary + salary*commission_pct SAL1
    , salary + salary*NVL(commission_pct,0) SAL2
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- �μ����̵�, �μ���, �ش�μ� ������ ���̵� ��ȸ�ϱ�
-- ������ ���̵� NULL�ΰ�� '������ ������ ����' ���� ��ȸ�ϱ�
SELECT department_id
    , department_name
    , NVL(TO_CHAR(manager_id),'������ ������ ����')
FROM DEPARTMENTS
ORDER BY department_id;

-- �μ����̵�, �μ���, �ش�μ� ������ ���̵� ��ȸ�ϱ�
-- ������ ���̵� NULL�ΰ�� 100 ������ �����ڷ� �����Ѵ�.
SELECT department_id
    , department_name
    , NVL(manager_id,100)
FROM DEPARTMENTS
ORDER BY department_id;

-- MVL2() �Լ� ����ϱ�
SELECT NVL2(10,1,0)     --NULL�� �ƴϸ� ��
    , NVL2(NULL,1,0)    --NULL�̸� ��
FROM dUAL;


-- �������̵�, �̸�, Ŀ�̼� ���ɿ��θ� 'YES', 'NO'�� ��ȸ�ϱ�
SELECT EMPLOYEE_ID
    , first_name
    , NVL2(commission_pct, 'YES', 'NO') ���ɿ���
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- CASE ~WHEN
-- �������̵�, �̸�, �޿�, �޿���� ��ȸ�ϱ�
-- �޿������
-- 20000�޷� �̻�   A���
-- 10000�޷� �̻�   B���
-- 5000�޷� �̻�    C���
-- �׿�            D���
SELECT EMPLOYEE_ID ���̵�
    , first_name �̸�
    , salary �޿�
    , CASE WHEN SALARY >= 20000 THEN 'A���'
           WHEN SALARY >= 10000 THEN 'B���'
           WHEN SALARY >= 5000 THEN 'C���'
           ELSE 'D���' END �޿����
FROM employees
ORDER BY employee_id;

-- �������̵�, �̸�, �޿�, �λ�� �޿� ��ȸ�ϱ�
-- �޿������
-- 20000�޷� �̻�   10%�λ�
-- 10000�޷� �̻�   15%�λ�
-- 5000�޷� �̻�    20%�λ�
-- �׿�            25%�λ�
SELECT EMPLOYEE_ID ���̵�
    , first_name �̸�
    , salary �޿�
    , CASE WHEN SALARY >= 20000 THEN salary*1.1
           WHEN SALARY >= 10000 THEN salary*1.15
           WHEN SALARY >= 5000 THEN salary*1.2
           ELSE 1.25 END "�λ�� �޿�"
FROM employees
ORDER BY SALARY DESC;

-- �������̵�, �̸�, �޿�, �λ�ȱ޿��� ��ȸ�ϱ�
-- �λ����
-- �ҼӺμ��� 50�� �μ��� 10%�λ�
-- �ҼӺμ��� 80�� �μ��� 15%�λ�
-- �� �� �μ��� 5% �λ�
SELECT employee_id
    , FIRST_NAME
    , salary
    , CASE 
        WHEN department_id = 50 THEN SALARY*1.1
        WHEN DEPARTMENT_ID = 80 THEN SALARY*1.15
        ELSE SALARY*1.05
        END INCRESED_SALARY
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;
--�� ���� �������϶��� ����
SELECT employee_id
    , FIRST_NAME
    , salary
    , CASE department_id
        WHEN 50 THEN SALARY*1.1
        WHEN 80 THEN SALARY*1.15
        ELSE SALARY*1.05
        END INCRESED_SALARY
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

SELECT employee_id
    , FIRST_NAME
    , salary
    , DECODE (department_id, 50, SALARY*1.1
                           , 80, SALARY*1.15
                               , SALARY*1.05) INCRESED_SALARY
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- DECODE()�Լ��� ����ؼ� ��ȸ�ϱ�
-- �������̵�, �̸�, �޿�, �λ�� �޿� ��ȸ�ϱ�
-- �λ��
-- 20000�޷� �̻�   10%�λ�
-- 10000�޷� �̻�   15%�λ�
-- 5000�޷� �̻�    20%�λ�
-- �׿�            25%�λ�
SELECT EMPLOYEE_ID ���̵�
    , first_name �̸�
    , salary �޿�
    , DECODE (TRUNC(SALARY,-4) , 20000, 'A'
                               , 10000, 'B'
                               , DECODE(TRUNC(SALARY/5000)*5000 , 5000, 'C'
                                                                      , 'D')) "�޿� ���"
FROM employees
ORDER BY SALARY DESC;
















