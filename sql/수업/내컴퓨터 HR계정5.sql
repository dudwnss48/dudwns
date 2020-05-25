-- 트랜잭션 처리
INSERT INTO sample_book_users
(USER_ID, user_password, user_name, user_email)
VALUES
('hong5678', 'ZXCV1234', '홍홍홍홍' , 'HONG4567@gmail.com');

update sample_book_users
set user_point = 1000
where user_id = 'hong5678';

SAVEPOINT add_new_user;

insert into sample_book_orders(order_no, user_id, book_no, order_price, order_amount)
VALUES(SAMPLE_ORDER_SEQ.nextval,'hong', 10029, 32000, 2);

update sample_book_users
set user_point = user_point + trunc(32000*3*0.03)
where user_id = 'hong5678';

ROLLBACK to SAVEPOINT add_new_user;
SELECT * FROM sample_book_users;
SELECT * FROM sample_book_orders;

commit;       -- 현재 트랜잭션의 변경내용을 저장, 현재 트랜잭션 종료, 새 트랜잭션 시작

-- DML 작업
-- DML 작업
-- DML 작업

ROLLBACK;     -- 새로 시작된 트랜잭션의 변경내용(DML1~3)을 버림, 트랜잭션 종료, 새 트랜잭션 시작



-- 북스토어 문의 게시판
-- 번호,    제목,     작성자아이디, 내용,      조회수,  작성일, 상태(답변완료여부), 질문유형   
-- number, varchar2, varchar2   ,varchar2  ,number ,date , char            , varchar2
create table sample_book_questions(
    question_no              number(7, 0)    primary key,
    question_title           varchar2(500)   not null,
    user_id                  varchar2(50)    REFERENCES sample_book_users (user_id),
    question_content         varchar2(4000)  not null,
    question_view_count      number(7, 0)    default 0,
    question_registered_date date            default sysdate,
    question_status          char(1)         default 'N',
    question_type            VARCHAR2(200)   not null
);

-- 북스토어 답변 게시판
-- 번호,    내용,      작성일,      문의글 번호
-- number, varchar2,  date,       number
create table sample_book_answers (
    answer_no               number(7, 0)    primary key,
    answer_content          varchar2(4000)  not null,
    answer_registered_date  date            default sysdate,
    question_no             number(7, 0)    REFERENCES sample_book_questions (question_no)
);

-- 테이블 이름 변경하기
rename sample_book_answers to sample_book_answers;

-- 문의/답변 게시판용 일련번호 생성기 만들기
create SEQUENCe sample_question_seq start with 1000000 nocache;
create sequence sample_answer_seq start with 1000000 nocache;



 insert into sample_book_questions
				(order_no, user_id, book_no, order_price, order_amount)
				values
				(sample_order_seq.nextval , ? , ? , ? , ?);


SELECT question_no, question_title, user_id, question_content,
        question_view_count, question_status, question_type
FROM sample_book_questions;

select question_content, answer_content
from sample_book_questions,sample_book_answers
where sample_book_questions.question_no = sample_book_answers.question_no
and sample_book_questions.question_no = ?;














