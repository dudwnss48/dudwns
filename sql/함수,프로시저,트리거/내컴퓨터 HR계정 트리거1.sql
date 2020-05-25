-- 트리거 생성하기
-- SAMPLE_BOOK_LIKES 에 INSERT 작업이 실행될 때마다 자동으로 SAMPLE_BOOKS의 BOOK_LIKES 컬럼의 값을 1증가시킨다.
CREATE OR REPLACE TRIGGER INCREASE_BOOK_LIKES_TRIGGER
    AFTER
    INSERT ON SAMPLE_BOOK_LIKES
    FOR EACH ROW
    
    BEGIN
    
        UPDATE SAMPLE_BOOKS
        SET
            BOOK_LIKES = BOOK_LIKES + 1
        WHERE 
            BOOK_NO = :NEW.BOOK_NO;
    
    END;