--1. ��� �������� ��� �������̵� ��ȸ�ϱ�
SELECT DISTINCT job_id
FROM employees;
--2. �޿��� 12,000�޷� �̻� �޴� ������ �̸��� �޿��� ��ȸ�ϱ�
select first_name, salary
from EMPLOYEES
where salary >= 12000
order by employee_id;
--3. ������ȣ�� 176�� ������ ���� �μ����� �ٹ��ϴ� ������ ���̵�� �̸� �������̵� ��ȸ�ϱ�
SELECT b.employee_id, b.first_name, b.job_id
FROM employees A, EMPLOYEES B
where a.employee_id = 176
and a.department_id = b.department_id
order by 1;
--4. �޿��� 12,000�޷� �̻� 15,000�޷� ���� �޴� �������� ���� ���̵�� �̸��� �޿��� ��ȸ�ϱ�
select employee_id, first_name, salary
from employees
where salary BETWEEN 12000 and 15000;
--5. 2005�� 1�� 1�Ϻ��� 2000�� 6�� 30�� ���̿� �Ի��� ������ ���̵�, �̸�, �������̵�, �Ի����� ��ȸ�ϱ�
SELECT employee_id, FIRST_name, job_id , hire_date
FROM employees
where TO_date(hire_date) BETWEEN TO_date('00/06/30') and TO_date('05/01/01')
order by 4;
--6. �޿��� 5,000�޷��� 12,000�޷� �����̰�, �μ���ȣ�� 20 �Ǵ� 50�� ������ �̸��� �޿��� ��ȸ�ϱ�
select first_name, salary 
from EMPLOYEES
where salary BETWEEN 5000 and 12000
and department_id in (20, 50);
--7. �����ڰ� ���� ������ �̸��� �������̵� ��ȸ�ϱ�
select first_name, job_id
from EMPLOYEES
where manager_id is null;
--8. Ŀ�̼��� �޴� ��� ������ �̸��� �޿�, Ŀ�̼��� �޿� �� Ŀ�̼��� ������������ �����ؼ� ��ȸ�ϱ�
select first_name, salary, commission_pct
from EMPLOYEES
where commission_pct is not null
order by 2,3 desc;
--9. �̸��� 2��° ���ڰ� e�� ��� ������ �̸��� ��ȸ�ϱ�
select first_name
from EMPLOYEEs
where first_name like '_e%' ;
--10. �������̵� ST_CLERK �Ǵ� SA_REP�̰� �޿��� 2,500�޷�, 3,500�޷�, 7,000�޷� �޴� ��� ������ �̸��� �������̵�, �޿��� ��ȸ�ϱ�
select first_name, job_id, salary
from EMPLOYEES
where (job_id = 'ST_CLERK'
or job_id = 'SA_REP')
and salary in (2500, 3500, 7000);
--11. ��� ������ �̸��� �Ի���, �ٹ� ���� ���� ����Ͽ� ��ȸ�ϱ�, �ٹ����� ���� ������ �ݿø��ϰ�, �ٹ��������� �������� ������������ �����ϱ�
select FIRST_name, hire_date, trunc(to_date(sysdate)- to_date(hire_date),0) as �ٹ�������
from employees
order by �ٹ�������;
--12. ������ �̸��� Ŀ�̼��� ��ȸ�ϱ�, Ŀ�̼��� ���� �ʴ� ������ '����'���� ǥ���ϱ�
select first_name, NVL(to_char(commission_pct),'����')
from employees;

--13. ��� ������ �̸�, �μ���ȣ, �μ��̸��� ��ȸ�ϱ�
select a.first_name, B.department_id, B.department_name
from EMPLOYEES A, departments B
where b.department_id(+) = a.department_id;
--14. 80���μ��� �Ҽӵ� ������ �̸��� �������̵�, ��������, �μ��̸��� ��ȸ�ϱ�
SELECt b.job_id, b.job_title, a.department_name
FROM DEPARTMENTS A, jobs B
where department_id = 80;
--15. Ŀ�̼��� �޴� ��� ������ �̸��� �������̵�, ��������, �μ��̸�, �μ������� ���ø��� ��ȸ�ϱ�
select d.first_name , d.job_id, a.job_title, b.department_name, c.city
from jobs A, departments B, locations C, employees D
where d.commission_pct is not null
and d.department_id = b.department_id
and b.location_id = c.location_id
and d.job_id = a.job_id;
--16. ������ �������� �ΰ� �ִ� ��� �μ����̵�� �μ��̸��� ��ȸ�ϱ�
select a.department_id, a.department_name
from DEPARTMENTS A, locations B, countries C, regions D
where d.region_name = 'Europe'
and d.region_id = c.region_id
and c.country_id = b.country_id
and b.location_id = a.location_id
order by 1;
--17. ������ �̸��� �ҼӺμ���, �޿�, �޿� ����� ��ȸ�ϱ�
select a.department_name, b.salary, c.gra
from DEPARTMENTS A, employees B, job_grades C
where a.department_id = b.employee_id
and b.SALARY >= c.LOWEST_SAL AND b.SALARY <= c.HIGHEST_SAL
order by 2;
--18. ������ �̸��� �ҼӺμ���, �ҼӺμ��� �����ڸ��� ��ȸ�ϱ�, �ҼӺμ��� ���� ������ �ҼӺμ��� '����, �����ڸ� '����'���� ǥ���ϱ�
select a.first_name, nvl(b.department_name,'����'), nvl(c.first_name,'����')
from EMPLOYEES A, departments B, EMPLOYEES C
where a.department_id = b.department_id(+)
and b.manager_id = c.employee_id(+);

--19. ��� ����� �̸�, �������̵�, �޿�, �ҼӺμ����� ��ȸ�ϱ�
SELECT a.first_name, a.job_id, a.salary, b.department_name
FROM EMPLOYEES A, departments B
where a.department_id = b.department_id(+)
order by a.employee_id;
--20. ��� ����� �̸�, �������̵�, ��������, �޿�, �ּұ޿�, �ִ�޿��� ��ȸ�ϱ�
select a.first_name, a.job_id, b.job_title , a.salary, b.min_salary, b.max_salary
from employees A, jobs B
where a.job_id = b.job_id;
--21. ��� ����� �̸�, �������̵�, ��������, �޿�, �ּұ޿��� ���� �޿��� ���̸� ��ȸ�ϱ�
select a.first_name, a.job_id, b.job_title , a.salary, a.salary - b.min_salary as sal_gap
from employees A, jobs B
where a.job_id = b.job_id
order by 5;

--22. Ŀ�̼��� �޴� ��� ����� ���̵�, �μ��̸�, �ҼӺμ��� ������(���ø�)�� ��ȸ�ϱ�
select a.employee_id, b.department_name, c.city
from EMPLOYEES A, departments B, LOCATIONS C
where commission_pct is not null
and a.department_id = b.department_id
and b.location_id = c.location_id;
--23. �̸��� A�� a�� �����ϴ� ��� ����� �̸��� ����, ��������, �޿�, �ҼӺμ����� ��ȸ�ϱ�
SELECT a.first_name, a.job_id, b.job_title, a.salary, c.department_name
from EMPLOYEES A, jobs B, DEPARTMENTS C
where (a.first_name like 'A%'
or a.first_name like 'a%')
and a.job_id = b.job_id
and a.department_id = c.department_id
order by employee_id;
--24. 30, 60, 90�� �μ��� �ҼӵǾ� �ִ� ����� �߿��� 100���� �����ϴ� ������� �̸�, ����, �޿�,
--    �޿������ ��ȸ�ϱ�
select a.first_name, a.job_id, b.job_title, a.salary, b.min_salary, b.max_salary, c.gra
from EMPLOYEES A, jobs B, job_grades C
where a.DEPARTMENT_id in (30, 60, 90)
and a.manager_id = 100
and a.job_id = b.job_id
and a.SALARY >= c.LOWEST_SAL AND a.SALARY <= c.HIGHEST_SAL
order by a.employee_id;
--25. 80�� �μ��� �Ҽӵ� ������� �̸�, ����, ��������, �޿�, �ּұ޿�, �ִ�޿�, �޿����, 
--    �ҼӺμ����� ��ȸ�ϱ�
select a.first_name, a.job_id, b.job_title , a.salary, b.min_salary, b.max_salary, c.gra, d.department_name
from employees A, jobs B, job_grades C, departments D
where a.department_id = 80
and a.SALARY >= c.LOWEST_SAL AND a.SALARY <= c.HIGHEST_SAL
and a.job_id = b.job_id
and a.department_id = d.department_id;
--26. ������߿��� �ڽ��� ��纸�� ���� �Ի��� ������� �̸�, �Ի���, ����� �̸�, ����� �Ի�����
--    ��ȸ�ϱ�
select a.first_name, a.hire_date, b.employee_id, b.hire_date
from EMPLOYEES A, employees B
where a.manager_id = b.employee_id(+)
and b.hire_date >= a.hire_date;
--#########################��ƴ�#######################
--27. �μ����� IT�� �μ��� �ٹ��ϴ� ������� �̸���, ����, �޿�, �޿����, ����� �̸��� ������
--    ��ȸ�ϱ�
select a.first_name, a.job_id, a.salary , b.gra 
from employees A, job_grades B, EMPLOYEES C, departments D
where d.department_name = 'IT'
and a.department_id = d.department_id
and a.SALARY >= b.LOWEST_SAL AND a.SALARY <= B.HIGHEST_SAL
and a.manager_id = c.employee_id;
--28. 'ST_CLERK'�� �ٹ��ϴٰ� �ٸ� �������� ������ ����� ���̵�, �̸�, ������ �μ���,
--     ���� ����, ���� �ٹ��μ����� ��ȸ�ϱ�
select a.department_id, a.first_name, b.department_id, a.job_id, c.department_name 
from EMPLOYEES A, job_history B, DEPARTMENTS C
where b.job_id = 'ST_CLERK'
and b.employee_id = a.employee_id
and a.department_id = c.department_id;