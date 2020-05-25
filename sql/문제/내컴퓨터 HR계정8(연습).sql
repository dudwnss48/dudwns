--1. 사원테이블에서 급여가 5000이상 12000이하인 사원의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_id, first_name, salary
FROM employees
where salary >= 5000
and salary <= 12000;
--2. 사원들이 소속된 부서의 부서명을 중복없이 조회하기
SELECT DISTINCT b.department_name
FROM employees a, departments b
where b.department_id = a.department_id;
--3. 2007년에 입사한 사원의 아이디, 이름, 입사일을 조회하기
select EMPLOYEE_id, first_name, hire_date
from employees
where hire_date like '07%';
--4. 급여가 5000이상 12000이하이고, 20번과 50번 부서에 소속된 사원의 아이디, 이름, 급여, 소속부서명을 조회하기
SELECT EMPLOYEE_id, first_name, salary, department_id
FROM employees
where salary BETWEEN 5000 and 12000
and department_id in (20, 50);
--5. 100직원에게 보고하는 사원의 아이디, 이름, 급여, 급여등급을 조회하기
select a.EMPLOYee_id, a.first_name, a.salary, b.gra
from employees a, job_grades b
where a.manager_id = 100
and a.salary >= b.lowest_sal
and a.salary <= b.highest_sal;
--6. 80번 부서에 소속되어 있고, 80번 부서의 평균급여보다 적은 급여를 받는 사원의 아이디, 이름, 급여를 조회하기
select b.employee_id, b.first_name, b.salary
from (select  department_id, avg(salary) avg_salary
      from employees
      where department_id = 80
      group by department_id) A, employees B
where a.department_id = b.department_id
and b.department_id = 80
and b.salary < a.avg_salary;

--7. 50번 부서에 소속된 사원 중에서 해당 직종의 최소급여보다 2배 이상의 급여를 받는 사원의 아이디, 이름, 급여를 조회하기
select a.employee_id, a.first_name, a.salary
from employees a, jobs b
where a.job_id = b.job_id
and a.department_id = 50
and a.salary >= b.min_salary*2;
--8. 사원들 중에서 자신의 상사보다 먼저 입사한 사원의 아이디, 이름, 입사일, 상사의 이름, 상사의 입사일을 조회하기
select c.employee_id, c.first_name, c.hire_date, d.first_name, d.hire_date
from EMPLOYEEs c, employees d
where c.hire_date < d.hire_date
and d.employee_id = c.manager_id;
--9. Steven King 과 같은 부서에서 근무하는 사원의 아이디와 이름을 조회하기
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

--10. 관리자별 사원수를 조회하기, 관리자아이디, 사원수를 출력한다. 관리자 아이디 순으로 오름차순 정렬
SELECT manager_id , count(*) cnt
FROM employees
group by manager_id
ORDER by 1;
--11. 커미션을 받는 사원의 아이디, 이름, 급여, 커미션을 조회하기
select EMPLOYEE_id, first_name, salary, commission_pct
from employees
where commission_pct is not null;
--12. 급여를 가장 많이 받는 사원 3명의 아이디, 이름, 급여를 조회하기
select rownum, employee_id,first_name,salary
from (select salary, first_name, employee_id
        from employees
        order by salary desc)
where ROWNUM <= 3;

--13. 'Ismael'과 같은 해에 입사했고, 같은 부서에 근무하는 사원의 아이디, 이름, 입사일을 조회하기
select a.employee_id, a.first_name, a.hire_date
from EMPLOYEEs a
where a.hire_date >= (select TO_DATE(to_char(hire_date, 'yyyy')||'0101', 'yyyymmdd')
                      from employees
                      where first_name = 'Ismael')
and hire_date < (select TO_DATE(to_char(hire_date, 'yyyy')|| '1231', 'yyyymmdd') + 1
                  from employees
                  where first_name = 'Ismael');

--14. 'Renske'에게 보고받는 사원의 아이디와 이름, 급여, 급여 등급을 조회하기
select a.employee_id, a.first_name , a.salary, b.gra
from employees A, job_grades B
where a.salary >= b.lowest_sal and a.salary <= b.highest_sal
and a.employee_id = (select manager_id
                     from employees
                     where first_name = 'Renske');
--15. 사원테이블의 급여를 기준으로 급여등급을 조회했을 때, 급여등급별 사원수를 조회하기
select Y.gra, nvl(cnt,0)
from(select b.gra, count(*) cnt
     from employees A, job_grades B
     where a.salary >= b.lowest_sal(+) and a.salary <= b.highest_sal(+)
     GROUP BY b.gra
     order by 1) X, job_grades Y
where X.gra(+) = Y.gra
order by y.gra;

--16. 입사자가 가장 적은년도와 그해에 입사한 사원수를 조회하기
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
--17. 관리자별 사원수를 조회했을때 관리자는 사원수가 10명이 넘는 관리자의 아이디와 사원수를 조회하기
select manager_id , count(*) cnt
from employees
where manager_id is not null
group by manager_id
HAVING count(*) > 10;
--18. 'Europe'지역에서 근무중인 사원의 아이디, 이름, 소속부서명, 소재지 도시명, 나라이름을 조회하기
select e.employee_id, e.first_name, d.department_name, c.city, b.country_name
from regions A, countries B, locations C, departments D, employees E
where a.region_name = 'Europe'
and a.region_id = b.region_id
and b.country_id = c.country_id
and c.location_id = d.location_id
and d.department_id = e.department_id;

--19. 전체 사원의 사원아이디, 이름 , 급여, 소속부서아이디, 소속부서명, 상사의 이름을 조회하기
select 사원.employee_id, 사원.first_name, 사원.salary, 사원.department_id, 부서.department_name, 상사.first_name
from employees 사원,employees 상사, departments 부서
where 사원.manager_id = 상사.employee_id
and 사원.department_id = 부서.department_id;

--20. 50번 부서에 근무중인 사원들의 급여를 500달러 인상시키기
UPDATE employees
SET
SALARY = SALARY + 500
where department_id = 50;

--21. 사원의 아이디, 이름, 급여, 보너스를 조회하기,
-- 보너스는 20000달러 이상은 급여의 10%, 10000달러 이상은 급여의 15%, 그 외는 급여의 20%를 지급한다.
select employee_id, first_name, salary,
    case
        when salary >=20000 then trunc(salary*0.1)
        when salary >=10000 then trunc(salary*0.15)
        else salary*0.2
    end bonus
from EMPLOYEES;
--22. 소속부서에서 입사일이 늦지만, 더 많은 급여를 받는 사원의 이름, 입사일, 소속부서명, 급여를 조회하기
select distinct 후배.first_name, 후배.department_id, 후배.salary, 후배.hire_date
from employees 후배, EMPLOYEES 선배
where 후배.department_id = 선배.department_id
and 후배.salary > 선배. salary
and 후배.hire_date > 선배.hire_date
order by 후배.first_name;

--23. 부서별 평균급여를 조회했을 때 부서별 평균급여가 10000달러 이하인 부서의 아이디, 부서명, 평균급여를
--  조회하기 (평균급여는 소숫점 1자리까지만 표시)
select  a.department_id, b.department_name, trunc(avg(a.salary)) dept_avg_salary
from EMPLOYees A , departments B
where a.department_id = b.department_id
group by A.department_id, b.department_name
having avg(a.salary)<= 10000
order by a. department_id;
--24. 사원들 중에서 자신이 종사하고 있는 직종의 최대급여와 동일한 급여를 받는 사원의 아이디, 이름, 급여를 조회하기
select a.employee_id, a.first_name, a.salary, a.job_id, b.max_salary
from EMPLOYEES A, jobs B
where a.job_id = b.job_id
and a.salary = b. max_salary;
--25. 분석함수를 사용해서 사원들을 급여순으로 내림차순 정렬하고, 순번을 부여했을 때 6~10번째에 속하는 순번, 
--    사원의 아이디, 이름, 급여를 조회하기
select a.num, a.employee_id, a.first_name, a.salary, b.gra
from(select num, employee_id, first_name, salary
     from (SELECT row_number() OVER(ORDER BY SALARY DESC) num, employee_id, first_name, salary
           FROM employees)
     where num >= 6 and num <=10) A, job_grades B
where a.salary >= b.lowest_sal and a.salary <= b.highest_sal;

















