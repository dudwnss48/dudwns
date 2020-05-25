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

-- 조인하기
-- 급여를 2500달러 받는 사원의 아이디, 이름, 직종아이디, 소속부서아이디, 소속부서명을 조회하기
--                       emp        emp    emp       emp         
--                                         jop       dept          dept
SELECT EMPLOYEE_id
    , employees.first_name
    , employees.job_id
    , employees.department_id
    , departments.department_name
FROM employees, departments     -- 조인할 테이블을 지정
where employees.department_id = departments.department_id   -- 조인조건 정의
and employees.salary = 2500;    -- 조회조건을 정의

-- 급여를 15000달러 이상 받은 직원의
-- 직원아이디, 이름 ,급여, 직종아이디, 직종제목, 직종최저급여, 직종최고급여를 조회하기
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

-- 부서관리자가 지정된 부서의
-- 부서아이디, 부서명, 도시명, 우편번호, 주소 조회하기 
SELECT a.department_id
    , a.department_name
    , b.city
    , b.postal_code
    , b.street_address
FROM departments a, locations b
where a.manager_id is not null
and a.location_id = b.location_id
ORDER BY a.department_id asc;

-- 관리자 지정된 부서의
-- 부서아이디, 부서명, 관리자아이디, 관리자 이름을 조회하기
SELECT a.department_id
    , a.department_name
    , a.manager_id
    , b.first_name
FROM departments a, employees b
where a.manager_id is not null
and a.manager_id = b.employee_id
ORDER BY a.department_id asc;

-- 3개 이상의 테이블 조인하기
-- 급여를 12000이상 받은 사원의
-- 사원아이디, 이름, 급여, 직종아이디, 직종제목, 소속부서아이디, 소속부서명을 조회하기
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

-- 부서 관리자가 지정된 부서의
-- 부서아이디, 부서명, 관리자의 직원아이디, 직원명, 위치아이디, 도시명, 주소 조회하기
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

-- 부서 관리자가 지정된 부서의
-- 부서아이디, 부서명, 위치아이디, 도시명, 주소, 국가아이디, 국가명 조회하기
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

-- Seattle에서 근무하는 직원의 아이디, 이름, 직종, 소속부서 아이디, 소속부서명을 조회하기
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
-- Seattel에서 소재한 부서에서 근무하는 직원의 아이디, 이름, 직종, 소속부서 아이디,  소속부서 명을 조회하기
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

-- 직종 변경 이력에서 
-- 직원아이디, 직원이름, 업무시작일, 업무종료일, 직종아이디, 직종제목, 부서아이디, 부서명 조회하기
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

-- 비등가 조인
-- 50번 부서에 소속된 직원의 급여 등급을 조회하기
-- 직원아이디, 이름, 급여, 급여등급
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

-- 직종별 최저 급여의 등급 조회하기
-- 직종아이디, 직종제목, 직종최저급여, 급여등급
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

-- 1.  시스템의 현재 날짜와 시간 조회하기 (dual 사용)
SELECT SYSDATE
FROM DUAL;
-- 2.  급여를 5000달러 이상받고, 2005년에 입사한 직원의 아이디, 이름, 급여, 입사일을 조회하기
SELECT EMPLOYEE_ID
    , first_name
    , salary
    , hire_date
FROM employees
WHERE salary >= 5000
AND hire_date LIKE '05%'
order by employee_id;
-- 3.  이름에 e나 E가 포함된 직원 중에서 급여를 10000달러 이상 받는 직원의 아이디, 이름, 급여를 조회하기
SELECT employee_id
    , first_name
    , salary
FROM employees
WHERE first_name LIKE '%E%' 
OR first_name LIKE '%e%'
order by employee_id;
-- 4.  입사년도와 상관없이 4월에 입사한 직원들의 아이디, 이름, 입사일을 조회하기
select employee_id, first_name, hire_date
from employees 
where to_char(hire_date, 'mm') = '04'
order by employee_id;
-- 5.  2006년 상반기(1/1 ~ 6/30)에 입사한 직원들의 아이디, 이름, 입사일 조회하기
SELECT employee_id
    , first_name
    , hire_date
FROM employees
WHERE hire_date >= TO_DATE('2005-01-01', 'YYYY-MM-DD')
AND hire_date <= TO_DATE('2006-06-30', 'YYYY-MM-DD')
order by employee_id;
-- 6.  50번 부서에 소속된 직원들의 급여를 13%인상시키려고 한다.
--     직원아이디, 이름, 현재 급여, 인상된 급여를 조회하기
--     인상된 급여는 소숫점 이하는 버린다.
SELECT employee_id 
    , first_name
    , salary
    , trunc(salary * 1.13) as increased_sal
FROM employees
where department_id = 50
order by employee_id;
-- 7.  50번 부서에 소속된 직원들의 급여를 조회하려고 한다.
--     직원 아이디, 이름, 급여 그리고, 급여 1000달러당 *를 하나씩 표시하라.
--     120 Matthew 8000 ********
--     122 Shanta  6500 ******
select employee_id, first_name, salary, rpad('*', trunc(salary/1000), '*') as increased_sal
from employees 
where department_id = 50
order by employee_id;
-- 8.  관리자가 지정되어 있지 않는 부서의 
--     부서아이디, 부서명, 위치아이디, 도시명, 주소를 조회하기
SELECT b.department_id
    , b.department_name
    , a.location_id
    , a.city
    , a.street_address
FROM DEPARTMENTs b, LOCATIOns A
where manager_id is null
and a.location_id = b.location_id
order by department_id;

-- 9.  'Executive' 부서에 소속된 직원의 직원아이디, 이름, 직종, 급여를 조회하기
SELECT a.employee_id
    , a.first_name
    , a.job_id
    , a.salary
FROM EMPLOYEES A, departments B
where b.department_name = 'Executive'
and a.department_id = b.department_id
order by a.department_id;

-- 10. 100번 직원이 부서관리자로 지정된 부서에 소속된 직원의 직원아이디, 이름, 직종, 급여를 조회하기
select B.employee_id, B.first_name, B.job_id, B.salary 
from departments A, employees B 
where A.manager_id = 100
and A.department_id = B.department_id;
-- 11. 10, 20, 30번 부서에 소속된 직원들의 직원아이디, 이름, 급여, 급여등급을 조회하기
SELECT a.employee_id
    , a.first_name
    , a.salary
    , b.gra
FROM employees a, job_grades b
where a.department_id in (10,20,30)
and A.SALARY >= B.LOWEST_SAL AND A.SALARY <= B.HIGHEST_SAL
order by a.employee_id;
-- 12. 직원들의 직종정보를 참고했을 때 자신이 종사하고 있는 직종의 최저급여를 받고 있는
--     직원의 아이디, 이름, 급여, 직종아이디, 직종최저급여를 조회하기
SELECT a.employee_id
    , a.first_name
    , a.salary
    , a.job_id
    , b.min_salary
FROM employees A, jobs B
where  A.job_id = B.job_id 
and a.salary = b.min_salary
order by a.employee_id;
-- 13. 커미션을 받는 직원들의 직원아이디, 이름, 커미션, 급여, 직종아이디, 직종제목, 급여, 소속부서 아이디, 부서명을 조회하기
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
-- 14. 'Canada'에서 근무하고 있는 직원의 아이디, 이름, 소속부서 아이디, 소속부서명, 위치 아이디, 도시명, 주소를 조회하기
select A.employee_id, A.first_name, B.department_id, B.department_name, C.location_id, C.city, C.street_address
from employees A, departments B, locations C, countries D
where D.country_name = 'Canada'
and A.department_id = B.department_id 
and B.location_id = C.location_id 
and C.country_id = D.country_id;
-- 15. 모든 직원의 직원아이디, 이름, 직종아이디, 직종제목, 급여, 급여등급, 소속부서 아이디, 소속부서명, 도시명을 조회하기
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
-- 16. 급여를 5000달러 이하로 받는 직원들의 아이디, 이름, 직종, 소속부서 아이디, 소속부서명, 소속부서 관리자 직원아이디, 
--     소속부서 관리자 직원이름을 조회하기
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

-- 17. 'Asia'지역에 소재지를 두고 있는 부서의 아이디, 부서명, 부서관리자 이름을 조회하기
SELECt a.employee_id, c.department_name, c.manager_id
FROM EMPLOYEES A, departments C, locations D, countries E, regions B
where a.department_id = c.department_id
and c.location_id = d.location_id
and d.country_id = e.country_id
and e.region_id = b.region_id
and b.region_name = 'Asia'
order by a.employee_id;



-- 18. 101번 직원이 근무했던 부서에서 근무중이 직원의 아이디, 이름, 부서아이디, 부서명을 조회하기
SELECT DISTINCT a.employee_id, a.first_name, c.department_id, c.department_name
FROM EMPLOYEES A, job_history B, departments C
where b.employee_id = 101
and b.department_id = c.department_id
and a.department_id = c.department_id
order by employee_id;

--distinct 사용시기 : 똑같은 값이 중복되서 나왔거나 중복없이 조회하라는 말이 있으면 사용

-- 19. 직원중에서 자신이 종사하고 있는 직종의 최고급여 50%이상을 급여로 받고 있는 
--     직원의 아이디, 이름, 급여, 직종아이디, 직종 최고급여를 조회하기
SELECT a.employee_id, a.first_name, a.salary, b.job_id, b.max_salary
FROM EMPLOYEES A, jobs B
where a.job_id = b.job_id
and a.salary >= b.max_salary*0.5
order by employee_id;

-- 20. 미국(US)에 위치하고 있는 부서의 아이디, 이름, 위치번호, 도시명, 주소를 조회하기 
SELECT a.department_id, a.department_name, a.location_id, b.city, b.street_address
FROM DEPARTMENTS A, LOCATIONS B
where b.country_id = 'US'
and a.location_id = b.location_id
order by a.department_id;

-- 셀프 조인(자체조인)
-- 101번 사원의 이름, 직종, 자신의 상사이름을 조회하기
SELECT emp.first_name as employee_name
    ,emp.job_id
    ,mgr.first_name as manager_name
FROM employees EMP, employees MGR
where emp.employee_id = 101
and emp.manager_id = mgr.employee_id
order by emp.employee_id;

-- 60번 부서에 근무중인 직원의 아이디 이름, 직원의 직종, 상사의 이름 ,상사의 직종, 
-- 부서아이디, 부서명, 부서관리자 아이디, 부서관리자 이름을 조회하기
SELECT 직원.employee_id 직원아이디, 직원.first_name as 직원이름 ,직원.job_id 직원직종
    ,상사.first_name as 상사이름, 상사.job_id 상사직종
    ,부서.department_id "소속부서", 부서.department_name "소속부서 이름", 부서.manager_id "관리자 아이디"
    ,부서관리자.first_name "부서의 관리자 이름"
FROM employees 직원, employees 상사 , departments 부서, employees 부서관리자
where 직원.department_id = 60
and 직원.manager_id = 상사.employee_id              -- 직원과 상사간의 조인조건
and 직원.department_id = 부서.department_id         -- 직원과 소속부서간의 조인조건
and 부서.manager_id = 부서관리자.employee_id         -- 부서와 부서관리자간의 조인조건
order by 직원.employee_id;

-- 포괄 조인
-- 부서아이디, 부서명, 부서관리자아이디, 부서관리자 이릅 조회하기
SELECT a.department_id, a.department_name, a.manager_id, b.first_name
FROM DEPARTMENTS A, EMPLOYEES B
where a.manager_id = b.employee_id(+)
order by DEPARTMENT_id;

-- 모든 직원의 이름, 급여, 직종아이디, 소속부서명을 조회하기
SELECT a.first_name, a.salary, a.job_id, b.department_name
FROM employees A, departments B
where a.department_id = b.department_id(+)
order by a.employee_id;

-- 다중행 함수 사용하기
-- employees의 모등 행의 갯수 조회하기
select count(*)
from employees;

-- 50번 부서에서 일하는 직원의 수를 조회하기
select count(*)
from employees
where department_id = 50;

-- 커미션을 받는 직원의 수를 조회하기
select count(commission_pct)    -- 컬럼을 지정하면 해당 컬럼의 값이 null이 아닌 것만 카운트 한다.
from employees;
 
select count(*)
from employees
where commission_pct is not null;

-- 직원들 중에서 최고급여, 최저급여를 받는 직원의 급여를 조회하기
select max(salary), MIN(salary)
from employees;

-- 최고급여를 받는 사람의 이름과 최고급여를 조회하기
select first_name, max(salary)  -- 오류 : 그룹함수와 그룹함수가 아니니 표현식을 같이 사용할 수 없다.
from employeesl;


select first_name, salary
from employees
where salary = (select max(salary)
                from employees);

-- 조회된 행의 갯수를 구하기
-- count(*) : 조회된 모든 행의 갯수를 반환하다.
-- count(컬럼명) : 해당 컬럼의 값이 null이 아닌 행의 갯수를 반환한다.
-- count(distinct 컬럼명) : 해당컬럼의 값에 대해 중복된 값은 1번망 카운트해서 행의 갯수를 반환한다.
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

-- 조회된 행의 특정 컬럼에 대한 합계를 구하기
-- sum(컬럼명) : 해당컬럼의 값 중에서 null을 제외한 값들의 합계를 반환한다.
select sum(salary)  -- 전체 사원들의 급여 총액
from employees;

select sum(commission_pct)  -- 전체 사원들의 커미션에 대한 합계
from employees;             -- 커미션의 값이 null인 것은 계산에 포함되지 않음

-- 조회된 행의 특정 컬럼에 대한 평균을 구하기
-- avg(컬럼명) : 해당 컬럼의 값 중에서 null을 제외한 값을 가진 행들에 대한 평균값을 반환한다.
select sum(salary)  -- 전체 사원들의 급여 총액
from employees;

select avg(salary)
from employees;

-- 조회된 행의 특정 컬럼에 대한 최대값, 최솟값 구하기
-- min(컬럼명) : 해당 컬럼의 값 중에서 null을 제외한 가장 작은 값을 반환한다.
-- max(컬럼명) : 해당 컬럼의 값 중에서 null을 제외한 가장 큰 값을 반환한다.
select sum(salary)  -- 전체 사원들의 급여 총액
from employees;

select sum(commission_pct)  -- 전체 사원들의 커미션에 대한 합계
from employees;  



-- 직종별 직원수를 조회하기
select job_id, count(*)
from employees
group by job_id;

-- 입사년도별 사원수
select to_char(hire_date, 'yyyy'), count(*)
from employees
group by to_char(hire_date, 'yyyy')
order by 1;









































































