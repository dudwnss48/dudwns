-- Top-N분석

-- 50번 부서에 소속된 사원 중에서 급여를 가장 많이 받는 직원 3명을 조회하기
select rownum, salary, first_name
from (select salary, first_name
        from employees
        where department_id = 50
        order by salary desc)
where ROWNUM <= 3;
        
-- 부서별 사원수를 계산했을 때 사원수가 가장 많은 부서 3곳을 조회하기
select rownum, department_id, cnt
from (select department_id, count(*) cnt
        from employees
        group by department_id
        order by cnt desc)
where rownum <= 3;

-- 부서별 사원수를 계산했을 때 사원수가 가장 많은 부서 3곳을 조회하기
-- 부서아이디, 부서명 , 사원수가 출력되어야함.
select b.ranking, a.department_id, a.department_name, b.cnt
from departments A,(select rownum ranking, department_id, cnt
                    from (select department_id, count(*) cnt
                           from employees
                           group by department_id
                           order by cnt desc) 
                           where rownum <= 3)B
where a.department_id = b.department_id ;

-- 가격이 가장 비싼 책 3권을 조회하기
-- 순위, 제목, 가격이 출력되어야 함.
select ROWNUM ranking, book_title, book_price
from (SELECT
        *
        from sample_books
        order by book_price desc)
where ROWNUM <=3;

-- 가격이 가장 비싼 책 3권을 조회했을 때
-- 최긍 1주일 이내에 이 책을 산 사용자를 조회하기
-- 사용자아이디, 사용자 명, 책제목, 구매수량, 구매날짜가 출력되어야 함.
select c.user_id, c.user_name, a.book_title, b.order_price, b.order_amount, b.order_registered_date
from    (select ROWNUM ranking, book_title, book_price,book_no
         from (SELECT *
                from sample_books 
                order by book_price desc)
         where ROWNUM <=3) A, sample_book_orders B, sample_book_users C
where a.book_no = b.book_no
and b.user_id=c.user_id
and b.order_registered_date > sysdate-7;

-- 구매총책을 계산했을 때 구매총액이 가장 많은 사용자의
-- 아이디, 이름 ,총구매금액을 조회하기
select a.user_id, a.user_name, total_price
from sample_book_users A,(select user_id, total_price
                           from (select user_id, sum(order_amount*order_price) total_price
                                from sample_book_orders
                                group by user_id
                                order by total_price desc)
                            where rownum=1) B
where a.user_id = b.user_id;

-- 분석함수 사용하기
-- 급여를 기준으로 정렬해서 순번 부여하기
select row_number() over(order by salary desc), salary, first_name
from employees;

-- 급여를 기준으로 내림차순 정렬해서 순번을 부여했을 때 최고 급여를 받는 3명의
-- 아이디, 이름, 급여를 조회하기
select num, EMPLOYEE_ID, first_name, salary
from (select row_number() over(order by salary desc) num, employee_id, first_name, salary
        from employees)
where num<=3;

-- 급여를 기준으로 내림차순 정렬해서 순번을 부여했을 때 급여순위가 11~20에 해당하는 직원의
-- 순번, 아이디, 이름, 급여를 조회하기
select num, EMPLOYEE_ID, first_name, salary
from (select row_number() over(order by salary desc) num, employee_id, first_name, salary
        from employees)
where num>=11 and num<=20;

-- 부서별로 급여 기준으로 내림차순 정렬해서 순번을 부여하기
select
        row_number() over(partition by department_id order by salary desc) num,
        department_id, salary, first_name
from employees;

-- 부서별로 급여 기준으로 내림차순 정렬해서 순번을 부여했을 때 
-- 해당 부서에서 가장 급여를 ㅁ밚이 받는 직원의
-- 이름, 급여, 부서아이디를 조회하기
select first_name, salary, department_id
from   (select  row_number() over(partition by department_id order by salary desc) num,
        department_id, salary, first_name
        from employees)
where num = 1;

-- row_number(), rank(), dense_rank()값의 차이점 확인해보기
select row_number() over(order by salary desc) row_number,
        rank()      over(order by salary desc) rank,
        dense_rank()over(order by salary desc) dense_rank,
        salary
from employees;

-- row_number() over() 를 활용해서 데이터를 특정 컬럼값을 기준으로 범위별로 나눠서 조회하기
select *
from (select row_number() over(order by EMPLOYEE_ID asc) num, employee_id, first_name
        from employees)
where num>=1 and num <=10;

select *
from (select row_number() over(order by EMPLOYEE_ID asc) num, employee_id, first_name
        from employees)
where num>=11 and num<=20;

select FIRST_VALUE(salary) over(partition by DEPARTMENT_ID ORDER by salary desc),
        department_id, salary, first_name
    from employees;
    
-- 새로운 일련번호 조회    
SELECT SAMPLE_BOOK_SEQ.currval from dual;    
-- 현재 시퀀스의 일련번호 조회
SELECT SAMPLE_BOOK_SEQ.nextval from dual;

select EMPLOYEE_ID,rowid
from employees;

create index sample_user_name_idx
on sample_book_users(user_name);

create index sample_order_date_idx
on sample_book_orders (to_char(order_registered_date, 'yyyy-mm-dd'));

SELECT
    *
FROM sample_book_users
where user_name = '홍길동';

select *
from employees
where last_name = 'King';

select *
from sample_book_orders
where to_char(order_registered_date, 'yyyy-mm-dd') = '2020-04-29' ;


SELECT * FROM sample_book_questions;

update sample_book_questions 
									set 
									question_status = 'Y'
									WHERE question_no = 300000;































