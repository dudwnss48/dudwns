create or REPLACE FUNCTION get_total_order_amount
    --입력할 값 정의
    (i_book_no in number)
    --반환타입 정의
    return number
    
    IS
    -- 사용하고 싶은 변수
    -- 총 주문수량
    -- 하나의 주문수량
    v_all_amount number :=0;
    v_amount number;
    
    cursor amount_list IS
    SELECT ORDER_AMOUNT 
    FROM SAMPLE_BOOK_ORDERS 
    WHERE BOOK_NO = i_book_no;
    
    BEGIN
        FOR amount IN amount_list loop
        v_amount      := amount.ORDER_AMOUNT;
     
        v_all_amount  := v_all_amount + v_amount;

    end loop;
    
    RETURN v_all_amount;
    END;
    