SELECT order_amount FROM SAMPLE_BOOK_ORDERS WHERE BOOK_NO = 10029;

select get_total_order_amount(10031) from dual;

select get_total_order_price(10031) from dual;

EXECUTE add_book_order('hong', 10031,1000);

select  book_no ��ȣ,
        book_title ����,
        book_price ����,
        book_discount_price ���ΰ���,
        book_stock ���,
        get_total_order_amount(book_no) "�� �Ǹż���",
        get_total_order_price(book_no) "�� �Ǹűݾ�"
from sample_books;