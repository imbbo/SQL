
-- WHILE��

DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 10
    LOOP
        dbms_output.put_line(v_num * v_count);
        v_count := v_count + 1;
    END LOOP; 
END;

-- Ż�⹮

DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 10
    LOOP
        dbms_output.put_line(v_num * v_count);
        EXIT WHEN v_count = 5;
        v_count := v_count + 1;
    END LOOP; 
END;

-- FRO��

DECLARE
    v_num NUMBER := 3;
BEGIN
    
    FOR i IN 1..9 -- .. ���� �ۼ��ؼ� ������ ǥ��
    LOOP
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;
    
END;

-- CONTINUE��

DECLARE
    v_num NUMBER := 3;
BEGIN
    
    FOR i IN 1..9 -- .. ���� �ۼ��ؼ� ������ ǥ��
    LOOP
        CONTINUE WHEN i = 5;
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;
    
END;


-- 1. ��� �������� ����ϴ� �͸� ����� ���弼�� (2 ~ 9��)

DECLARE
   
BEGIN
    FOR i IN 2..9
    LOOP
    FOR l IN 1..9
    LOOP
    dbms_output.put_line(i || 'x' || l || '=' || i*l);
    END LOOP;
    END LOOP;
END;



-- 2. INSERT�� 300�� �����ϴ� �͸� ����� ó���ϼ���.
-- board��� �̸��� ���̺��� ���弼��. (bno, writer, title �÷��� �����մϴ�.)
-- bno�� SEQUENCE�� �÷� �ֽð�, writer�� title�� ��ȣ�� �ٿ��� INSERT�� ������ �ּ���.
-- ex} 1, test1, title1 -> 2 test2 title2 -> 3 test3 title3 ....
DROP TABLE board;

CREATE TABLE board (
    board_bno NUMBER(10),
    board_writer VARCHAR2(1000),
    board_title VARCHAR2(1000)
);

SELECT * FROM board;
DROP SEQUENCE a;
CREATE SEQUENCE a 
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 300
    NOCYCLE;
    
    

DECLARE 
    
BEGIN 
    
    FOR i IN 1..300
    LOOP
    INSERT INTO board
    VALUES
    (A.NEXTVAL, 'board_writer' || TO_CHAR(i), 'board_title' || TO_CHAR(i));
    END LOOP;

END;

SELECT * FROM board;












