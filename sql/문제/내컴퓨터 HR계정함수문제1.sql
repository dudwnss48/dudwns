create or REPLACE FUNCTION get_total_order_amount
    --�Է��� �� ����
    (i_book_no in number)
    --��ȯŸ�� ����
    return number
    
    IS
    -- ����ϰ� ���� ����
    -- �� �ֹ�����
    -- �ϳ��� �ֹ�����
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
    