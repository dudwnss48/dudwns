-- SAMPLE_BOOK_ORDERS에 새로운 주문이 추가될 때마다 SAMPLE_BOOK_USERS의 포인트를 증가시킨다.
CREATE OR REPLACE TRIGGER INCREASE_USER_POINT_TRIGGER
    AFTER
    INSERT ON SAMPLE_BOOK_ORDERS
    FOR EACH ROW
    
    DECLARE
        v_price         sample_book_orders.order_price%TYPE;
        v_amount        sample_book_orders.order_amount%TYPE;
        v_deposit_point sample_BOOK_users.user_point%TYPE;
        
    BEGIN
    
        v_price             := :NEW.ORDER_PRICE;
        v_amount            := :NEW.ORDER_AMOUNT;
        v_deposit_point     := trunc(v_price*v_amount*0.02);
    
        UPDATE SAMPLE_BOOK_USERS
        SET
            USER_POINT = USER_POINT + v_deposit_point
        WHERE
            USER_ID = :NEW.USER_ID;
    
    END;