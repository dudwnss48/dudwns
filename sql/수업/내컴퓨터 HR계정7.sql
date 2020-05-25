-- Top-N�м�

-- 50�� �μ��� �Ҽӵ� ��� �߿��� �޿��� ���� ���� �޴� ���� 3���� ��ȸ�ϱ�
select rownum, salary, first_name
from (select salary, first_name
        from employees
        where department_id = 50
        order by salary desc)
where ROWNUM <= 3;
        
-- �μ��� ������� ������� �� ������� ���� ���� �μ� 3���� ��ȸ�ϱ�
select rownum, department_id, cnt
from (select department_id, count(*) cnt
        from employees
        group by department_id
        order by cnt desc)
where rownum <= 3;

-- �μ��� ������� ������� �� ������� ���� ���� �μ� 3���� ��ȸ�ϱ�
-- �μ����̵�, �μ��� , ������� ��µǾ����.
select b.ranking, a.department_id, a.department_name, b.cnt
from departments A,(select rownum ranking, department_id, cnt
                    from (select department_id, count(*) cnt
                           from employees
                           group by department_id
                           order by cnt desc) 
                           where rownum <= 3)B
where a.department_id = b.department_id ;

-- ������ ���� ��� å 3���� ��ȸ�ϱ�
-- ����, ����, ������ ��µǾ�� ��.
select ROWNUM ranking, book_title, book_price
from (SELECT
        *
        from sample_books
        order by book_price desc)
where ROWNUM <=3;

-- ������ ���� ��� å 3���� ��ȸ���� ��
-- �ֱ� 1���� �̳��� �� å�� �� ����ڸ� ��ȸ�ϱ�
-- ����ھ��̵�, ����� ��, å����, ���ż���, ���ų�¥�� ��µǾ�� ��.
select c.user_id, c.user_name, a.book_title, b.order_price, b.order_amount, b.order_registered_date
from    (select ROWNUM ranking, book_title, book_price,book_no
         from (SELECT *
                from sample_books 
                order by book_price desc)
         where ROWNUM <=3) A, sample_book_orders B, sample_book_users C
where a.book_no = b.book_no
and b.user_id=c.user_id
and b.order_registered_date > sysdate-7;

-- ������å�� ������� �� �����Ѿ��� ���� ���� �������
-- ���̵�, �̸� ,�ѱ��űݾ��� ��ȸ�ϱ�
select a.user_id, a.user_name, total_price
from sample_book_users A,(select user_id, total_price
                           from (select user_id, sum(order_amount*order_price) total_price
                                from sample_book_orders
                                group by user_id
                                order by total_price desc)
                            where rownum=1) B
where a.user_id = b.user_id;

-- �м��Լ� ����ϱ�
-- �޿��� �������� �����ؼ� ���� �ο��ϱ�
select row_number() over(order by salary desc), salary, first_name
from employees;

-- �޿��� �������� �������� �����ؼ� ������ �ο����� �� �ְ� �޿��� �޴� 3����
-- ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select num, EMPLOYEE_ID, first_name, salary
from (select row_number() over(order by salary desc) num, employee_id, first_name, salary
        from employees)
where num<=3;

-- �޿��� �������� �������� �����ؼ� ������ �ο����� �� �޿������� 11~20�� �ش��ϴ� ������
-- ����, ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select num, EMPLOYEE_ID, first_name, salary
from (select row_number() over(order by salary desc) num, employee_id, first_name, salary
        from employees)
where num>=11 and num<=20;

-- �μ����� �޿� �������� �������� �����ؼ� ������ �ο��ϱ�
select
        row_number() over(partition by department_id order by salary desc) num,
        department_id, salary, first_name
from employees;

-- �μ����� �޿� �������� �������� �����ؼ� ������ �ο����� �� 
-- �ش� �μ����� ���� �޿��� ���L�� �޴� ������
-- �̸�, �޿�, �μ����̵� ��ȸ�ϱ�
select first_name, salary, department_id
from   (select  row_number() over(partition by department_id order by salary desc) num,
        department_id, salary, first_name
        from employees)
where num = 1;

-- row_number(), rank(), dense_rank()���� ������ Ȯ���غ���
select row_number() over(order by salary desc) row_number,
        rank()      over(order by salary desc) rank,
        dense_rank()over(order by salary desc) dense_rank,
        salary
from employees;

-- row_number() over() �� Ȱ���ؼ� �����͸� Ư�� �÷����� �������� �������� ������ ��ȸ�ϱ�
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
    
-- ���ο� �Ϸù�ȣ ��ȸ    
SELECT SAMPLE_BOOK_SEQ.currval from dual;    
-- ���� �������� �Ϸù�ȣ ��ȸ
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
where user_name = 'ȫ�浿';

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































