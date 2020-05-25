SELECT order_amount FROM SAMPLE_BOOK_ORDERS WHERE BOOK_NO = 10029;

select get_total_order_amount(10031) from dual;

select get_total_order_price(10031) from dual;

EXECUTE add_book_order('hong', 10031,1000);

select  book_no 번호,
        book_title 제목,
        book_price 가격,
        book_discount_price 할인가격,
        book_stock 재고량,
        get_total_order_amount(book_no) "총 판매수량",
        get_total_order_price(book_no) "총 판매금액"
from sample_books;