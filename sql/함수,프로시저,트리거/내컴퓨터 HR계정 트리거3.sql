-- 책에 대한 리뷰가 작성될 때 마다 책번호에 해당 평점을 변경하는 TRIGGER
CREATE OR REPLACE TRIGGER UPDATE_REVIEW_POINT_TRIGGER
    BEFORE
    INSERT ON SAMPLE_BOOK_REVIEWS
    FOR EACH ROW
    
    DECLARE
        CURSOR review_list (param_book_no SAMPLE_BOOKS.BOOK_NO%TYPE) IS
        SELECT review_POINT
        FROM SAMPLE_BOOK_REVIEWS
        WHERE BOOK_NO = PARAM_BOOK_NO;
        
        v_current_point          NUMBER(2, 1);
        v_temp_point             NUMBER;       
        v_current_ROW_COUNT      NUMBER;          
        v_POINT                  NUMBER(2, 1);               
    BEGIN
        select book_point into v_current_point
        from sample_books
        where book_no = :new.book_no;
        
        select count(*) into v_current_row_count
        from sample_book_reviews
        where book_no = :new.book_no;
        
        v_temp_point := (v_current_point*v_current_row_count + :new.review_point)
                        /(v_current_row_count + 1);
        v_point := trunc(v_temp_point, 1);
        
        UPDATE SAMPLE_BOOKS
        SET
            BOOK_POINT = v_point
        WHERE
            BOOK_NO = :NEW.BOOK_NO;
        
    
        
    END;