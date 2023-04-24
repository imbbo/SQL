-- 1. ������ �� 3���� ����ϴ� �͸� ����� ����� ����. (��¹� 9���� �����ؼ� ������)

SET SERVEROUTPUT ON;

DECLARE
    A NUMBER := 3;
BEGIN
    DBMS_OUTPUT.put_line('3 x 1 = ' || A*1);
    DBMS_OUTPUT.put_line('3 x 2 = ' || A*2);
    DBMS_OUTPUT.put_line('3 x 3 = ' || A*3);
    DBMS_OUTPUT.put_line('3 x 4 = ' || A*4);
    DBMS_OUTPUT.put_line('3 x 5 = ' || A*5);
    DBMS_OUTPUT.put_line('3 x 6 = ' || A*6);
    DBMS_OUTPUT.put_line('3 x 7 = ' || A*7);
    DBMS_OUTPUT.put_line('3 x 8 = ' || A*8);
    DBMS_OUTPUT.put_line('3 x 9 = ' || A*9);
END;


-- 2. employees ���̺��� 201�� ����� �̸��� �̸��� �ּҸ� ����ϴ�
-- �͸����� ����� ����. (������ ��Ƽ� ����ϼ���)

DECLARE
    e_emp_name employees.first_name%TYPE; 
    e_emp_email employees.email%TYPE;
BEGIN
    SELECT
        first_name, email
    INTO
        e_emp_name, e_emp_email
    FROM employees
    WHERE employee_id = 201;
    
    DBMS_OUTPUT.put_line(e_emp_name || '-' || e_emp_email);
END;


-- 3. employees ���̺��� �����ȣ�� ���� ū ����� ã�Ƴ� �� (MAX �Լ� ���)
-- �� ��ȣ + 1������ �Ʒ��� ����� emps ���̺�
-- employee_id, last_name, email, hire_date, job_id�� �ű� �����ϴ� ����� ���弼��.
-- SELECT�� ���Ŀ� INSERT�� ����մϴ�. 
/*
 ����� : steven
 �̸��� : stevenjobs
 �ӻ����� : ���ó�¥
 JOB_ID CEO
*/

DECLARE
    emp_id employees.employee_id%TYPE;
BEGIN
   SELECT 
    MAX(employee_id)
    INTO emp_id
   FROM employees;
   INSERT INTO emps
   (employee_id, last_name, email, hire_date, job_id)
   VALUES
   (emp_id + 1 ,'steven', 'stevenjobs', sysdate, 'CEO');  
END;

SELECT * FROM emps;





DROP TABLE emps;
CREATE TABLE emps AS (SELECT * FROM employees WHERE 1=2);
SELECT * FROM emps;