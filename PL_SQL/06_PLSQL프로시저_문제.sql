/*
프로시저명 guguProc
구구단 을 전달받아 해당 단수를 출력하는 procedure을 생성하세요. 
*/

CREATE PROCEDURE guguProc

    (A IN NUMBER)
   
IS 
BEGIN
    FOR i IN 1..9
    LOOP
    dbms_output.put_line(A || 'x' || i || '=' || 'A*i');
    END LOOP;
END;

EXEC guguProc(2);

/*
부서번호, 부서명, 작업 flag(I: insert, U:update, D:delete)을 매개변수로 받아 
depts 테이블에 
각각 INSERT, UPDATE, DELETE 하는 depts_proc 란 이름의 프로시저를 만들어보자.
그리고 정상종료라면 commit, 예외라면 롤백 처리하도록 처리하세요.
*/






/*
employee_id를 입력받아 employees에 존재하면,
근속년수를 out하는 프로시저를 작성하세요. (익명블록에서 프로시저를 실행)
없다면 exception처리하세요
*/






