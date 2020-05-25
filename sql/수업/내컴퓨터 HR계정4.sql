-- 책 정보를 저장하는 테이블 생성하기
CREATE table sample_books (
    book_no             number(6,0) primary key,
    book_title          varchar2(500) not null,
    book_writer         varchar2(200) not null,
    book_genre          varchar2(200) not null,
    book_publisher      varchar2(200) not null,
    book_price          number(7,0) not null,
    book_discount_price number(7,0) not null,
    book_registerd_date date
);

drop table sample_book;
-- 일련번호를 발행하는 시퀀스 생성하기
create sequence sample_book_seq start with 10000;
-- 하나씩 시퀀스 늘리는 구문
select sample_book_seq.nextval from dual; 
select * from sample_books;

-- 책 정보 등룍하기
INSERT INTO SAMPLE_BOOKS
(book_no,book_title,book_writer,book_genre,book_publisher,book_price,book_discount_price,book_registerd_date)
values
(sample_book_seq.nextval, '자바의 정석', '남궁성', 'IT', '도우출판사', 30000, 27000, sysdate);

select *
from sample_books
where book_title like '%자바%';

ALTER TABLE book_registerd_date RENAME TO book_registered_date;

--고객 정보를 저장하는 테이블 생성하기
create table sample_book_users (
    user_id varchar2(50) primary key,
    user_password varchar2(50) not null,
    user_name varchar2(100) not null,
    user_email varchar2(256) not null,
    user_point number(10,0),
    user_registered_date date  
);

CREATE table sample_book_orders (
    order_no number(6, 0) primary key,                                  -- 주문번호
    user_id varchar2(50) references sample_book_users (user_id),        -- 주문자 아이디
    book_no number(6, 0) references sample_books (book_no),              -- 주문도서 변호
    order_price number(7, 0),                                           -- 구매가격
    order_amount number(3, 0),                                          -- 구매수량
    order_registered_date date                                          -- 주문날짜
);
-- 주문번호 발생기 생성
create sequence sample_order_seq start with 500000;

--사용자등록
insert into sample_book_users
(user_id, user_password, user_name, user_email, user_point, user_registered_date)
values
('hong', 'zxcv1234', '홍길동', 'hong@gmail.com', 1000, sysdate);

-- 주문 등록
insert into sample_book_orders
(order_no, user_id, book_no, order_price, order_amount, order_registered_date)
values
(sample_order_seq.nextval, 'hong', 10026, 32000, 2,sysdate);


SELECT
    *
FROM sample_book_orders;


-- 사용자 정보 등록하기
-- 모든 컬럼에 값을 명시적으로 저장하디
-- 나열된 컬럼순서에 맞게 값을 나열한다.
insert into sample_book_users
(USER_ID,USER_PASSWORD,USER_NAME,USER_EMAIL,USER_POINT,USER_REGISTERED_DATE)
values
('dudwns','zxcv1234','권영준', 'dudwnss48@naver.com', 10, sysdate);

--컬럼명을 생략한경우
-- 테이블의 컬럼순서에 맞게 값을 나열한다.
insert into sample_book_users
values
('neena', 'zxcv1234', '니나', 'neena@gmail.com',100,sysdate);

--컬럼명을 생략한경우
--반드시 테이블의 컬럼순서에 맞게 모든 값을 나열해야 한다.
insert into sample_book_users
values
('ssosso', 'zxcv1234', '소영선배', 'ssosso@gmail.com'); --오류, 값이 부족함

-- 나열된 컬럼에만 값을 저장하고, 나머지는 null이나 default값이 저장되게 하기
insert into sample_book_users
(user_id, user_name, user_password)
values
('suyoung', '김수영' ,'zxcv1234');

-- 컬럼의 크깁다 큰 값이 입력되는 경우
insert into sample_book_users
(user_id, user_password, user_name)-- 오류
values
('dalchong', 'zxcv1234','김수한무거북이와두루미삼천갑자동박삭김수한무거북이와두루미삼천갑자동박삭김수한무거북이와두루미삼천갑자동박삭김수한무거북이와두루미삼천갑자동박삭');

-- 테이블의 값 수정하기
-- 모든 행의 특정 컬럼값을 수정하기(where절을 생략하면 된다.)
--모든 사용자의 비밀번호를 'zxcv1234'로 변경히가
UPDATE sample_book_users
set user_password = 'zxcv1234';

rollback;

--모든 행의 특정 컬럼값을 수정하기
-- 모든 직원들의 급여를 500불 인상하기
update employees
set 
    salary  = salary +500;

-- where 절을 사용해서 조건식을 만족하는 특정행의 컬럼값을 수정하기
-- 90 번 부서에 소속된 직원의 급여를 10000달러 인상시키기
update employees
set 
    salary  = salary + 10000
where department_id = 90;

-- 한번에 여러 컬럼의 값을 변경하기
--10057번 책의 제목 가격 할인가격을 수정하기
update sample_books
set 
    book_title = '이것이 자바다 개정판',
    book_price = '40000',
    book_discount_price = 38000
where book_no = 10031;
 -- 서브쿼리를 이용해서 값 변경하기
 -- 최소급여를 받는 직원의 급여를 해당 부서의 평균급여로 변경하기
 -- 최소 급여를 받는 직원
 select employee_id, salary
 from employees
 where salary = (SELECT min(salary)
                from employees);

update employees
set 
    salary = (select trunc(avg(salary))
                from  employees
                where department_id =50)
where employee_id = 132;

--  10번 부서의 부서번호를 300번으로 변경하기
UPDATE departments
set 
    department_id = 300
where department_id = 270 ; -- 오류, 자식테이블 (employees)에 자식레코드 존재

-- 100번 사원의 소속부서를 500 번으로 변경하기
update employees
set 
        department_id = 500
where employee_id = 100; -- 오류 부모테이블(departments)에 500번 부서가 존재하지 않음

-- 데이터 삭제하기
-- 아이디가 neena인 행 삭제하기
DELETE from sample_book_users
where user_id = 'neena';



CREATE table copy_sample_book_users(
    user_id varchar2(50) primary key,
    user_password VARCHAR2(50),
    user_name VARCHAR2(100),
    user_email varchar2(256),
    user_point number(10,0),
    user_registered_date date
);

-- smaple_book_users의 모든 행을 copy_sample_book_users에 추가하기
insert into copy_sample_book_users
(USER_ID,USER_PASSWORD,USER_NAME,USER_EMAIL,USER_POINT,USER_REGISTERED_DATE)
select user_id, USER_PASSWORD,USER_NAME,USER_EMAIL,USER_POINT,USER_REGISTERED_DATE
 from sample_book_users;

-- 원본테이블에 새로운 추가
insert into sample_book_users
VALUES
('ryu', 'zxcv1234', '류관순', 'abc@gmail.com',10,sysdate);

insert into sample_book_users
VALUES
('kkang', 'zxcv1234', '강감찬', 'kkang@gmail.com',10,sysdate);

-- 원본 테이블과 대상 테이블 병합하기
merge into copy_sample_book_users B
    using sample_book_users A
    on (B.user_id = A.user_id)
when matched then
    update set
        B.user_password = A.user_password,
        B.user_name = A.user_name,
        B.user_email = A.user_email,
        B.user_point = A.user_point,
        B.user_registered_date = A.user_registered_date
when not matched then
    insert values
    (A.user_id,A.user_password, A.user_name, A.user_email, A.user_point, A.user_registered_date);
commit;

SELECT a.order_no, b.user_name , c.book_title, c.book_price, a.order_price,a.order_amount, a.order_registered_date
FROM sample_book_orders A, sample_book_users B, sample_books C
where a.user_id = b.user_id
and a.book_no = c.book_no
and a.user_id = 'hong'
order by A.order_no desc;



















































