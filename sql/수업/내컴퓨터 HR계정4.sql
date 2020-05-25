-- å ������ �����ϴ� ���̺� �����ϱ�
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
-- �Ϸù�ȣ�� �����ϴ� ������ �����ϱ�
create sequence sample_book_seq start with 10000;
-- �ϳ��� ������ �ø��� ����
select sample_book_seq.nextval from dual; 
select * from sample_books;

-- å ���� ��ϱ�
INSERT INTO SAMPLE_BOOKS
(book_no,book_title,book_writer,book_genre,book_publisher,book_price,book_discount_price,book_registerd_date)
values
(sample_book_seq.nextval, '�ڹ��� ����', '���ü�', 'IT', '�������ǻ�', 30000, 27000, sysdate);

select *
from sample_books
where book_title like '%�ڹ�%';

ALTER TABLE book_registerd_date RENAME TO book_registered_date;

--�� ������ �����ϴ� ���̺� �����ϱ�
create table sample_book_users (
    user_id varchar2(50) primary key,
    user_password varchar2(50) not null,
    user_name varchar2(100) not null,
    user_email varchar2(256) not null,
    user_point number(10,0),
    user_registered_date date  
);

CREATE table sample_book_orders (
    order_no number(6, 0) primary key,                                  -- �ֹ���ȣ
    user_id varchar2(50) references sample_book_users (user_id),        -- �ֹ��� ���̵�
    book_no number(6, 0) references sample_books (book_no),              -- �ֹ����� ��ȣ
    order_price number(7, 0),                                           -- ���Ű���
    order_amount number(3, 0),                                          -- ���ż���
    order_registered_date date                                          -- �ֹ���¥
);
-- �ֹ���ȣ �߻��� ����
create sequence sample_order_seq start with 500000;

--����ڵ��
insert into sample_book_users
(user_id, user_password, user_name, user_email, user_point, user_registered_date)
values
('hong', 'zxcv1234', 'ȫ�浿', 'hong@gmail.com', 1000, sysdate);

-- �ֹ� ���
insert into sample_book_orders
(order_no, user_id, book_no, order_price, order_amount, order_registered_date)
values
(sample_order_seq.nextval, 'hong', 10026, 32000, 2,sysdate);


SELECT
    *
FROM sample_book_orders;


-- ����� ���� ����ϱ�
-- ��� �÷��� ���� ��������� �����ϵ�
-- ������ �÷������� �°� ���� �����Ѵ�.
insert into sample_book_users
(USER_ID,USER_PASSWORD,USER_NAME,USER_EMAIL,USER_POINT,USER_REGISTERED_DATE)
values
('dudwns','zxcv1234','�ǿ���', 'dudwnss48@naver.com', 10, sysdate);

--�÷����� �����Ѱ��
-- ���̺��� �÷������� �°� ���� �����Ѵ�.
insert into sample_book_users
values
('neena', 'zxcv1234', '�ϳ�', 'neena@gmail.com',100,sysdate);

--�÷����� �����Ѱ��
--�ݵ�� ���̺��� �÷������� �°� ��� ���� �����ؾ� �Ѵ�.
insert into sample_book_users
values
('ssosso', 'zxcv1234', '�ҿ�����', 'ssosso@gmail.com'); --����, ���� ������

-- ������ �÷����� ���� �����ϰ�, �������� null�̳� default���� ����ǰ� �ϱ�
insert into sample_book_users
(user_id, user_name, user_password)
values
('suyoung', '�����' ,'zxcv1234');

-- �÷��� ũ��� ū ���� �ԷµǴ� ���
insert into sample_book_users
(user_id, user_password, user_name)-- ����
values
('dalchong', 'zxcv1234','����ѹ��ź��̿͵η�̻�õ���ڵ��ڻ����ѹ��ź��̿͵η�̻�õ���ڵ��ڻ����ѹ��ź��̿͵η�̻�õ���ڵ��ڻ����ѹ��ź��̿͵η�̻�õ���ڵ��ڻ�');

-- ���̺��� �� �����ϱ�
-- ��� ���� Ư�� �÷����� �����ϱ�(where���� �����ϸ� �ȴ�.)
--��� ������� ��й�ȣ�� 'zxcv1234'�� ��������
UPDATE sample_book_users
set user_password = 'zxcv1234';

rollback;

--��� ���� Ư�� �÷����� �����ϱ�
-- ��� �������� �޿��� 500�� �λ��ϱ�
update employees
set 
    salary  = salary +500;

-- where ���� ����ؼ� ���ǽ��� �����ϴ� Ư������ �÷����� �����ϱ�
-- 90 �� �μ��� �Ҽӵ� ������ �޿��� 10000�޷� �λ��Ű��
update employees
set 
    salary  = salary + 10000
where department_id = 90;

-- �ѹ��� ���� �÷��� ���� �����ϱ�
--10057�� å�� ���� ���� ���ΰ����� �����ϱ�
update sample_books
set 
    book_title = '�̰��� �ڹٴ� ������',
    book_price = '40000',
    book_discount_price = 38000
where book_no = 10031;
 -- ���������� �̿��ؼ� �� �����ϱ�
 -- �ּұ޿��� �޴� ������ �޿��� �ش� �μ��� ��ձ޿��� �����ϱ�
 -- �ּ� �޿��� �޴� ����
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

--  10�� �μ��� �μ���ȣ�� 300������ �����ϱ�
UPDATE departments
set 
    department_id = 300
where department_id = 270 ; -- ����, �ڽ����̺� (employees)�� �ڽķ��ڵ� ����

-- 100�� ����� �ҼӺμ��� 500 ������ �����ϱ�
update employees
set 
        department_id = 500
where employee_id = 100; -- ���� �θ����̺�(departments)�� 500�� �μ��� �������� ����

-- ������ �����ϱ�
-- ���̵� neena�� �� �����ϱ�
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

-- smaple_book_users�� ��� ���� copy_sample_book_users�� �߰��ϱ�
insert into copy_sample_book_users
(USER_ID,USER_PASSWORD,USER_NAME,USER_EMAIL,USER_POINT,USER_REGISTERED_DATE)
select user_id, USER_PASSWORD,USER_NAME,USER_EMAIL,USER_POINT,USER_REGISTERED_DATE
 from sample_book_users;

-- �������̺� ���ο� �߰�
insert into sample_book_users
VALUES
('ryu', 'zxcv1234', '������', 'abc@gmail.com',10,sysdate);

insert into sample_book_users
VALUES
('kkang', 'zxcv1234', '������', 'kkang@gmail.com',10,sysdate);

-- ���� ���̺�� ��� ���̺� �����ϱ�
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



















































