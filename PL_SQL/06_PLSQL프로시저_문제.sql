/*
���ν����� guguProc
������ �� ���޹޾� �ش� �ܼ��� ����ϴ� procedure�� �����ϼ���. 
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
�μ���ȣ, �μ���, �۾� flag(I: insert, U:update, D:delete)�� �Ű������� �޾� 
depts ���̺� 
���� INSERT, UPDATE, DELETE �ϴ� depts_proc �� �̸��� ���ν����� ������.
�׸��� ���������� commit, ���ܶ�� �ѹ� ó���ϵ��� ó���ϼ���.
*/






/*
employee_id�� �Է¹޾� employees�� �����ϸ�,
�ټӳ���� out�ϴ� ���ν����� �ۼ��ϼ���. (�͸��Ͽ��� ���ν����� ����)
���ٸ� exceptionó���ϼ���
*/






