/*
���ν����� guguProc
������ �� ���޹޾� �ش� �ܼ��� ����ϴ� procedure�� �����ϼ���. 
*/

CREATE OR REPLACE PROCEDURE guguProc
    (A IN NUMBER) 
IS 

BEGIN
    FOR i IN 1..9
    LOOP
    dbms_output.put_line(A || 'x' || i || '=' || A*i);
    END LOOP;
END;

EXEC guguProc(2);

/*
�μ���ȣ, �μ���, ���� flag(I: insert, U:update, D:delete)�� �Ű������� �޾� 
depts ���̺� 
���� INSERT, UPDATE, DELETE �ϴ� depts_proc �� �̸��� ���ν����� ������.
�׸��� ���������� commit, ���ܶ�� �ѹ� ó���ϵ��� ó���ϼ���.
*/



----
---------------------------------- ������ ����---------------------------


CREATE OR REPLACE PROCEDURE depts_proc
(
p_department_id IN depts.department_id%TYPE,
p_department_name IN depts.department_name%TYPE,
p_flag IN VARCHAR2
)
IS
    v_cnt NUMBER := 0;
BEGIN

    SELECT COUNT(*)
    INTO v_cnt
    FROM departments
    WHERE department_id = p_department_id;
    IF p_flag = 'I' THEN
        INSERT INTO depts
        (department_id, department_name)
        VALUES(p_department_id, p_department_name);
    ELSIF p_flag = 'U' THEN
        UPDATE depts
        SET department_name = p_department_name
        WHERE department_id = p_department_id;
    ELSIF p_flag = 'D' THEN
        DELETE FROM depts
        WHERE department_id = p_department_id;
        IF v_cnt = 0 THEN
        DMBS_OUTPUT.put_line('dsadusahudsad');
        RETURN;
    END IF;
    ELSE
        dbms_output.put_line('�ش� flag�� ���� ������ �غ���� �ʾҽ��ϴ�.');
    END IF;
COMMIT;

EXCEPTION WHEN OTHERS THEN
dbms_output.put_line('���ܰ� �߻��߽��ϴ�.');
    ROLLBACK;
END;

EXEC depts_proc(320, '�ƾƾ���', 'D');
/*
employee_id�� �Է¹޾� employees�� �����ϸ�,
�ټӳ���� out�ϴ� ���ν����� �ۼ��ϼ���. (�͸��Ͽ��� ���ν����� ����)
���ٸ� exceptionó���ϼ���
*/

CREATE OR REPLACE PROCEDURE emp_hire_proc(
    p_employee_id IN employees.employee_id%TYPE,
    p_year OUT NUMBER
)

IS 
    v_hire_date employees.hire_date%TYPE;
BEGIN
    SELECT 
        hire_date
    INTO v_hire_date
    FROM employees
    WHERE employee_id = p_employee_id;
    
    p_year := TRUNC((sysdate - v_hire_date) / 365);
    
EXCEPTION WHEN OTHERS THEN
    dbms_output.put_line(p_employee_id || '��(��) ���� ������ �Դϴ�'); 

END;

DECLARE
    v_year NUMBER;
BEGIN
    emp_hire_proc(135, v_year);
    dbms_output.put_line(v_year);
END;


------------------------------------------------------------------


/*
���ν����� - new_emp_proc
employees ���̺��� ���� ���̺� emps�� �����մϴ�.
employee_id, last_name, email, hire_date, job_id�� �Է¹޾�
�����ϸ� �̸�, �̸���, �Ի���, ������ update, 
���ٸ� insert�ϴ� merge���� �ۼ��ϼ���

������ �� Ÿ�� ���̺� -> emps
���ս�ų ������ -> ���ν����� ���޹��� employee_id�� dual�� select ������ ��.
���ν����� ���޹޾ƾ� �� ��: ���, last_name, email, hire_date, job_id
*/
DROP TABLE emps;
CREATE TABLE emps AS
    SELECT * FROM employees WHERE 1 = 2;
    

CREATE OR REPLACE PROCEDURE new_emp_proc
    (
    emp_id IN employees.employee_id%TYPE,
    emp_name IN employees.last_name%TYPE,
    emp_email IN employees.email%TYPE,
    emp_hire_date IN employees.hire_date%TYPE,
    emp_job_id IN employees_job_id%TYPE
    )
IS
    e_cnt NUMBER := 0;
BEGIN
    SELECT
    COUNT(*)
    FROM emps
    WHERE employees_id = emp_id;
    
    IF e_cnt = 1 THEN
    UPDATE emps SET
    last_name = emp_name,
    email = emp_email,
    hire_date = emp_hire_date,
    job_id = emp_jod_id
    WHERE emp_id = employee_id;
    
    ELSE
    INSERT INTO emps
    (employee_id, last_name, email, hire_date, job_id)
    VALUES
    (emp_id, emp_name, emp_email, emp_hire_date, emp_job_id);
END IF;
    
END;

--------------------- ���� ���� ���� ----------------------

CREATE OR REPLACE PROCEDURE new_emp_proc(
    emp_id IN emps.employee_id%TYPE,
    emp_name IN emps.last_name%TYPE,
    emp_email IN emps.email%TYPE,
    emp_hire_date IN emps.hire_date%TYPE,
    emp_job_id IN emps.job_id%TYPE
)
IS
BEGIN
    MERGE INTO emps a 
    USING (SELECT emp_id AS employee_id FROM dual) b
    ON (a.employee_id = b.employee_id)
    WHEN MATCHED THEN
        UPDATE SET
        a.last_name = emp_name,
        a.email = emp_email,
        a.hire_date = emp_hire_date,
        a.job_id = emp_job_id
    WHEN NOT MATCHED THEN
        INSERT (a.employee_id, a.last_name, a.email, a.hire_date, a.job_id)
        VALUES (emp_id, emp_name, emp_email, emp_hire_date, emp_job_id);


END;

EXEC new_emp_proc(100, 'kim', 'abc1234', sysdate, 'test');
EXEC new_emp_proc(110, 'lee', 'awc1234', sysdate, 'test1');
SELECT * FROM emps;




