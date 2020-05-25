-- 책에 대한 리뷰와 평점을 담는 테이블
CREATE TABLE SAMPLE_BOOK_REVIEWS (
    REVIEW_NO NUMBER(7, 0)          CONSTRAINT REVIEW_NO_PK PRIMARY KEY,
    REVIEW_CONTENT VARCHAR2(2000)   CONSTRAINT REVIEW_CONTENT_NN NOT NULL,
    REVIEW_POINT NUMBER (1, 0)      CONSTRAINT REVIEW_POINT_CK CHECK (REVIEW_POINT >= 0 AND REVIEW_POINT <= 5),
    REVIEW_REGISTERED_DATE DATE     DEFAULT SYSDATE,
    BOOK_NO NUMBER(7, 0)            CONSTRAINT REVIEW_BOOKNO_FK REFERENCES SAMPLE_BOOKS (BOOK_NO),
    USER_ID VARCHAR2(50)            CONSTRAINT REVIEW_USERID_FK REFERENCES SAMPLE_BOOK_USERS (USER_ID),
    CONSTRAINT REVIEWS_UK UNIQUE (BOOK_NO, USER_ID)
);

create sequence SAMPLE_question_SEQ start with 300000;
drop sequence SAMPLE_question_SEQ;
CREATE SEQUENCE SAMPLE_question_SEQ NOCACHE;
CREATE SEQUENCE SAMPLE_REVIEW_SEQ NOCACHE;
select * from sample_book_users;
INSERT INTO sample_book_reviews
(REVIEW_NO, REVIEW_CONTENT, REVIEW_POINT, BOOK_NO,USER_ID)
VALUES
(SAMPLE_REVIEW_SEQ.NEXTVAL, '아주 좋은 내용이었습니다.',5, 10030, 'hong');

INSERT INTO sample_book_reviews
(REVIEW_NO, REVIEW_CONTENT, REVIEW_POINT, BOOK_NO,USER_ID)
VALUES
(SAMPLE_REVIEW_SEQ.NEXTVAL, '아주 좋은 내용이었습니다.',5, 10029, 'hong');

INSERT INTO sample_book_reviews
(REVIEW_NO, REVIEW_CONTENT, REVIEW_POINT, BOOK_NO,USER_ID)
VALUES
(SAMPLE_REVIEW_SEQ.NEXTVAL, '잘 읽었습니다.',6, 10031, 'hong');

INSERT INTO sample_book_reviews
(REVIEW_NO, REVIEW_CONTENT, REVIEW_POINT, BOOK_NO,USER_ID)
VALUES
(SAMPLE_REVIEW_SEQ.NEXTVAL, '잘 읽었습니다.',2, 10052, 'hong');

--select trunc(avg(review_point),1)
--from sample_books
--where;

create table sample_book_likes (
    book_no number(7, 0) not null,
    user_id varchar2(50) not null,
    CONSTRAINT likes_bookno_fk foreign key (book_no)
          REFERENCES sample_books (book_no),
    CONSTRAINT likes_userid_fk FOREIGN KEY(user_id)
         REFERENCES sample_book_users (user_id),
    constraint likes_uk UNIQUE (book_no, user_id)
);


create or replace view emp_grade_view
		as select A.employee_id, A.first_name, A.salary, B.gra
		   from employees A, job_grades B
		   where A.salary >= B.lowest_sal and A.salary <= B.highest_sal;

select *
from emp_grade_view
where gra='A';


		create or replace view emp_salary_view
		as select employee_id, first_name, salary,
			salary*4*12 + salary*nvl(commission_pct, 0)*4*12 annual_salary
		     from employees;

select *
from emp_salary_view
where salary >=10000;

-- 인라인 뷰 사용하기
select id, name, sal, deptid
from (select employee_id id, first_name || ' ' || last_name name, salary sal, department_id deptid
        from employees)
where deptid=60;
-- 전체 직원중에서 자신이 소속된 부서의 평균급여보다 급여를 적게 받는 직원의
-- 사원 아이디, 이름 ,급여, 부서아이디, 그 부서의 평균급여를 조회하기
select a.employee_id, a.first_name, a.salary, b.deptid, b.avg_salary
from employees A, (select department_id deptid,
            trunc(avg(salary)) avg_salary
        from employees
        where department_id is not null
        GROUP by department_id) B
where B.deptid = A.department_id
and A.salary < b.avg_salary
order by A.employee_id asc;

--부서아이디, 부서명, 부서별 사원수, 도시명 출력하기
select a.department_id, a.department_name, b.city,c.cnt 
from departments A, locationS B, (select department_id dept_id, count(*) cnt
        from employees
        group by department_id) C
where A. location_ID = b.location_id
AND A.DEPARTMENT_id = C.DEPT_ID
ORDER BY A.DEPARTMENT_ID ASC;

create sequence sample_answer_seq start with 400000 nocache;




























