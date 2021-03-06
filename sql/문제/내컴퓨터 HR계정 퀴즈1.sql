-- 부서테이블의 모든 부서 정보를 조회하기
SELECT department_id, department_name, location_id, manager_id
from departments;
-- 부서테이블에서 위치아이디가 1700번이 아닌 부서 정보 조회하기
SELECT department_id, department_name, location_id, manager_id
from DEPARTMENTS
where LOCATION_id != 1700;
-- 100사원이 관리하는 부서정보 조회하기
SELECT  department_id, department_name, location_id, manager_id
from DEPARTMENTS
where manager_id = 100;
-- 부서명이 'IT'인 부서의 정보 조회하기
SELECT department_id, department_name, location_id, manager_id
from DEPARTMENTS
where department_name = 'IT';
-- 위치아이디가 1700번인 지역의 주소, 우편번호, 도시명, 국가코드를 조회하기
SELECT street_address, postal_code, city, country_id
from locations
where location_id = 1700;
-- 최소급여가 2000이상 5000이하인 직종의 직종아이디, 직종제목, 최소급여, 최대급여 조회하기
SELECT job_id, job_title, min_salary, max_salary
from jobs
where min_salary between 2000 and 5000; 
-- 최대급여가 20000불을 초과하는 직종의 아이디, 직종제목, 최소급여, 최대급여 조회하기
SELECT job_id, job_title, min_salary, max_salary
from jobs
where max_salary >20000;
-- 100직원에게 보고하는 사원의 아이디, 이름, 부서아이디을 조회하기
SELECT employee_id, first_name, department_id
from EMPLOYEES
where manager_id = 100;
-- 80번 부서에서 근무하고 급여를 8000불 이상 받는 사원의 아이디, 이름, 급여, 커미션포인트 조회하기
SELECT employee_id, first_name, salary, commission_pct
from EMPLOYEES
where department_id = 80
and salary >= 8000;
-- 직종이 SA_REP이고, 커미션포인트가 0.25이상인 사원의 아이디, 이름, 급여, 커미션포인트를 조회하기
SELECT employee_id, first_name, salary, commission_pct
from EMPLOYEES
where job_id = 'SA_REP'
and commission_pct >= 0.25;
-- 80번 부서에 근무하고, 급여가 10000불 이상인 사원의 아이디, 이름, 급여, 연봉을 조회하기
--  연봉 = (급여 + 급여*커미션)*12다
--  연봉의 별칭은 annual_salary다.
SELECT employee_id, first_name, salary, salary*(1+commission_pct)*12 as annual_salary
from EMPLOYEES
where department_id = 80
and salary >= 10000;
-- 80번 부서에 근무하고, 147번 직원에게 보고하는 사원 중에서 커미션이 0.1인 사원의 
--  사원아이디, 이름, 직종, 급여, 커미션포인트를 조회하기
SELECT employee_id, first_name, job_id, salary, commission_pct
from EMPLOYEES
where department_id = 80
and manager_id = 147
and commission_PCT = 0.1;
-- 사원들이 수행하는 직종을 중복없이 조회하기
SELECT distinct job_id
from EMPLOYEES;
-- 사원들이 소속된 부서아이디를 모두 조회하기
SELECT DISTINCT department_id
from EMPLOYEES
where DEPARTMENT_ID is not null;
-- 급여가 12000을 넘는 사원의 이름과 급여를 조회하기
SELECT first_name, salary
from EMPLOYEES
where salary >= 12000;
-- 급여가 5000이상 12000이하인 사원의 이름과 급여를 조회하기
SELECT first_name, salary
from EMPLOYEES
where salary between 5000 and 12000;
-- 2007년에 입사한 사원의 아이디, 이름, 입사일을 조회하기
SELECT employee_id, first_name, hire_date
from EMPLOYEES
where hire_date like '07%';
-- 20과 50번 부서에 소속된 사원의 이름과 부서번호를 조회하고, 이름을 알파벳순으로 정렬해서  조회하기
SELECT first_name, department_id
from EMPLOYEES
where department_id in (20,50)
order by first_name;
-- 급여가 5000이상 12000이하고, 20번과 50번 부서에 소속된 사원의 이름과 급여, 부서번호를 조회하기
SELECT first_name, salary, department_id
from EMPLOYEES
where salary between 5000 and 12000
and department_id in (20,50);
-- 관리자가 없는 사원의 이름과 직종, 급여를 조회하기
SELECT first_name, job_id, salary
from EMPLOYEES
where manager_id is null;
-- 직종이 'SA_MAN'이거나 'ST_MAN'인 직원중에서 급여를 8000이상 받는 사원의 아이디, 이름, 직종, 급여를 조회하기
SELECT employee_id, first_name, job_id, salary
from EMPLOYEES
where (job_id = 'SA_MAN'
or job_id = 'ST_MAN')
and salary >= 8000;