-- ������ �׷��� ����
-- group by ���� ����ϸ� ���̺��� ������ ���� �׷����� �����
-- �׷�� �����͸� ������ �� �ִ�.

-- �ҼӺμ��� �������� ��ȸ�ϱ�, ��, �ҼӺμ��� �������� ���� ������ �����Ѵ�.
select department_id, count(*)
from employees
where department_id is not null
group by department_id;

-- �����ں� �ڽ��� �����ϴ� �������� ��ȸ�ϱ�. ��, �����ڰ� �������� ���� ������ ����
-- ������ ���̵�, �������� ��ȸ�Ѵ�.
select manager_id, count(*)
from employees
where manager_id is not null
group by manager_id;

-- �μ��� �������� ��ȸ�ϱ�, �� �μ��� �������� ���� ����� ����
-- �μ��̸�, �������� ��ȸ�ϱ�
select b.department_name, count(*)
from departments B, employees A
where a.department_id is not null
and b.department_id = a.department_id
GROUP  BY b.department_name;

-- ���ú� �������� ��ȸ�ϱ�,
-- ���ø�, ������
select c.city, count(*)
from employees A, departments B, locations C
where a.department_id = b.department_id
and b.location_id = c.location_id
GROUP BY c.city;

-- ���ú�, �μ��� �������� ��ȸ�ϱ�
-- ���ø�, �μ���, �������� ��ȸ�Ѵ�.
select c.city, b.department_name, count(*)
from employees A, departments B, locations C
where a.department_id = b.department_id
and b.location_id = c.location_id
GROUP BY c.city, b.department_name 
order by 1,3;

-- �޿��� ������� ��ȸ�ϱ�
select trunc(salary,-3) salary, count(*)
from employees
GROUP BY trunc(salary,-3)
order by salary;

-- having ���� ����ؼ� �׷��� �����ϱ�
-- �޿��� ������� ��ȸ���� ��, �������� 10�� �̻��� �޿��� ������ ������ ��ȸ�ϱ�
select trunc(salary,-3) salary, count(*)
from employees
GROUP BY trunc(salary,-3)
HAVING COUNT(*) >= 10
order by salary;

-- �μ��� ��ձ޿� ��ȸ�ϱ�
-- �μ��� ��ձ޿��� ��ȸ�Ѵ�. ��ձ޿��� �Ҽ������ϴ� ������.
-- ��ձ޿��� 5000�޷� �̸��� �μ��� ��ȸ�ϱ�
select b.department_name dep_name, trunc(avg(a.salary),0)
from employees A, departments B
where b.department_id = a.department_id
GROUP BY b.department_name
having avg(a.salary) < 5000
order by 2;

-- �׷��Լ��� ��ø
-- �μ����� �������� ��ȸ���� �� ���� ���� ������� ����ΰ�?
select max(count(*))
from employees
group by department_id;

-- �޿� ��޺� ������� �޿� ��޺� ��ձ޿��� ��ȸ�ϱ�
-- �޿���ް� �����, ��ձ޿��� ǥ���Ѵ�.
select b.gra, count(*), trunc(avg(salary))
from employees A, job_grades B
where a.SALARY >= b.LOWEST_SAL AND a.SALARY <= b.HIGHEST_SAL
group by b.gra
order by 1;

-- ��������
-- �̸��� Neena�� ����� ���� �ؿ� �Ի��� ������� �̸�, �Ի����� ��ȸ�ϱ�



select first_name, hire_date
from employees
where to_char(hire_date, 'yyyy') = (select to_char(hire_date,'yyyy')
                                    from employees
                                    where first_name = 'Neena');

-- Stephen�� ���� ������ ���� �ϴ� �������� ���̵�� �̸�, �޿��� ��ȸ�ϱ�
select EMPLOYEE_id, FIRST_name, salary
from employees
where job_id = (select job_id
                from employees
                where first_name = 'Stephen');

-- Mozhe�� ���� ������ �����ϰ�, 
-- Mozhe�� �޿����� �޿��� ���� �޴� ������ ���̵�� �̸�, �޿��� ��ȸ�ϱ�
select employee_id, first_name, salary
from employees
where job_id = (select job_id
                from employees
                where first_name = 'Stephen')
and salary > (select salary
                from employees
                where first_name = 'Mozhe');

-- ��ü ������ ��ձ޿����� ���� �޿��� �޴� �������� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select employee_id, first_name, salary
from EMPLOYEES
where salary < (select avg(salary)
                from employees);
                
-- ���� ���� �޿��� �޴� �������� ���̵�, �̸� ,�޿��� ��ȸ�ϱ�
select employee_id, first_name, salary
from EMPLOYEES
where salary = (select min(salary)
                from employees);

-- �μ��� ������� ��ȸ������ ������� ���� ���� �μ��� ���̵��, ������� ��ȸ�ϱ�
select department_id , count(*)
from employees
group by department_id
having count(*) =(select max(count(*))
                  from employees
                  group by department_id);

-- with ���� ����ؼ� �ߺ� ����Ǵ� ���� �۾��� �� ���� ����ǰ� �� �� �ִ�.
-- ������ ���༺���� ����Ų��.
with deptCnt
as (select department_id, count(*) cnt
    from employees
    group by department_id)
select department_id, cnt
from deptCnt
where cnt = (select max(cnt)
             from deptCnt);

-- ������ ��������
-- 50�� �μ����� �ٹ��ߴ� ���� �ִ� ����� ���̵�, �̸�, ����, �ҼӺμ����̵� ��ȸ�ϱ�
select employee_id, first_name, job_id, department_id
from employees 
where employee_id in (select employee_id
                        from job_history
                        where department_id=50);
                        
select A.employee_id, a.first_name, a.job_id, a.department_id current_dept
from employees A, job_history B
where a.employee_id = b.employee_id 
and b.department_id= 50;

-- Seattle �� ��ġ�ϰ� �ִ� �μ��� ������ �������̵�, �̸��� ��ȸ�ϱ�
-- 1. Seattle�� location_id�� ��ȸ�ϱ�
-- 2. �� location_id�� ������ �մ� �μ��� manager_id �� ��ȸ�ϱ�
-- 3. �� manager_id�� �ش��ϴ� �������̵�, �̸��� ��ȸ�ϱ�
select employee_id, first_name
from employees
where employee_id in (select manager_id
                      from departments
                      where location_id = (select location_id
                                           from locations
                                           where city = 'Seattle'))
order by 1;

select a.employee_id, a.first_name
from employees A, departments B, locations C
where a.employee_id = b.manager_id
and b.location_id = c.location_id
and c.city = 'Seattle'
order by 1;

select gra, lowest_sal, highest_sal
from job_grades
where gra in ('A' ,'B');





































