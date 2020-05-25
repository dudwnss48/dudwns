-- 사원 테이블에서 사원 아이디, 이름 , 급여를 조회하기
SELECT JOB_ID, JOB_TITLE
FROM jobs;
-- 부서테이블에서 부서아이디, 부서명을 조회하기
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM departments;
-- 잡아이디, 잡타이틀을 조회하기
SELECT JOB_ID, JOB_TITLE
FROM jobs;
--나라이름 조회하기
SELECT COUNTRY_NAME
FROM countries;
-- 사원아이디, 이름, 급여, 연봉을 조회하기
SELECT EMPLOYEE_ID, first_name, FIRST_NAME, SALARY*12 as years
FROM employees;
-- 사원아이디, 이름, 급여, 10%인상된 급여를 조회하기
SELECT EMPLOYEE_ID as ID, FIRST_NAME as NAME, salary , SALARY*1.1 as "110%SALARY"
FROM employees;
-- 사원아이디, 이름, 급여, 연봉을 조회하기
-- 사원아이디의 별칭은 ID, 이름은 NAME, 급여는 SAL, 연봉은 ANN_SAL로 정의하기
SELECT EMPLOYEE_ID as ID, FIRST_NAME || ' ' ||last_name as NAME, salary as SAL, SALARY*12 as ANN_SAL
FROM employees;
-- 사원아이디, 이름, 급여, 10%인상된 급여를 조회하기
-- 사원아이디의 별칭은 ID, 이름은 NAME, 급여는 SAL, 10%인상된 급여는 INCREMENT SALARY로 정의하기
SELECT EMPLOYEE_ID AS ID, first_name || ' ' ||last_name as NAME ,salary as SAL, SALARY*1.1 as "INCEREMENT SALARY"
FROM employees;

-- NULL 값이 있는 컬럼 조회하기
-- 부서아이디, 부서명, 부서담당자 아이디 조회하기
SELECT DEPARTMENT_ID AS ID, department_NAME AS DEP_NAME, MANAGER_ID AS MNAN_ID
FROM departments WHERE MANAGER_ID IS NOT NULL;

-- 사원아이디, 이름, 급여, 커미션, 커미션이 포함된 급여 조회하기
-- 커미션이 포함된 급여는 급여+ 급여*커미션
SELECT EMPLOYEE_ID as ID, FIRST_NAME || ' ' ||last_name as NAME, salary as SAL,commission_pcT AS COMMISSION, salary+SALARY*commission_pct as COM_SAL
FROM employees WHERE commission_pcT IS NOT NULL;

-- 중복행없이 조회하기
-- 사원들이 종사하고 있는 직종아이디를 전부 조회하기
SELECT DISTINCT JOB_ID
FROM employees;

-- 60번 부서에 근무하는 사원의 아이디, 이름 ,직종, 급여, 부서아이디를 조회하기
SELECT employee_id AS ID, FIRST_NAME || ' ' ||last_name as NAME, job_id ,salary, department_id AS DEP_ID
FROM employees WHERE department_id = 60;

-- 급여를 150000달러 이상 받는 사원의 아이디, 이름 직종, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' ||last_name as NAME, JOB_ID, SALARY
FROM employees
WHERE salary >=15000;


