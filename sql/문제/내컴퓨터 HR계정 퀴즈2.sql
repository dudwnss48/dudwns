--1. 모든 직원들의 모든 업무아이디를 조회하기
SELECT DISTINCT job_id
FROM employees;
--2. 급여를 12,000달러 이상 받는 직원의 이름과 급여를 조회하기
select first_name, salary
from EMPLOYEES
where salary >= 12000
order by employee_id;
--3. 직원번호가 176번 직원과 같은 부서에서 근무하는 직원의 아이디와 이름 직종아이디를 조회하기
SELECT b.employee_id, b.first_name, b.job_id
FROM employees A, EMPLOYEES B
where a.employee_id = 176
and a.department_id = b.department_id
order by 1;
--4. 급여를 12,000달러 이상 15,000달러 이하 받는 직원들의 직원 아이디와 이름과 급여를 조회하기
select employee_id, first_name, salary
from employees
where salary BETWEEN 12000 and 15000;
--5. 2005년 1월 1일부터 2000년 6월 30일 사이에 입사한 직원의 아이디, 이름, 업무아이디, 입사일을 조회하기
SELECT employee_id, FIRST_name, job_id , hire_date
FROM employees
where TO_date(hire_date) BETWEEN TO_date('00/06/30') and TO_date('05/01/01')
order by 4;
--6. 급여가 5,000달러와 12,000달러 사이이고, 부서번호가 20 또는 50인 직원의 이름과 급여를 조회하기
select first_name, salary 
from EMPLOYEES
where salary BETWEEN 5000 and 12000
and department_id in (20, 50);
--7. 관리자가 없는 직원의 이름과 업무아이디를 조회하기
select first_name, job_id
from EMPLOYEES
where manager_id is null;
--8. 커미션을 받는 모든 직원의 이름과 급여, 커미션을 급여 및 커미션의 내림차순으로 정렬해서 조회하기
select first_name, salary, commission_pct
from EMPLOYEES
where commission_pct is not null
order by 2,3 desc;
--9. 이름의 2번째 글자가 e인 모든 직원의 이름을 조회하기
select first_name
from EMPLOYEEs
where first_name like '_e%' ;
--10. 업무아이디가 ST_CLERK 또는 SA_REP이고 급여를 2,500달러, 3,500달러, 7,000달러 받는 모든 직원의 이름과 업무아이디, 급여를 조회하기
select first_name, job_id, salary
from EMPLOYEES
where (job_id = 'ST_CLERK'
or job_id = 'SA_REP')
and salary in (2500, 3500, 7000);
--11. 모든 직원의 이름과 입사일, 근무 개월 수를 계산하여 조회하기, 근무개월 수는 정수로 반올림하고, 근무개월수를 기준으로 오름차순으로 정렬하기
select FIRST_name, hire_date, trunc(to_date(sysdate)- to_date(hire_date),0) as 근무개월수
from employees
order by 근무개월수;
--12. 직원의 이름과 커미션을 조회하기, 커미션을 받지 않는 직원은 '없음'으로 표시하기
select first_name, NVL(to_char(commission_pct),'없음')
from employees;

--13. 모든 직원의 이름, 부서번호, 부서이름을 조회하기
select a.first_name, B.department_id, B.department_name
from EMPLOYEES A, departments B
where b.department_id(+) = a.department_id;
--14. 80번부서에 소속된 직원의 이름과 업무아이디, 업무제목, 부서이름을 조회하기
SELECt b.job_id, b.job_title, a.department_name
FROM DEPARTMENTS A, jobs B
where department_id = 80;
--15. 커미션을 받는 모든 직원의 이름과 업무아이디, 업무제목, 부서이름, 부서소재지 도시명을 조회하기
select d.first_name , d.job_id, a.job_title, b.department_name, c.city
from jobs A, departments B, locations C, employees D
where d.commission_pct is not null
and d.department_id = b.department_id
and b.location_id = c.location_id
and d.job_id = a.job_id;
--16. 유럽에 소재지를 두고 있는 모든 부서아이디와 부서이름을 조회하기
select a.department_id, a.department_name
from DEPARTMENTS A, locations B, countries C, regions D
where d.region_name = 'Europe'
and d.region_id = c.region_id
and c.country_id = b.country_id
and b.location_id = a.location_id
order by 1;
--17. 직원의 이름과 소속부서명, 급여, 급여 등급을 조회하기
select a.department_name, b.salary, c.gra
from DEPARTMENTS A, employees B, job_grades C
where a.department_id = b.employee_id
and b.SALARY >= c.LOWEST_SAL AND b.SALARY <= c.HIGHEST_SAL
order by 2;
--18. 직원의 이름과 소속부서명, 소속부서의 관리자명을 조회하기, 소속부서가 없는 직원은 소속부서명 '없음, 관리자명 '없음'으로 표시하기
select a.first_name, nvl(b.department_name,'없음'), nvl(c.first_name,'없음')
from EMPLOYEES A, departments B, EMPLOYEES C
where a.department_id = b.department_id(+)
and b.manager_id = c.employee_id(+);

--19. 모든 사원의 이름, 직종아이디, 급여, 소속부서명을 조회하기
SELECT a.first_name, a.job_id, a.salary, b.department_name
FROM EMPLOYEES A, departments B
where a.department_id = b.department_id(+)
order by a.employee_id;
--20. 모든 사원의 이름, 직종아이디, 직종제목, 급여, 최소급여, 최대급여를 조회하기
select a.first_name, a.job_id, b.job_title , a.salary, b.min_salary, b.max_salary
from employees A, jobs B
where a.job_id = b.job_id;
--21. 모든 사원의 이름, 직종아이디, 직종제목, 급여, 최소급여와 본인 급여의 차이를 조회하기
select a.first_name, a.job_id, b.job_title , a.salary, a.salary - b.min_salary as sal_gap
from employees A, jobs B
where a.job_id = b.job_id
order by 5;

--22. 커미션을 받는 모든 사원의 아이디, 부서이름, 소속부서의 소재지(도시명)을 조회하기
select a.employee_id, b.department_name, c.city
from EMPLOYEES A, departments B, LOCATIONS C
where commission_pct is not null
and a.department_id = b.department_id
and b.location_id = c.location_id;
--23. 이름이 A나 a로 시작하는 모든 사원의 이름과 직종, 직종제목, 급여, 소속부서명을 조회하기
SELECT a.first_name, a.job_id, b.job_title, a.salary, c.department_name
from EMPLOYEES A, jobs B, DEPARTMENTS C
where (a.first_name like 'A%'
or a.first_name like 'a%')
and a.job_id = b.job_id
and a.department_id = c.department_id
order by employee_id;
--24. 30, 60, 90번 부서에 소속되어 있는 사원들 중에서 100에게 보고하는 사원들의 이름, 직종, 급여,
--    급여등급을 조회하기
select a.first_name, a.job_id, b.job_title, a.salary, b.min_salary, b.max_salary, c.gra
from EMPLOYEES A, jobs B, job_grades C
where a.DEPARTMENT_id in (30, 60, 90)
and a.manager_id = 100
and a.job_id = b.job_id
and a.SALARY >= c.LOWEST_SAL AND a.SALARY <= c.HIGHEST_SAL
order by a.employee_id;
--25. 80번 부서에 소속된 사원들의 이름, 직종, 직종제목, 급여, 최소급여, 최대급여, 급여등급, 
--    소속부서명을 조회하기
select a.first_name, a.job_id, b.job_title , a.salary, b.min_salary, b.max_salary, c.gra, d.department_name
from employees A, jobs B, job_grades C, departments D
where a.department_id = 80
and a.SALARY >= c.LOWEST_SAL AND a.SALARY <= c.HIGHEST_SAL
and a.job_id = b.job_id
and a.department_id = d.department_id;
--26. 사원들중에서 자신의 상사보다 먼저 입사한 사원들의 이름, 입사일, 상사의 이름, 상사의 입사일을
--    조회하기
select a.first_name, a.hire_date, b.employee_id, b.hire_date
from EMPLOYEES A, employees B
where a.manager_id = b.employee_id(+)
and b.hire_date >= a.hire_date;
--#########################어렵다#######################
--27. 부서명이 IT인 부서에 근무하는 사원들의 이름과, 직종, 급여, 급여등급, 상사의 이름과 직종을
--    조회하기
select a.first_name, a.job_id, a.salary , b.gra 
from employees A, job_grades B, EMPLOYEES C, departments D
where d.department_name = 'IT'
and a.department_id = d.department_id
and a.SALARY >= b.LOWEST_SAL AND a.SALARY <= B.HIGHEST_SAL
and a.manager_id = c.employee_id;
--28. 'ST_CLERK'로 근무하다가 다른 직종으로 변경한 사원의 아이디, 이름, 변경전 부서명,
--     현재 직종, 현재 근무부서명을 조회하기
select a.department_id, a.first_name, b.department_id, a.job_id, c.department_name 
from EMPLOYEES A, job_history B, DEPARTMENTS C
where b.job_id = 'ST_CLERK'
and b.employee_id = a.employee_id
and a.department_id = c.department_id;