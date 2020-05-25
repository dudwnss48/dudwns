-- Ʈ���� �����ϱ�
-- SAMPLE_BOOK_LIKES �� INSERT �۾��� ����� ������ �ڵ����� SAMPLE_BOOKS�� BOOK_LIKES �÷��� ���� 1������Ų��.
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