SELECT EMPLOYEE_ID, job_ID, SALARY, SALARY/(5*24) AS HOURPAY
FROM employees;

--- 행을 제한해서 조회하기
-- 60번 부서에서 근무하는 사원의 아이디, 이름, 직종, 부서 아이디를 조회하기
SELECT employee_id, first_name || ' ' || last_name AS NAME, job_id, department_id
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;
-- 급여를 5000달러 이하로 받는 사원아이디, 이름, 직종, 급여를 조회하기
SELECT employee_id, first_name || ' ' || last_name AS NAME, job_id, SALARY
FROM EMPLOYEES
WHERE salary<=5000;
-- 100번 직원에게 보고하는 직원의 아이디, 이름 조회하기
SELECT EMPLOYEE_ID,  first_name || ' ' || last_name AS NAME
FROM employees
WHERE manager_id=100;
-- 100번 사원이 부서 담당자로 지정된 부서의 아이디, 부서명을 조회하기
SELECT department_id, department_NAME
FROM departments
WHERE manager_id = 100;
-- 직종 최대 급여가 15000달러 이상되는 직종의 아이디, 직종제목, 최대급여 조회하기
SELECT JOB_ID, JOB_TITLE, MAX_SALARY
FROM JOBS
WHERE max_salary>=15000;
-- 시급을 100달러 이상받는 직원의 아이디, 이름, 직종아이디, 급여, 시급을 조회하기
SELECT EMPLOYEE_ID,  first_name || ' ' || last_name AS NAME, job_ID, SALARY, SALARY/(20*24) AS HOURPAY
FROM employees
WHERE SALARY/(5*8)>=100;

-- 이름이 Neena인 사람의 직원아이디, 이름, 이메일, 전화번호를 조회하기
SELECT employee_id, first_name, last_name, email, phone_number
From EMPLOYEEs
where first_name = 'Neena';

-- null 인 경우와 null이 아닌경우를 구분해서 조회하기
-- 커미션이 null인 직원의 직원아이디, 이름, 직종아이디, 소속부서 아이디 조회하기
SELECT EMPLOYee_ID, FIRST_name, job_id ,DEPARTMENT_id
from employees
where commission_pct is null;
-- 커미션이 null이 아닌 직원의 직원아이디, 이름 ,직종아이디, 소속부서 아이디 조회하기
SELECT EMPLOYee_ID, FIRST_name, job_id ,DEPARTMENT_id
from employees
where commission_pct is not null;
-- 소속부서를 배정받지 못한 직원의 아이디, 이름 ,입사일 조회하기
SELECT EMPLOYEE_id, FIRST_name, hire_date
from employees
where department_id is null;
-- 부서 담당자가 지정되지 않은 부서의 아이디, 부서명을 조회하기
SELECT DEPARTMENT_id, department_name
from departments
where manager_id is null;
-- 부서담당자가 지정된 부서의 부서아이디, 부서명, 담당자 직원아이디를 조회하기
SELECT DEPARTMENT_id, department_name, manager_id
from departments
where manager_id is not null;

-- between a and b 사용하기
-- 급여를 1000이상 2000 이하로 받는 사원의 아이디, 이름, 직종, 급여를 조회하기
SELECT employee_id, first_name, job_id, salary
from employees
where salary BETWEEN 2000 and 3000;

-- IN(값1, 값2, 값3, ...) 사용하기
-- 10번 부서와 20번부서에 소속된 사원의 아이디, 이름 , 소속부서 아이디 조회하기
SELECT employee_id, first_name, department_id
from employees
WHERE department_id in(10,20);

-- 50, 60, 70, 80번 부서에  소속되지 않은 사원의 아이디, 이름, 소속부서 아이디 조회하기
SELECT employee_id, first_name, department_id
from employees
WHERE department_id not in(50,60,70,80);

-- 국가아이디가 JP,US인 지역의 위치아이디, 주소, 국가아이디를 조회하기
select location_id, street_address ,country_id
from locations
where country_id in ('JP','US');
-- 직원의 직종아이디가 AD_PRES이거나 AD_VP인 직원의 아이디, 이름, 직종을 조회하기
SELECT employee_id, first_name || ' ' || last_name as name , job_id
from EMPLOYEEs
where job_id in ('AD_PRES', 'AD_VP');
-- 50번 혹은 60번 부서에 근무한 적이 있는 사원의 아이디, 근무시작일, 근무종료일을 조회하기
SELECT employee_id, start_date, end_date
from job_history
where department_id in (50,60);
-- 101 혹은 102번 직원이 상사로 지정된 사원의 아이디, 이름, 매니저아이디를 조회하기
SELECT employee_id, first_name || ' ' || last_name as name , manager_id
from employees
where manager_id in (101,102);

-- 직종아이디가 **_MAN인 직원의 아이디, 이름, 직종아이디, 급여를 조회하기
SELECT employee_id, first_name || ' ' || last_name as name , job_id, salary
from employees
where job_id like '%MAN';

-- 이름이 'A'로 시작하고 이름이 네글자인 직원의 이름을 전부 조회하기
SELECT first_name
from EMPLOYEES
where first_name like 'A___';

-- 이름에 'e'가 포함된 직원의 이름을 전부 조회하기
SELECT first_name
from EMPLOYEEs
where first_name like '%e%';

-- 논리 연산자를 사용해서 2개 이상의 조건을 만족하는 생을 조회하기
-- 80번 부서에서 일하는 직원중 급여가 3000달러 미만인 사원의 아이디, 이름, 급여를 조회하기
SELECT employee_id, first_name || ' ' || last_name as name, salary
from employees
where department_id = 80
and salary < 3000;
-- 50번 부서에서 일하는 직원 중 직종이 매니저인 직원의 직원아이디, 이름 , 직종아이디, 급여를 조회하기
SELECT employee_id, first_name || ' ' || last_name as name , job_id, salary
from EMPLOYEES
where department_id = 50
and job_id like '%MAN%';
-- 50번 부서에서 일하고, 급여를 2500불 이하로 받고,  자신의 매니저의 아이디가 121번인 직원의
-- 아이디, 이름, 입사일, 급여, 직종아이디를 조회하기
select employee_id, first_name || ' ' || last_name as name, hire_date, salary, job_id
from EMPLOYEEs
where department_id =50
and salary<2500
and manager_id = 121;
-- 50번이나 60번 부서에 소속된 직원 중에서 이름이 'A' 로 시작하는 직원의 아이디, 이름, 부서아이디를 조회하기
SELECT employee_id, first_name || ' ' || last_name as name, department_id
from EMPLOYEEs
where department_id in (50,60)
and last_name like 'A%';
SELECT employee_id, first_name || ' ' || last_name as name, department_id
from EMPLOYEEs
where (department_id= 50 or department_id =60)
and last_name like 'A%';

-- 커미션을 받는 직원 중에서 급여를 10000달러 이상 받는
-- 직원의 아이디, 이름, 직종, 입사일, 급여, 연봉을 조회하기
-- 연봉 = 급여*4*12 + 급여 *커미션*4*12 다.
SELECT
    employee_id
    , first_name || ' ' || last_name as name
    , job_id, hire_date
    , salary
    , salary*4*12+salary*commission_pct*4*12 as ann_salary
from EMPLOYEES
where commission_pct is not null
and salary >=10000;

--- 정렬하기
-- 60번 부서에 소속된 사원들의 아이디, 이름, 급여, 입사일를 조회하기
-- 이름순으로 오름차순 정렬하기
SELECT employee_id, last_name || ' ' || first_name AS NAME, salary, hire_date
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY first_name ASC;
-- 60부서에 소속된 사원들의 아이디, 이름 급여, 입사일을 조회하기
-- 이름순으로 내림차순 정렬하기
SELECT employee_id, last_name || ' ' || first_name AS NAME, salary, hire_date
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY first_name DESC;

-- 60부서에 소속된 사원들의 아이디, 이름 급여, 연봉, 입사일을 조회하기
--연봉순으로 오름차순 정렬하기
SELECT employee_id, last_name || ' ' || first_name AS NAME, salary, salary*48 ANNUAL_SALARY, hire_date
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY salary*48; --연산식을 사용해서 정렬하기
-- 60부서에 소속된 사원들의 아이디, 이름 급여,연봉, 입사일을 조회하기
-- 연봉순으로 오름차순 정렬하기
SELECT employee_id, last_name || ' ' || first_name AS NAME, salary, salary*48 ANNUAL_SALARY, hire_date
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY 4; --컬럼의 순번을 사용해서 정렬하기
-- 60부서에 소속된 사원들의 아이디, 이름 급여, 연봉, 입사일을 조회하기
--연봉순으로 오름차순 정렬하기
SELECT employee_id, last_name || ' ' || first_name AS NAME, salary, salary*48 ANNUAL_SALARY, hire_date
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY ANNUAL_SALARY; --별칭을 사용해서 정렬하기
-- 50번 부서에 소속된 직원 중에서 연봉이 200000달러 이상인
-- 직원들의 아이디, 이름 급여, 연봉, 입사일을 조회하기
-- 연봉순으로 오름차순 정렬하기
SELECT employee_id, last_name || ' ' || first_name AS NAME, salary, salary*48 ANNUAL_SALARY, hire_date
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
AND salary*48 >= 200000
ORDER BY ANNUAL_SALARY; --별칭을 사용해서 정렬하기
-- 실행오류
-- SELECT절에서 정의한 별칭은 WHERE절에서 사용할 수 없다.
-- SELECT절에서 정의한 별칭은 ORDER BY 절에서만 사용할 수 있다.
SELECT employee_id, last_name || ' ' || first_name AS NAME, salary, salary*48 ANNUAL_SALARY, hire_date--3
FROM EMPLOYEES --1
WHERE DEPARTMENT_ID = 50--2
AND ANNUAL_SALARY >= 200000 -- 오류
ORDER BY ANNUAL_SALARY; --별칭을 사용해서 정렬하기 --4

-- 50번 부서에서 근무하는 직원들의 이름, 급여를 조회하고
-- 급여순으로 내림차순정렬하고, 만약 급여가 동일하면 이름순으로 오름차순 정렬하기
SELECT first_name AS NAME, SALARY
from EMPLOYEEs
where department_id = 50
ORDER by salary DESC,  first_name;

-- 단일행 함수 중 문자함수 사용하기
-- 사원의 아이디, 이름을 조회하기(이름을 대문자로 표시)
SELECT employee_id
    , upper(first_name)
    , lower(first_name)
    , length(first_name)
    , substr(first_name,1)
    , concat(first_name,last_name)
    , LPAD(first_name, 10, '#')
    , RPAD(first_name, 10, '@')
from EMPLOYEES;

SELECT first_name || ' ' || last_name as name
from employees;

SELECT substr('940703',3,2)
from employees;

select substr(street_address,1,instr(street_address,' ')-1),instr(street_address,' ')
FROM locations;

select replace(first_name,'Ell','eee')
from employees;

-- 숫자 함수 반올림
SELECT
ROUND(1265.737,2) "2",      -- 소수점 2자리로 반올림 해라
ROUND(1265.737,1) "1",      -- 소수점 1자리로 반올림 해라
ROUND(1265.737,0) "0",      -- 일의자리로 반올림 해라
ROUND(1265.737)" ",         -- 일의자리로 반올림 해라
ROUND(1265.737,-1) "-1",    -- 십의자리로 반올림 해라
ROUND(1265.737,-2) "-2"     -- 백의자리로 반올림 해라
FROM DUAL;

-- 숫자 함수 버림
SELECT
TRUNC(1265.737,2) "2",      -- 소수점 2자리까지 버려라
TRUNC(1265.737,1) "1",      -- 소수점 1자리까지 버려라
TRUNC(1265.737,0) "0",      -- 일의자리까지 버려라
TRUNC(1265.737)" ",         -- 일의자리까지 버려라
TRUNC(1265.737,-1) "-1",    -- 십의자리까지 버려라
TRUNC(1265.737,-2) "-2"     -- 백의자리까지 버려라
FROM DUAL;

-- 직원들의 시급을 조회하기
-- 직원아이디, 이름, 직종아이디, 급여, 시급
-- 시급 = 급여*환율/(5*8) 시급은 원단위까지만 표시한다.
SELECT employee_id
    , first_name
    , job_id
    , salary
    , TRUNC(salary*1220.40/(5*8)) PAY_FOR_HOUR
FROM employees
ORDER BY PAY_FOR_HOUR DESC;

-- 숫자 함수 나머지값 구하기
SELECT MOD(12,5)
FROM DUAL;

-- 날짜 함수
-- 현재 날짜와 시간정보 조회하기
SELECT SYSDATE
FROM DUAL;

-- 직원아이디, 직원명, 입사일, 오늘까지 근무한 날짜 조회하기
SELECT EMPLOYEE_ID , FIRST_NAME, HIRE_DATE, TRUNC(SYSDATE-HIRE_DATE) AS "오늘까지 근무한 날짜"
FROM EMPLOYEES;

-- 오늘, 3일전, 1주일전, 1개월전, 3개월전
SELECT SYSDATE "지금"
    , SYSDATE - 3 "3일전"
    , SYSDATE - 7 "일주일전"
    , ADD_MONTHS(SYSDATE,-1) "한달전"
FROM DUAL;

-- 60번 부서에 소속된 사원들의 아이디, 이름, 입사일, 근무한 개월수를 조회하기
-- 개월수는 소숫점부분은 버린다.
SELECT EMPLOYEE_ID
    , first_name
    , hire_date
    , TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date))
FROM employees
WHERE department_id = 60;

-- 오늘부터 3개월 후의 날짜는?
SELECT ADD_MONTHS(SYSDATE,3)
FROM DUAL;

-- 날짜 반올림하기, 버리기
SELECT ROUND(SYSDATE), TRUNC(SYSDATE)
FROM DUAL;

-- 두 날짜간의 일 수 계산하기
-- 현재 날짜에 대해 TRUNC() 함수로 시분초를 전부 0으로 만든 후 날짜를 계산했다.
SELECT employee_id
    , first_name
    , HIRE_DATE
    , SYSDATE - hire_date
    , TRUNC(SYSDATE) -hire_date
FROM employees;

SELECT LAST_DAY(TRUNC(SYSDATE))
FROM DUAL;

--오늘을 기준으로 다음 번 토요일
SELECT NEXT_DAY(TRUNC(SYSDATE),7)
FROM DUAL;

SELECT NEXT_DAY(TRUNC(SYSDATE),6)
FROM DUAL;
-- 오늘을 기준으로 다음 번 일요일
SELECT NEXT_DAY(TRUNC(SYSDATE),1)
FROM DUAL;

-- 변환 함수
-- 날짜를 문자로 변환하기
SELECT TO_CHAR(SYSDATE,'YYYY') 년
    , TO_CHAR(SYSDATE,'MM') 월
    , TO_CHAR(SYSDATE,'DD') 일
    , TO_CHAR(SYSDATE,'DAY') 요일
    , TO_CHAR(SYSDATE,'AM') "오전/오후"
    , TO_CHAR(SYSDATE,'HH') 시간  
    , TO_CHAR(SYSDATE,'HH24') 시간
    , TO_CHAR(SYSDATE,'MI') 분
    , TO_CHAR(SYSDATE,'SS') 초
FROM DUAL;

-- 2003년도에 입사한 사원의 아이디, 이름, 입사한 달을 조회하기
SELECT employee_id, first_name, TO_CHAR(hire_date,'MM')
FROM EMPLOYEES
WHERE TO_CHAR(hire_date, 'YYYY') = '2003';
-- 입사일이 오늘 날짜와 같은 날짜에 입사한 사원의 아이디, 이름, 입사일을 조회하기
SELECT employee_id, first_name, hire_date
FROM EMPLOYEES
WHERE TO_CHAR(hire_date, 'MMDD') = TO_CHAR(SYSDATE,'MMDD');

-- 특정 날짜를 나타내는 문자를 날짜(DATE 타입)로 변환하기
SELECT TO_DATE('2018-12-31', 'YYYY-MM-DD')+1000
FROM DUAL;

-- 특정날짜를 나타내는 문자를 날짜로 변환해서 오늘까지의 일수, 개월수를 조회하기
SELECT TRUNC(SYSDATE) - TO_DATE('2016-04-17', 'YYYY-MM-DD')
    , MONTHS_BETWEEN(TRUNC(SYSDATE), TO_DATE('2016-04-17', 'YYYY-MM-DD'))
FROM DUAL;

-- 2005-01-01 ~ 2005-03-31 사이에 입사한 사원의 아이디, 이름 , 입사일, 직종아이디, 조회하기
SELECT employee_id, first_name, hire_date, job_id
FROM EMPLOYEES
WHERE hire_date >= TO_DATE('2005-01-01', 'YYYY-MM-DD')
AND hire_date <= TO_DATE('2005-03-31', 'YYYY-MM-DD')
ORDER BY hire_date;

-- 2003년에 입사한 직원의 아이디, 이름 ,입사일 조회
SELECT employee_id, first_name, hire_date
FROM employees
WHERE TO_CHAR(HIRE_DATE, 'YYYY')= 2003
ORDER BY hire_date;

SELECT employee_id, first_name, hire_date
FROM employees
WHERE hire_date >= TO_DATE('20030101', 'YYYYMMDD')
AND hire_date < TO_DATE('20040101', 'YYYYMMDD')
ORDER BY hire_date;

--묵시적인 형변환
SELECT employee_id, first_name, hire_date
FROM employees
WHERE hire_date >= '2003-01-01'
AND hire_date < '20040101'
ORDER BY hire_date;

SELECT employee_id, first_name, hire_date
FROM employees
WHERE hire_date >= '2003-01-01'
AND hire_date < '2004/01/01'
ORDER BY hire_date;


-- 숫자를 천단위마다 구분자가 포함된 텍스트로 변환해서 조회하기
SELECT TO_CHAR(10000,'9,999,999'), TO_CHAR(10000,'0,000,000')
FROM DUAL;
-- 숫자를 소숫점 2자리에서 반올림한 후 텍스트로 변환해서 조회하기
SELECT TO_CHAR(123.456,'999,999.99'), TO_CHAR(123.456,'000,000.00')
FROM DUAL;

-- 문자를 숫자로 변환해서 사용하기
-- 급여가 15000달러 이상인 직원의 아이디, 이름 ,급여를 조회하기
SELECT employee_id, first_name, salary
FROM EMPLOYEES
WHERE salary >= '15000';

SELECT employee_id, first_name, salary
FROM EMPLOYEES
WHERE salary >= TO_NUMBER('15000');

-- TO_NUMBER() 함수를 반드시 사용해야 하는 경우
SELECT employee_id, first_name, salary
FROM EMPLOYEES
WHERE salary >= TO_NUMBER('15,000', '99,999');

-- NVL()함수
SELECT NVL(10,1)    -- 10이 최종값이다.
    ,NVL(NULL, 1)   -- 1이 최종값이다,
FROM DUAL;

-- 직원아이디, 이름 ,급여, 커미션을 조회하기
-- 커미션값이 NULL인 경우 0으로 조회한다.
SELECT employee_id, first_name, salary, NVL(commission_pct, 0) COMM
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- 직원아이디, 이름 ,실급여를 조회하기
-- 실급여 = 급여 + 급여*커미션이다.
SELECT employee_id
    , first_name
    , salary + salary*commission_pct SAL1
    , salary + salary*NVL(commission_pct,0) SAL2
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- 부서아이디, 부서명, 해당부서 관리자 아이디를 조회하기
-- 관리자 아이디가 NULL인경우 '지정된 관리자 없음' 으로 조회하기
SELECT department_id
    , department_name
    , NVL(TO_CHAR(manager_id),'지정된 관리자 없음')
FROM DEPARTMENTS
ORDER BY department_id;

-- 부서아이디, 부서명, 해당부서 관리자 아이디를 조회하기
-- 관리자 아이디가 NULL인경우 100 직원을 관리자로 지정한다.
SELECT department_id
    , department_name
    , NVL(manager_id,100)
FROM DEPARTMENTS
ORDER BY department_id;

-- MVL2() 함수 사용하기
SELECT NVL2(10,1,0)     --NULL이 아니면 앞
    , NVL2(NULL,1,0)    --NULL이면 뒤
FROM dUAL;


-- 직원아이디, 이름, 커미션 수령여부를 'YES', 'NO'로 조회하기
SELECT EMPLOYEE_ID
    , first_name
    , NVL2(commission_pct, 'YES', 'NO') 수령여부
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- CASE ~WHEN
-- 직원아이디, 이름, 급여, 급여등급 조회하기
-- 급여등급은
-- 20000달러 이상   A등급
-- 10000달러 이상   B등급
-- 5000달러 이상    C등급
-- 그외            D등급
SELECT EMPLOYEE_ID 아이디
    , first_name 이름
    , salary 급여
    , CASE WHEN SALARY >= 20000 THEN 'A등급'
           WHEN SALARY >= 10000 THEN 'B등급'
           WHEN SALARY >= 5000 THEN 'C등급'
           ELSE 'D등급' END 급여등급
FROM employees
ORDER BY employee_id;

-- 직원아이디, 이름, 급여, 인상된 급여 조회하기
-- 급여등급은
-- 20000달러 이상   10%인상
-- 10000달러 이상   15%인상
-- 5000달러 이상    20%인상
-- 그외            25%인상
SELECT EMPLOYEE_ID 아이디
    , first_name 이름
    , salary 급여
    , CASE WHEN SALARY >= 20000 THEN salary*1.1
           WHEN SALARY >= 10000 THEN salary*1.15
           WHEN SALARY >= 5000 THEN salary*1.2
           ELSE 1.25 END "인상된 급여"
FROM employees
ORDER BY SALARY DESC;

-- 직원아이디, 이름, 급여, 인상된급여를 조회하기
-- 인상률은
-- 소속부서가 50번 부서면 10%인상
-- 소속부서가 80번 부서면 15%인상
-- 그 외 부서는 5% 인상
SELECT employee_id
    , FIRST_NAME
    , salary
    , CASE 
        WHEN department_id = 50 THEN SALARY*1.1
        WHEN DEPARTMENT_ID = 80 THEN SALARY*1.15
        ELSE SALARY*1.05
        END INCRESED_SALARY
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;
--비교 말고 같은값일때만 가능
SELECT employee_id
    , FIRST_NAME
    , salary
    , CASE department_id
        WHEN 50 THEN SALARY*1.1
        WHEN 80 THEN SALARY*1.15
        ELSE SALARY*1.05
        END INCRESED_SALARY
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

SELECT employee_id
    , FIRST_NAME
    , salary
    , DECODE (department_id, 50, SALARY*1.1
                           , 80, SALARY*1.15
                               , SALARY*1.05) INCRESED_SALARY
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- DECODE()함수를 사용해서 조회하기
-- 직원아이디, 이름, 급여, 인상된 급여 조회하기
-- 인상률
-- 20000달러 이상   10%인상
-- 10000달러 이상   15%인상
-- 5000달러 이상    20%인상
-- 그외            25%인상
SELECT EMPLOYEE_ID 아이디
    , first_name 이름
    , salary 급여
    , DECODE (TRUNC(SALARY,-4) , 20000, 'A'
                               , 10000, 'B'
                               , DECODE(TRUNC(SALARY/5000)*5000 , 5000, 'C'
                                                                      , 'D')) "급여 등급"
FROM employees
ORDER BY SALARY DESC;
















