
-- WHILE문

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

-- 탈출문

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

-- FRO문

DECLARE
    v_num NUMBER := 3;
BEGIN
    
    FOR i IN 1..9 -- .. 으로 작성해서 범위를 표현
    LOOP
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;
    
END;

-- CONTINUE문

DECLARE
    v_num NUMBER := 3;
BEGIN
    
    FOR i IN 1..9 -- .. 으로 작성해서 범위를 표현
    LOOP
        CONTINUE WHEN i = 5;
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;
    
END;


-- 1. 모든 구구단을 출력하는 익명 블록을 만드세요 (2 ~ 9단)

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



-- 2. INSERT를 300번 실행하는 익명 블록을 처리하세요.
-- board라는 이름의 테이블을 만드세요. (bno, writer, title 컬럼이 존재합니다.)
-- bno는 SEQUENCE로 올려 주시고, writer와 title에 번호를 붙여서 INSERT를 진행해 주세요.
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












