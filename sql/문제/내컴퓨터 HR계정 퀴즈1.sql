-- �μ����̺��� ��� �μ� ������ ��ȸ�ϱ�
SELECT department_id, department_name, location_id, manager_id
from departments;
-- �μ����̺��� ��ġ���̵� 1700���� �ƴ� �μ� ���� ��ȸ�ϱ�
SELECT department_id, department_name, location_id, manager_id
from DEPARTMENTS
where LOCATION_id != 1700;
-- 100����� �����ϴ� �μ����� ��ȸ�ϱ�
SELECT  department_id, department_name, location_id, manager_id
from DEPARTMENTS
where manager_id = 100;
-- �μ����� 'IT'�� �μ��� ���� ��ȸ�ϱ�
SELECT department_id, department_name, location_id, manager_id
from DEPARTMENTS
where department_name = 'IT';
-- ��ġ���̵� 1700���� ������ �ּ�, �����ȣ, ���ø�, �����ڵ带 ��ȸ�ϱ�
SELECT street_address, postal_code, city, country_id
from locations
where location_id = 1700;
-- �ּұ޿��� 2000�̻� 5000������ ������ �������̵�, ��������, �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT job_id, job_title, min_salary, max_salary
from jobs
where min_salary between 2000 and 5000; 
-- �ִ�޿��� 20000���� �ʰ��ϴ� ������ ���̵�, ��������, �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT job_id, job_title, min_salary, max_salary
from jobs
where max_salary >20000;
-- 100�������� �����ϴ� ����� ���̵�, �̸�, �μ����̵��� ��ȸ�ϱ�
SELECT employee_id, first_name, department_id
from EMPLOYEES
where manager_id = 100;
-- 80�� �μ����� �ٹ��ϰ� �޿��� 8000�� �̻� �޴� ����� ���̵�, �̸�, �޿�, Ŀ�̼�����Ʈ ��ȸ�ϱ�
SELECT employee_id, first_name, salary, commission_pct
from EMPLOYEES
where department_id = 80
and salary >= 8000;
-- ������ SA_REP�̰�, Ŀ�̼�����Ʈ�� 0.25�̻��� ����� ���̵�, �̸�, �޿�, Ŀ�̼�����Ʈ�� ��ȸ�ϱ�
SELECT employee_id, first_name, salary, commission_pct
from EMPLOYEES
where job_id = 'SA_REP'
and commission_pct >= 0.25;
-- 80�� �μ��� �ٹ��ϰ�, �޿��� 10000�� �̻��� ����� ���̵�, �̸�, �޿�, ������ ��ȸ�ϱ�
--  ���� = (�޿� + �޿�*Ŀ�̼�)*12��
--  ������ ��Ī�� annual_salary��.
SELECT employee_id, first_name, salary, salary*(1+commission_pct)*12 as annual_salary
from EMPLOYEES
where department_id = 80
and salary >= 10000;
-- 80�� �μ��� �ٹ��ϰ�, 147�� �������� �����ϴ� ��� �߿��� Ŀ�̼��� 0.1�� ����� 
--  ������̵�, �̸�, ����, �޿�, Ŀ�̼�����Ʈ�� ��ȸ�ϱ�
SELECT employee_id, first_name, job_id, salary, commission_pct
from EMPLOYEES
where department_id = 80
and manager_id = 147
and commission_PCT = 0.1;
-- ������� �����ϴ� ������ �ߺ����� ��ȸ�ϱ�
SELECT distinct job_id
from EMPLOYEES;
-- ������� �Ҽӵ� �μ����̵� ��� ��ȸ�ϱ�
SELECT DISTINCT department_id
from EMPLOYEES
where DEPARTMENT_ID is not null;
-- �޿��� 12000�� �Ѵ� ����� �̸��� �޿��� ��ȸ�ϱ�
SELECT first_name, salary
from EMPLOYEES
where salary >= 12000;
-- �޿��� 5000�̻� 12000������ ����� �̸��� �޿��� ��ȸ�ϱ�
SELECT first_name, salary
from EMPLOYEES
where salary between 5000 and 12000;
-- 2007�⿡ �Ի��� ����� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT employee_id, first_name, hire_date
from EMPLOYEES
where hire_date like '07%';
-- 20�� 50�� �μ��� �Ҽӵ� ����� �̸��� �μ���ȣ�� ��ȸ�ϰ�, �̸��� ���ĺ������� �����ؼ�  ��ȸ�ϱ�
SELECT first_name, department_id
from EMPLOYEES
where department_id in (20,50)
order by first_name;
-- �޿��� 5000�̻� 12000���ϰ�, 20���� 50�� �μ��� �Ҽӵ� ����� �̸��� �޿�, �μ���ȣ�� ��ȸ�ϱ�
SELECT first_name, salary, department_id
from EMPLOYEES
where salary between 5000 and 12000
and department_id in (20,50);
-- �����ڰ� ���� ����� �̸��� ����, �޿��� ��ȸ�ϱ�
SELECT first_name, job_id, salary
from EMPLOYEES
where manager_id is null;
-- ������ 'SA_MAN'�̰ų� 'ST_MAN'�� �����߿��� �޿��� 8000�̻� �޴� ����� ���̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name, job_id, salary
from EMPLOYEES
where (job_id = 'SA_MAN'
or job_id = 'ST_MAN')
and salary >= 8000;