-- 전화번호 조회하기, 실행성공
SELECT *
FROM SCOTT.CONTACTS;

-- 전화번호 변경하기, 실행성공
UPDATE SCOTT.CONTACTS
SET 
    CONTACT_TEL = '010-1122-3344'
WHERE 
    contact_name = '홍길동';

-- 이름 변경하기, 객체권한 부족으로 실행오류    
UPDATE SCOTT.contacts
SET 
    contact_name = '강감찬'
WHERE 
    contact_name = '김유신';
    
      
-- SCOTT.CONTACTS에 대한 테이블의 동의어를 생성하기
CREATE SYNONYM CONTACTS FOR SCOTT.CONTACTS;

SELECT
    *
FROM CONTACTS;

-- 사용자의 모든 테이블 정보 조회
SELECT
    *
FROM USER_TABLES;

-- 사용자의 모든 뷰 정보 조회
SELECT
    *
FROM USER_VIEWS;

-- 사용자의 모든 시퀀스 정보 조회
SELECT
    *
FROM user_sequences;

-- 모든 사용자 정보 조회
SELECT
    *
FROM USER_USERS;


-- 집합 연산자 사용하기
-- 모든 사원의 현재 및 이전에 근무했던 직종을 조회하기
-- 사원별로 한번씩만 표시하기
SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
UNION
SELECT EMPLOYEE_ID, JOB_ID
FROM JOB_HISTORY;

-- 모든 사원의 현재 부서아이디와 이전 소속부서 아이디를 조회하기
SELECT EMPLOYEE_ID, department_id
FROM EMPLOYEES
UNION ALL
SELECT EMPLOYEE_ID, department_id
FROM JOB_HISTORY;

-- 현재 종사하는 직종과 같은 직종에서 종사하고 있는 사원의 아이디와 직족아이디 조회하기
SELECT EMPLOYEE_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

SELECT A.EMPLOYEE_ID, A.JOB_ID
FROM EMPLOYEES A, job_history B
WHERE A.EMPLOYEE_ID = b.employee_id
AND a.job_id = b.job_id;

-- 직종이 변경된 적이 없는 사원의 아이디를 조회하기
SELECT EMPLOYEE_ID
FROM employees
MINUS
SELECT EMPLOYEE_ID 
FROM job_history;


-- 직종이 변경된 적이 없는 사원의 아이디, 이름을 조회하기
SELECT a.employee_id, b.FIRST_NAME
FROM (SELECT EMPLOYEE_ID
      FROM employees
      MINUS
      SELECT EMPLOYEE_ID 
      FROM job_history) A, employees B
WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID
ORDER BY 1;

-- 직종이 변경된 적이 없는 사원의 아이디, 이름, 직종을 조회하기
SELECT a.employee_id, b.FIRST_NAME, b.job_id
FROM (SELECT EMPLOYEE_ID
      FROM employees
      MINUS
      SELECT EMPLOYEE_ID 
      FROM job_history) A, employees B
WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID
ORDER BY 1;

-- 모든 사원의 현재 및 이전에 근무했던 직종을 조회하기
-- 사원아이디, 직종, 급여를 조회하기
SELECT EMPLOYEE_ID, JOB_ID, SALARY
FROM EMPLOYEES
UNION
SELECT EMPLOYEE_ID, JOB_ID, 0
FROM JOB_HISTORY;



















    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    