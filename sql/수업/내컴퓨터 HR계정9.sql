-- ���߿� �������� ����ϱ�
-- 'Karen'�� ���� ������ �����ϰ�, ���� �μ��� �ҼӵǾ� �ִ� �����
-- ���̵�, �̸�, ����, �μ����̵� ��ȸ�ϱ�
select job_id, department_id
from employees
where first_name = 'Karen';

SELECT *
FROM employees
where (job_id, department_id) in (select job_id, department_id
                                    from employees
                                    where first_name = 'Karen'); 
-- �μ��� �ְ� �޿��� �޴� ����� ���̵�, �̸�, �޿�, �μ����̵� ��ȸ�ϱ�
select department_id, max(salary)
from employees
where department_id is not null
group by department_id;

select *
from employees
where (department_id , salary) in (select department_id, max(salary)
                                 from employees
                                 where department_id is not null
                                 group by department_id)
order by 1;
                                 
-- ��Į�� �������� ����ϱ�
-- ��ü ��պ��� ���� �޿��� �޴� ����� ���̵�, �̸� �޿� ��ձ޿� , ��ձ޿����� ������
-- ��ȸ�ϱ�
select employee_id, first_name, salary,
        trunc((select avg(salary) from employees) - salary)  as salary_gap
from employees
where salary < (select avg(salary)
                from employees)
order by salary_gap;                         
                                 
-- 20000�޷� �̻��� ��ü ��ձ޿��� 10%�� ���ʽ���, 10000�޷� �̻��� 15%, �� �ܴ� 20%
-- ���ʽ��� �����Ϸ��� �Ѵ�.���̵�, �̸�, �޿�, ���ʽ� ��ȸ�ϱ�
select employee_id , first_name, salary,
    case
        when salary >= 20000 then trunc((select avg(salary) from employees)*0.1)
        when salary >= 10000 then trunc((select avg(salary) from employees)*0.15)
        else trunc((select avg(salary) from employees)*0.2)
    end bonus
from employees;

-- ��ü ��� �޷����� ���� �޿����� �޿��� ���� �޴� ����� �̸�, �޿��� ��ȸ�ϱ�
select outter.first_name, outter.salary
from employees outter
where outter.commission_pct is not null 
and outter.salary > (select avg(inner.salary)
                        from employees inner
                        where inner.department_id - outter.department_id);
                        
-- �ܺ� SQL�� ����Ǿ ���� �����´�.(�ĺ���)
-- �ĺ������ึ�� department_id ���� �����ͼ� ���������� �����״�.
-- ���������� ������� ����ؼ� �ĺ����� �����Ѵ�.
-- �ĺ����� ���� ���� ������ �ݺ��Ѵ�.
                                 
select to_date('20200101', 'yyyymmdd') + level - 1
from dual
connect by level <=31;

-- �μ����̵�, �μ���, �ش�μ��� ������� ��ȸ�ϱ�
select outter.department_id, outter.department_name,
        (select count(*)
         from employees inner
         where inner.department_id = outter.department_id) cnt
from departments outter;
                                 
-- exists ������ ����ϱ�
-- ���������� ������ �ִ� ������ ��ȸ�ϱ�
select *
from EMPLOYEES ���
where (select count(*)
       from EMPLOYEES ����
       where ����.manager_id = ���.employee_id) > 0; -- count() ��� ����õ
       
select *
from EMPLOYEES ���
where exists (select 1
              from employees ����
              where ���.manager_id = ����.manager_id); -- exists ��� ��õ
                                 
-- with ��
with 
dept_costs AS -- �μ��̸�, �μ��ѱ޿�
(select B.department_name, sum(A.salary) as dept_total
from employees A, departments B
where a.department_id = b.department_id
group by b.department_name),
avg_cost AS -- �� ��ձ޿�
(select sum(dept_total)/count(*) as dept_avg
 from dept_costs)
select *
from dept_costs
where dept_total > (select dept_avg   -- �μ��ѱ޿��� ��ձ޿�
                    from avg_cost)
order by department_name;
                                 
-- 118�� ����� ��縦 ��ȸ�ϱ�
select employee_id , first_name
from employees
start with employee_id = 118
connect by prior manager_id = employee_id
order by 1;
                                 
-- 101�� ������ ��� ���� ��ȸ�ϱ�
select  lpad(employee_id, level*4, ' '), first_name, manager_id
from EMPLOYEES
start with employee_id = 101
connect by prior employee_id= manager_id;                                 

-- 100�� ��� �������� ��ȸ
select  level, employee_id, first_name, manager_id
from EMPLOYEES
start with employee_id = 101
connect by prior employee_id= manager_id;                  

-- 100�� ��� �������� ��ȸ, Neena�� ���� (Neena�� ���ϵ� ����)              
select lpad(first_name, length(first_name) + level*5-5, ' ')
from employees
start with employee_id = 100
connect by prior employee_id = manager_id and first_name != 'Neena';
-- 100�� ��� �������� ��ȸ, Neena�� ���� (Neena�� ����)  
select lpad(first_name, length(first_name) + level*5-5, ' ')
from employees
where first_name != 'Neena'
start with employee_id = 100
connect by prior employee_id = manager_id ;
               
-- 100�� �������� ��ȸ�ϱ�              
select lpad(first_name, length(first_name) + level*5-5, ' ')
from employees
start with employee_id = 100
connect by prior employee_id = manager_id and level <=2;

-- 2020/01/01 ~ 2020/12/31 ��¥ �����
select to_date('2020/01/01', 'yyyy/dd/mm') + level -1
from dual
connect by level <= 366;

-- 2003�⵵ ���� �Ի��ڼ� ��ȸ�ϱ�
select to_char(hire_date, 'yyyy-mm'), count(*)
from EMPLOYEES
where to_char(hire_date, 'yyyy') = '2003'
group by to_char(hire_date, 'yyyy-mm')
order by 1;
        
with
months AS
(select '2003-' ||
    case
        when level < 10 then '0' || level
        else to_char(level)
    end mon
from dual
connect by level <= 12),
month_emp_count AS
(select to_char(hire_date, 'yyyy-mm') mon, count(*) cnt
from employees
where to_char(hire_date, 'yyyy') = '2003'
group by to_char(hire_date, 'yyyy-mm'))
select A.mon, nvl(B.cnt,0) cnt
from months A, month_emp_count B
where A.mon = B.mon(+)
order by A.mon asc;

               
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 