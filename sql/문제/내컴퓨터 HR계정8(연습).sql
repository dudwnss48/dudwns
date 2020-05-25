--1. ������̺��� �޿��� 5000�̻� 12000������ ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_id, first_name, salary
FROM employees
where salary >= 5000
and salary <= 12000;
--2. ������� �Ҽӵ� �μ��� �μ����� �ߺ����� ��ȸ�ϱ�
SELECT DISTINCT b.department_name
FROM employees a, departments b
where b.department_id = a.department_id;
--3. 2007�⿡ �Ի��� ����� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
select EMPLOYEE_id, first_name, hire_date
from employees
where hire_date like '07%';
--4. �޿��� 5000�̻� 12000�����̰�, 20���� 50�� �μ��� �Ҽӵ� ����� ���̵�, �̸�, �޿�, �ҼӺμ����� ��ȸ�ϱ�
SELECT EMPLOYEE_id, first_name, salary, department_id
FROM employees
where salary BETWEEN 5000 and 12000
and department_id in (20, 50);
--5. 100�������� �����ϴ� ����� ���̵�, �̸�, �޿�, �޿������ ��ȸ�ϱ�
select a.EMPLOYee_id, a.first_name, a.salary, b.gra
from employees a, job_grades b
where a.manager_id = 100
and a.salary >= b.lowest_sal
and a.salary <= b.highest_sal;
--6. 80�� �μ��� �ҼӵǾ� �ְ�, 80�� �μ��� ��ձ޿����� ���� �޿��� �޴� ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select b.employee_id, b.first_name, b.salary
from (select  department_id, avg(salary) avg_salary
      from employees
      where department_id = 80
      group by department_id) A, employees B
where a.department_id = b.department_id
and b.department_id = 80
and b.salary < a.avg_salary;

--7. 50�� �μ��� �Ҽӵ� ��� �߿��� �ش� ������ �ּұ޿����� 2�� �̻��� �޿��� �޴� ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select a.employee_id, a.first_name, a.salary
from employees a, jobs b
where a.job_id = b.job_id
and a.department_id = 50
and a.salary >= b.min_salary*2;
--8. ����� �߿��� �ڽ��� ��纸�� ���� �Ի��� ����� ���̵�, �̸�, �Ի���, ����� �̸�, ����� �Ի����� ��ȸ�ϱ�
select c.employee_id, c.first_name, c.hire_date, d.first_name, d.hire_date
from EMPLOYEEs c, employees d
where c.hire_date < d.hire_date
and d.employee_id = c.manager_id;
--9. Steven King �� ���� �μ����� �ٹ��ϴ� ����� ���̵�� �̸��� ��ȸ�ϱ�
select b.employee_id, b.first_name || ' ' || b.last_name as name
from(select employee_id,first_name, department_id
    from employees 
    where first_name = 'Steven'
    and last_name = 'King') a, employees b
where a.department_id = b.department_id;

select employee_id, first_name
from employees
where department_id in (select department_id
                        from employees
                        where first_name = 'Steven'
                        and last_name = 'King');

--10. �����ں� ������� ��ȸ�ϱ�, �����ھ��̵�, ������� ����Ѵ�. ������ ���̵� ������ �������� ����
SELECT manager_id , count(*) cnt
FROM employees
group by manager_id
ORDER by 1;
--11. Ŀ�̼��� �޴� ����� ���̵�, �̸�, �޿�, Ŀ�̼��� ��ȸ�ϱ�
select EMPLOYEE_id, first_name, salary, commission_pct
from employees
where commission_pct is not null;
--12. �޿��� ���� ���� �޴� ��� 3���� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select rownum, employee_id,first_name,salary
from (select salary, first_name, employee_id
        from employees
        order by salary desc)
where ROWNUM <= 3;

--13. 'Ismael'�� ���� �ؿ� �Ի��߰�, ���� �μ��� �ٹ��ϴ� ����� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
select a.employee_id, a.first_name, a.hire_date
from EMPLOYEEs a
where a.hire_date >= (select TO_DATE(to_char(hire_date, 'yyyy')||'0101', 'yyyymmdd')
                      from employees
                      where first_name = 'Ismael')
and hire_date < (select TO_DATE(to_char(hire_date, 'yyyy')|| '1231', 'yyyymmdd') + 1
                  from employees
                  where first_name = 'Ismael');

--14. 'Renske'���� ����޴� ����� ���̵�� �̸�, �޿�, �޿� ����� ��ȸ�ϱ�
select a.employee_id, a.first_name , a.salary, b.gra
from employees A, job_grades B
where a.salary >= b.lowest_sal and a.salary <= b.highest_sal
and a.employee_id = (select manager_id
                     from employees
                     where first_name = 'Renske');
--15. ������̺��� �޿��� �������� �޿������ ��ȸ���� ��, �޿���޺� ������� ��ȸ�ϱ�
select Y.gra, nvl(cnt,0)
from(select b.gra, count(*) cnt
     from employees A, job_grades B
     where a.salary >= b.lowest_sal(+) and a.salary <= b.highest_sal(+)
     GROUP BY b.gra
     order by 1) X, job_grades Y
where X.gra(+) = Y.gra
order by y.gra;

--16. �Ի��ڰ� ���� �����⵵�� ���ؿ� �Ի��� ������� ��ȸ�ϱ�
select to_char(hire_date, 'yyyy') as year, count(*) cnt
from employees
group by to_char(hire_date, 'yyyy')
having count(*) = (select min(COUNT(*))
                    from employees
                    group by to_char(hire_date, 'yyyy'));
                    
with year_count
as (select to_char(hire_date, 'yyyy') year, count(*) cnt
    from employees
    group by to_char(hire_date, 'yyyy'))
select year, cnt
from year_count
where cnt = (select min(cnt)
             from year_count);
--17. �����ں� ������� ��ȸ������ �����ڴ� ������� 10���� �Ѵ� �������� ���̵�� ������� ��ȸ�ϱ�
select manager_id , count(*) cnt
from employees
where manager_id is not null
group by manager_id
HAVING count(*) > 10;
--18. 'Europe'�������� �ٹ����� ����� ���̵�, �̸�, �ҼӺμ���, ������ ���ø�, �����̸��� ��ȸ�ϱ�
select e.employee_id, e.first_name, d.department_name, c.city, b.country_name
from regions A, countries B, locations C, departments D, employees E
where a.region_name = 'Europe'
and a.region_id = b.region_id
and b.country_id = c.country_id
and c.location_id = d.location_id
and d.department_id = e.department_id;

--19. ��ü ����� ������̵�, �̸� , �޿�, �ҼӺμ����̵�, �ҼӺμ���, ����� �̸��� ��ȸ�ϱ�
select ���.employee_id, ���.first_name, ���.salary, ���.department_id, �μ�.department_name, ���.first_name
from employees ���,employees ���, departments �μ�
where ���.manager_id = ���.employee_id
and ���.department_id = �μ�.department_id;

--20. 50�� �μ��� �ٹ����� ������� �޿��� 500�޷� �λ��Ű��
UPDATE employees
SET
SALARY = SALARY + 500
where department_id = 50;

--21. ����� ���̵�, �̸�, �޿�, ���ʽ��� ��ȸ�ϱ�,
-- ���ʽ��� 20000�޷� �̻��� �޿��� 10%, 10000�޷� �̻��� �޿��� 15%, �� �ܴ� �޿��� 20%�� �����Ѵ�.
select employee_id, first_name, salary,
    case
        when salary >=20000 then trunc(salary*0.1)
        when salary >=10000 then trunc(salary*0.15)
        else salary*0.2
    end bonus
from EMPLOYEES;
--22. �ҼӺμ����� �Ի����� ������, �� ���� �޿��� �޴� ����� �̸�, �Ի���, �ҼӺμ���, �޿��� ��ȸ�ϱ�
select distinct �Ĺ�.first_name, �Ĺ�.department_id, �Ĺ�.salary, �Ĺ�.hire_date
from employees �Ĺ�, EMPLOYEES ����
where �Ĺ�.department_id = ����.department_id
and �Ĺ�.salary > ����. salary
and �Ĺ�.hire_date > ����.hire_date
order by �Ĺ�.first_name;

--23. �μ��� ��ձ޿��� ��ȸ���� �� �μ��� ��ձ޿��� 10000�޷� ������ �μ��� ���̵�, �μ���, ��ձ޿���
--  ��ȸ�ϱ� (��ձ޿��� �Ҽ��� 1�ڸ������� ǥ��)
select  a.department_id, b.department_name, trunc(avg(a.salary)) dept_avg_salary
from EMPLOYees A , departments B
where a.department_id = b.department_id
group by A.department_id, b.department_name
having avg(a.salary)<= 10000
order by a. department_id;
--24. ����� �߿��� �ڽ��� �����ϰ� �ִ� ������ �ִ�޿��� ������ �޿��� �޴� ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select a.employee_id, a.first_name, a.salary, a.job_id, b.max_salary
from EMPLOYEES A, jobs B
where a.job_id = b.job_id
and a.salary = b. max_salary;
--25. �м��Լ��� ����ؼ� ������� �޿������� �������� �����ϰ�, ������ �ο����� �� 6~10��°�� ���ϴ� ����, 
--    ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select a.num, a.employee_id, a.first_name, a.salary, b.gra
from(select num, employee_id, first_name, salary
     from (SELECT row_number() OVER(ORDER BY SALARY DESC) num, employee_id, first_name, salary
           FROM employees)
     where num >= 6 and num <=10) A, job_grades B
where a.salary >= b.lowest_sal and a.salary <= b.highest_sal;

















