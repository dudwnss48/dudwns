SELECT employees.employee_id
    , employees.email
    , employees.first_name
    , departments.department_id
    , employees.salary
    , job_history.job_id
    ,job_history.start_date 
    ,departments.location_id
    ,job_history.end_date
from employees, departments, job_history

where employees.department_id = departments.department_id
and departments.department_id = job_history.department_id
ORDER BY employees.employee_id ;

-- �����ϱ�
-- �޿��� 2500�޷� �޴� ����� ���̵�, �̸�, �������̵�, �ҼӺμ����̵�, �ҼӺμ����� ��ȸ�ϱ�
--                       emp        emp    emp       emp         
--                                         jop       dept          dept
SELECT EMPLOYEE_id
    , employees.first_name
    , employees.job_id
    , employees.department_id
    , departments.department_name
FROM employees, departments     -- ������ ���̺��� ����
where employees.department_id = departments.department_id   -- �������� ����
and employees.salary = 2500;    -- ��ȸ������ ����

-- �޿��� 15000�޷� �̻� ���� ������
-- �������̵�, �̸� ,�޿�, �������̵�, ��������, ���������޿�, �����ְ�޿��� ��ȸ�ϱ�
SELECt A.employee_id
    , A.first_name
    , A.job_id
    , B.job_title
    , B.min_salary
    , B.max_salary
FROM employees A, jobs B
where salary >= 15000
and A.job_id = b.job_id
ORDER BY A.employee_id;

-- �μ������ڰ� ������ �μ���
-- �μ����̵�, �μ���, ���ø�, �����ȣ, �ּ� ��ȸ�ϱ� 
SELECT a.department_id
    , a.department_name
    , b.city
    , b.postal_code
    , b.street_address
FROM departments a, locations b
where a.manager_id is not null
and a.location_id = b.location_id
ORDER BY a.department_id asc;

-- ������ ������ �μ���
-- �μ����̵�, �μ���, �����ھ��̵�, ������ �̸��� ��ȸ�ϱ�
SELECT a.department_id
    , a.department_name
    , a.manager_id
    , b.first_name
FROM departments a, employees b
where a.manager_id is not null
and a.manager_id = b.employee_id
ORDER BY a.department_id asc;

-- 3�� �̻��� ���̺� �����ϱ�
-- �޿��� 12000�̻� ���� �����
-- ������̵�, �̸�, �޿�, �������̵�, ��������, �ҼӺμ����̵�, �ҼӺμ����� ��ȸ�ϱ�
SELECT a.employee_id
    , a.first_name
    , a.salary
    , a.job_id
    , b.job_title
    , c.department_id
    , c.department_name
FROM employees a, jobs b, departments c
where a.salary >= 12000
and a.job_id = b.job_id
and a.department_id = c.department_id;

-- �μ� �����ڰ� ������ �μ���
-- �μ����̵�, �μ���, �������� �������̵�, ������, ��ġ���̵�, ���ø�, �ּ� ��ȸ�ϱ�
-- dept      dep    dept                        dept
--                  emp                emp      loc      loc       loc
SELECT a.department_id
    , a.department_name
    , a.manager_id
    , b.first_name
    , c.location_id
    , c.city
    , c.street_address
FROM DEPARTMENTS a, employees b, locations c
where a.manager_id is not null
and a.manager_id = b.employee_id
and a.location_id = c.location_id;

-- �μ� �����ڰ� ������ �μ���
-- �μ����̵�, �μ���, ��ġ���̵�, ���ø�, �ּ�, �������̵�, ������ ��ȸ�ϱ�
SELECT a.department_id
    , a.department_name
    , a.location_id
    , b.city
    , b.street_address
    , b.country_id
    , c.country_name
FROM DEPARTMENTS a, locations b, countries c
where a.manager_id is not null
and a.location_id = b.location_id
and b.country_id = c.country_id;

-- Seattle���� �ٹ��ϴ� ������ ���̵�, �̸�, ����, �ҼӺμ� ���̵�, �ҼӺμ����� ��ȸ�ϱ�
-- Loc
--                          EMP   EMP  EMP   EMP              
--                                     JOB   DEPT            DEPT
SELECT a.employee_id
    , a.first_name
    , a.job_id
    , a.department_id
    , B.department_name
FROM EMPLOYEES A , DEPARTMENTS B, LOCATIONS C
where c.city = 'Seattle'
AND A.DEPARTMENT_ID = B. DEPARTMENT_ID
AND B.LOCATION_ID = C.LOCATION_ID
ORDER BY a.employee_id;
-- Seattel���� ������ �μ����� �ٹ��ϴ� ������ ���̵�, �̸�, ����, �ҼӺμ� ���̵�,  �ҼӺμ� ���� ��ȸ�ϱ�
--    loc       loc                    
--              dept                 emp            emp        cdpt
--                                                             defe           dept
SELECT a.EMPLOYEE_ID
    , a.first_name
    , a.job_id
    , b.department_id
    , b.department_name
FROM EMPLOYEES A , DEPARTMENTS B, LOCATIONS C
where c.city = 'Seattle'
and a.department_id = b.department_id
and b.location_id = c.location_id
order by a.employee_id;

-- ���� ���� �̷¿��� 
-- �������̵�, �����̸�, ����������, ����������, �������̵�, ��������, �μ����̵�, �μ��� ��ȸ�ϱ�
-- history              history   history   history             history 
-- emp        emp                            emp(x)              emp(x)
--                                           jobs       jobs      dept      dept    
SELECT a.employee_id
    , a.first_name
    , b.start_date
    , b.end_date
    , b.job_id
    , c.job_title
    , d.department_id
    , d.department_name
FROM employees A, job_history B, jobs C, departments D
where a.employee_id = b.employee_id
and b.job_id = c.job_id
and b.department_id = d.department_id
order by a.employee_id, b.start_date;

create table job_grades (
    gra        char(1)     PRIMARY KEY,
    lowest_sal NUMBER(6,0) not null,
    highest_sal NUMBER(6,0)not null 
);

INSERT INTO job_grades VALUES('A', 1000, 2999);
insert into job_grades values('B', 3000, 5999);
INSERT INTO job_grades VALUES('C', 6000, 9999);
insert into job_grades values('D', 10000, 14999);
INSERT INTO job_grades VALUES('E', 15000, 24999);
insert into job_grades values('F', 25000, 40000);

COMMIT;

-- �� ����
-- 50�� �μ��� �Ҽӵ� ������ �޿� ����� ��ȸ�ϱ�
-- �������̵�, �̸�, �޿�, �޿����
-- EMP        EMP  EMP   
--                GRADE  GRADE 
SELECT a.employee_id
    , a.first_name
    , a.salary
    , b.lowest_sal
    , b.highest_sal
    , b.gra
FROM EMPLOYEES A, JOB_GRADES B
WHERE a.department_id = 50
AND A.SALARY >= b.lowest_sal
AND a.salary <= b.highest_sal
ORDER BY a.employee_id;

-- ������ ���� �޿��� ��� ��ȸ�ϱ�
-- �������̵�, ��������, ���������޿�, �޿����
--  JOB         JOB     JOB        GRADES
SELECT A.job_id
    , A.job_title
    , A.MIN_SALARY
    , b.gra
FROM jobs A, job_grades B
WHERE A.MIN_SALARY >= B.LOWEST_SAL AND A.MIN_SALARY <= B.HIGHEST_SAL
ORDER BY JOB_ID;

SELECT A.job_id
    , A.job_title
    , A.MIN_SALARY
    , b.gra min_salary_GRA
    , a.max_salary
    , c.gra max_salary_GRA
FROM jobs A, job_grades B, job_grades C
WHERE A.MIN_SALARY >= B.LOWEST_SAL AND A.MIN_SALARY <= B.HIGHEST_SAL
AND a.max_salary >= C.lowest_sal AND a.max_salary <= c.highest_sal
ORDER BY JOB_ID;

-- 1.  �ý����� ���� ��¥�� �ð� ��ȸ�ϱ� (dual ���)
SELECT SYSDATE
FROM DUAL;
-- 2.  �޿��� 5000�޷� �̻�ް�, 2005�⿡ �Ի��� ������ ���̵�, �̸�, �޿�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID
    , first_name
    , salary
    , hire_date
FROM employees
WHERE salary >= 5000
AND hire_date LIKE '05%'
order by employee_id;
-- 3.  �̸��� e�� E�� ���Ե� ���� �߿��� �޿��� 10000�޷� �̻� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT employee_id
    , first_name
    , salary
FROM employees
WHERE first_name LIKE '%E%' 
OR first_name LIKE '%e%'
order by employee_id;
-- 4.  �Ի�⵵�� ������� 4���� �Ի��� �������� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
select employee_id, first_name, hire_date
from employees 
where to_char(hire_date, 'mm') = '04'
order by employee_id;
-- 5.  2006�� ��ݱ�(1/1 ~ 6/30)�� �Ի��� �������� ���̵�, �̸�, �Ի��� ��ȸ�ϱ�
SELECT employee_id
    , first_name
    , hire_date
FROM employees
WHERE hire_date >= TO_DATE('2005-01-01', 'YYYY-MM-DD')
AND hire_date <= TO_DATE('2006-06-30', 'YYYY-MM-DD')
order by employee_id;
-- 6.  50�� �μ��� �Ҽӵ� �������� �޿��� 13%�λ��Ű���� �Ѵ�.
--     �������̵�, �̸�, ���� �޿�, �λ�� �޿��� ��ȸ�ϱ�
--     �λ�� �޿��� �Ҽ��� ���ϴ� ������.
SELECT employee_id 
    , first_name
    , salary
    , trunc(salary * 1.13) as increased_sal
FROM employees
where department_id = 50
order by employee_id;
-- 7.  50�� �μ��� �Ҽӵ� �������� �޿��� ��ȸ�Ϸ��� �Ѵ�.
--     ���� ���̵�, �̸�, �޿� �׸���, �޿� 1000�޷��� *�� �ϳ��� ǥ���϶�.
--     120 Matthew 8000 ********
--     122 Shanta  6500 ******
select employee_id, first_name, salary, rpad('*', trunc(salary/1000), '*') as increased_sal
from employees 
where department_id = 50
order by employee_id;
-- 8.  �����ڰ� �����Ǿ� ���� �ʴ� �μ��� 
--     �μ����̵�, �μ���, ��ġ���̵�, ���ø�, �ּҸ� ��ȸ�ϱ�
SELECT b.department_id
    , b.department_name
    , a.location_id
    , a.city
    , a.street_address
FROM DEPARTMENTs b, LOCATIOns A
where manager_id is null
and a.location_id = b.location_id
order by department_id;

-- 9.  'Executive' �μ��� �Ҽӵ� ������ �������̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT a.employee_id
    , a.first_name
    , a.job_id
    , a.salary
FROM EMPLOYEES A, departments B
where b.department_name = 'Executive'
and a.department_id = b.department_id
order by a.department_id;

-- 10. 100�� ������ �μ������ڷ� ������ �μ��� �Ҽӵ� ������ �������̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
select B.employee_id, B.first_name, B.job_id, B.salary 
from departments A, employees B 
where A.manager_id = 100
and A.department_id = B.department_id;
-- 11. 10, 20, 30�� �μ��� �Ҽӵ� �������� �������̵�, �̸�, �޿�, �޿������ ��ȸ�ϱ�
SELECT a.employee_id
    , a.first_name
    , a.salary
    , b.gra
FROM employees a, job_grades b
where a.department_id in (10,20,30)
and A.SALARY >= B.LOWEST_SAL AND A.SALARY <= B.HIGHEST_SAL
order by a.employee_id;
-- 12. �������� ���������� �������� �� �ڽ��� �����ϰ� �ִ� ������ �����޿��� �ް� �ִ�
--     ������ ���̵�, �̸�, �޿�, �������̵�, ���������޿��� ��ȸ�ϱ�
SELECT a.employee_id
    , a.first_name
    , a.salary
    , a.job_id
    , b.min_salary
FROM employees A, jobs B
where  A.job_id = B.job_id 
and a.salary = b.min_salary
order by a.employee_id;
-- 13. Ŀ�̼��� �޴� �������� �������̵�, �̸�, Ŀ�̼�, �޿�, �������̵�, ��������, �޿�, �ҼӺμ� ���̵�, �μ����� ��ȸ�ϱ�
SELECT a.employee_id
    , a.first_name
    , a.commission_pct
    , a.salary
    , b.job_id
    , b.job_title
    , c.department_id
    , c.department_name
FROM employees A, jobs B, departments C
where a.commission_pct IS not null
and a.job_id = b.job_id
and a.department_id = c.department_id 
order by a.employee_id;
-- 14. 'Canada'���� �ٹ��ϰ� �ִ� ������ ���̵�, �̸�, �ҼӺμ� ���̵�, �ҼӺμ���, ��ġ ���̵�, ���ø�, �ּҸ� ��ȸ�ϱ�
select A.employee_id, A.first_name, B.department_id, B.department_name, C.location_id, C.city, C.street_address
from employees A, departments B, locations C, countries D
where D.country_name = 'Canada'
and A.department_id = B.department_id 
and B.location_id = C.location_id 
and C.country_id = D.country_id;
-- 15. ��� ������ �������̵�, �̸�, �������̵�, ��������, �޿�, �޿����, �ҼӺμ� ���̵�, �ҼӺμ���, ���ø��� ��ȸ�ϱ�
select A.employee_id, A.first_name
    , B.job_id, B.job_title
    , A.salary,  C.gra
    , D.department_id, D.department_name
    , E.city
from employees A, jobs B, job_grades C, departments D, locations E
where A.job_id = B.job_id 
and A.salary >= C.lowest_sal and A.salary <= C.highest_sal 
and A.department_id = D.department_id 
and D.location_id = E.location_id 
order by A.employee_id;
-- 16. �޿��� 5000�޷� ���Ϸ� �޴� �������� ���̵�, �̸�, ����, �ҼӺμ� ���̵�, �ҼӺμ���, �ҼӺμ� ������ �������̵�, 
--     �ҼӺμ� ������ �����̸��� ��ȸ�ϱ�
SELECT a.employee_id
    , a.first_name
    , a.job_id
    , a.salary
    , b.department_id
    , b.department_name
    , b.manager_id
    , c.first_name
FROM employees A, departments B, EMPLOYEES c
where a.salary <= 5000
and a.department_id = b.department_id
and b.manager_id = c.employee_id
order by EMPLOYEE_id;

-- 17. 'Asia'������ �������� �ΰ� �ִ� �μ��� ���̵�, �μ���, �μ������� �̸��� ��ȸ�ϱ�
SELECt a.employee_id, c.department_name, c.manager_id
FROM EMPLOYEES A, departments C, locations D, countries E, regions B
where a.department_id = c.department_id
and c.location_id = d.location_id
and d.country_id = e.country_id
and e.region_id = b.region_id
and b.region_name = 'Asia'
order by a.employee_id;



-- 18. 101�� ������ �ٹ��ߴ� �μ����� �ٹ����� ������ ���̵�, �̸�, �μ����̵�, �μ����� ��ȸ�ϱ�
SELECT DISTINCT a.employee_id, a.first_name, c.department_id, c.department_name
FROM EMPLOYEES A, job_history B, departments C
where b.employee_id = 101
and b.department_id = c.department_id
and a.department_id = c.department_id
order by employee_id;

--distinct ���ñ� : �Ȱ��� ���� �ߺ��Ǽ� ���԰ų� �ߺ����� ��ȸ�϶�� ���� ������ ���

-- 19. �����߿��� �ڽ��� �����ϰ� �ִ� ������ �ְ�޿� 50%�̻��� �޿��� �ް� �ִ� 
--     ������ ���̵�, �̸�, �޿�, �������̵�, ���� �ְ�޿��� ��ȸ�ϱ�
SELECT a.employee_id, a.first_name, a.salary, b.job_id, b.max_salary
FROM EMPLOYEES A, jobs B
where a.job_id = b.job_id
and a.salary >= b.max_salary*0.5
order by employee_id;

-- 20. �̱�(US)�� ��ġ�ϰ� �ִ� �μ��� ���̵�, �̸�, ��ġ��ȣ, ���ø�, �ּҸ� ��ȸ�ϱ� 
SELECT a.department_id, a.department_name, a.location_id, b.city, b.street_address
FROM DEPARTMENTS A, LOCATIONS B
where b.country_id = 'US'
and a.location_id = b.location_id
order by a.department_id;

-- ���� ����(��ü����)
-- 101�� ����� �̸�, ����, �ڽ��� ����̸��� ��ȸ�ϱ�
SELECT emp.first_name as employee_name
    ,emp.job_id
    ,mgr.first_name as manager_name
FROM employees EMP, employees MGR
where emp.employee_id = 101
and emp.manager_id = mgr.employee_id
order by emp.employee_id;

-- 60�� �μ��� �ٹ����� ������ ���̵� �̸�, ������ ����, ����� �̸� ,����� ����, 
-- �μ����̵�, �μ���, �μ������� ���̵�, �μ������� �̸��� ��ȸ�ϱ�
SELECT ����.employee_id �������̵�, ����.first_name as �����̸� ,����.job_id ��������
    ,���.first_name as ����̸�, ���.job_id �������
    ,�μ�.department_id "�ҼӺμ�", �μ�.department_name "�ҼӺμ� �̸�", �μ�.manager_id "������ ���̵�"
    ,�μ�������.first_name "�μ��� ������ �̸�"
FROM employees ����, employees ��� , departments �μ�, employees �μ�������
where ����.department_id = 60
and ����.manager_id = ���.employee_id              -- ������ ��簣�� ��������
and ����.department_id = �μ�.department_id         -- ������ �ҼӺμ����� ��������
and �μ�.manager_id = �μ�������.employee_id         -- �μ��� �μ������ڰ��� ��������
order by ����.employee_id;

-- ���� ����
-- �μ����̵�, �μ���, �μ������ھ��̵�, �μ������� �̸� ��ȸ�ϱ�
SELECT a.department_id, a.department_name, a.manager_id, b.first_name
FROM DEPARTMENTS A, EMPLOYEES B
where a.manager_id = b.employee_id(+)
order by DEPARTMENT_id;

-- ��� ������ �̸�, �޿�, �������̵�, �ҼӺμ����� ��ȸ�ϱ�
SELECT a.first_name, a.salary, a.job_id, b.department_name
FROM employees A, departments B
where a.department_id = b.department_id(+)
order by a.employee_id;

-- ������ �Լ� ����ϱ�
-- employees�� ��� ���� ���� ��ȸ�ϱ�
select count(*)
from employees;

-- 50�� �μ����� ���ϴ� ������ ���� ��ȸ�ϱ�
select count(*)
from employees
where department_id = 50;

-- Ŀ�̼��� �޴� ������ ���� ��ȸ�ϱ�
select count(commission_pct)    -- �÷��� �����ϸ� �ش� �÷��� ���� null�� �ƴ� �͸� ī��Ʈ �Ѵ�.
from employees;
 
select count(*)
from employees
where commission_pct is not null;

-- ������ �߿��� �ְ�޿�, �����޿��� �޴� ������ �޿��� ��ȸ�ϱ�
select max(salary), MIN(salary)
from employees;

-- �ְ�޿��� �޴� ����� �̸��� �ְ�޿��� ��ȸ�ϱ�
select first_name, max(salary)  -- ���� : �׷��Լ��� �׷��Լ��� �ƴϴ� ǥ������ ���� ����� �� ����.
from employeesl;


select first_name, salary
from employees
where salary = (select max(salary)
                from employees);

-- ��ȸ�� ���� ������ ���ϱ�
-- count(*) : ��ȸ�� ��� ���� ������ ��ȯ�ϴ�.
-- count(�÷���) : �ش� �÷��� ���� null�� �ƴ� ���� ������ ��ȯ�Ѵ�.
-- count(distinct �÷���) : �ش��÷��� ���� ���� �ߺ��� ���� 1���� ī��Ʈ�ؼ� ���� ������ ��ȯ�Ѵ�.
select count(*)
from employees;             -- 107

select count(job_id)
from employees;             -- 107

select count(distinct job_id)
from employees;             -- 19

select count(distinct to_char(hire_date, 'yyyy'))
from employees;             -- 8

select distinct to_char(hire_date, 'yyyy')
from employees;

-- ��ȸ�� ���� Ư�� �÷��� ���� �հ踦 ���ϱ�
-- sum(�÷���) : �ش��÷��� �� �߿��� null�� ������ ������ �հ踦 ��ȯ�Ѵ�.
select sum(salary)  -- ��ü ������� �޿� �Ѿ�
from employees;

select sum(commission_pct)  -- ��ü ������� Ŀ�̼ǿ� ���� �հ�
from employees;             -- Ŀ�̼��� ���� null�� ���� ��꿡 ���Ե��� ����

-- ��ȸ�� ���� Ư�� �÷��� ���� ����� ���ϱ�
-- avg(�÷���) : �ش� �÷��� �� �߿��� null�� ������ ���� ���� ��鿡 ���� ��հ��� ��ȯ�Ѵ�.
select sum(salary)  -- ��ü ������� �޿� �Ѿ�
from employees;

select avg(salary)
from employees;

-- ��ȸ�� ���� Ư�� �÷��� ���� �ִ밪, �ּڰ� ���ϱ�
-- min(�÷���) : �ش� �÷��� �� �߿��� null�� ������ ���� ���� ���� ��ȯ�Ѵ�.
-- max(�÷���) : �ش� �÷��� �� �߿��� null�� ������ ���� ū ���� ��ȯ�Ѵ�.
select sum(salary)  -- ��ü ������� �޿� �Ѿ�
from employees;

select sum(commission_pct)  -- ��ü ������� Ŀ�̼ǿ� ���� �հ�
from employees;  



-- ������ �������� ��ȸ�ϱ�
select job_id, count(*)
from employees
group by job_id;

-- �Ի�⵵�� �����
select to_char(hire_date, 'yyyy'), count(*)
from employees
group by to_char(hire_date, 'yyyy')
order by 1;









































































