/*
���� 1.
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� ( AVG(�÷�) ���)
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
-EMPLOYEES ���̺��� job_id�� IT_PFOG�� ������� ��ձ޿����� ���� ������� �����͸� ����ϼ���
*/

SELECT * 
FROM employees e
WHERE e.salary > (SELECT 
                AVG(salary)
                FROM employees);
                
SELECT COUNT(*) 
FROM employees e
WHERE e.salary > (SELECT 
                AVG(salary)
                FROM employees);
                
SELECT * 
FROM employees e
WHERE e.salary > (SELECT 
                AVG(salary)
                FROM employees
                WHERE job_id = 'IT_PROG');

/*
���� 2.
-DEPARTMENTS���̺��� manager_id�� 100�� ����� department_id��
EMPLOYEES���̺��� department_id�� ��ġ�ϴ� ��� ����� ������ �˻��ϼ���.
*/

SELECT d.department_id
FROM departments d
WHERE d.manager_id = 100;

SELECT *
FROM employees e
where e.department_id = (
                            SELECT d.department_id
                            FROM departments d
                            WHERE d.manager_id = 100
                            );




/*
���� 3.
-EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� ����ϼ���
-EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.
*/

SELECT *
FROM employees 
WHERE manager_id > (SELECT manager_id
FROM employees 
WHERE first_name = 'Pat');

SELECT *
FROM employees
where manager_id IN (SELECT manager_id
                        FROM employees
                        WHERE first_name = 'James');

/*
���� 4.
-EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� �� ��ȣ, �̸��� ����ϼ���
*/

SELECT *
FROM
    (
        SELECT ROWNUM AS rn, tbl.frist_name
        FROM 
    (
        SELECT *
        FROM employees
        ORDER BY first_name DESC
        ) tbl
    )
WHERE rn > 41 AND rn <51;

/*
���� 5.
-EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� �� ��ȣ, ���id, �̸�, ��ȣ, 
�Ի����� ����ϼ���.
*/
    SELECT * FROM
    (
    SELECT ROWNUM AS rn, tbl.* FROM
    (
         SELECT employee_id, first_name, phone_number, hire_date
         FROM employees 
        ORDER BY hire_date ASC
    ) tbl
    )
    WHERE rn > 30 AND rn <= 40;
    
/*
���� 6.
employees���̺� departments���̺��� left �����ϼ���
����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
����) �������̵� ���� �������� ����
*/

SELECT e.employee_id, e.first_name || ' ' || e.last_name AS name, e.department_id, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.employee_id ASC;

/*
���� 7.
���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/

SELECT 
e.employee_id, e.first_name || ' ' || e.last_name AS name, e.department_id,
(
    SELECT d.department_name
    FROM departments d
    WHERE d.department_id = e.department_id
) 
FROM employees e
ORDER By employee_id ASC;

/*
���� 8.
departments���̺� locations���̺��� left �����ϼ���
����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
����) �μ����̵� ���� �������� ����
*/

SELECT d.department_id, d.department_name, d.manager_id, loc.location_id, loc.street_address, loc.postal_code, loc.city
FROM departments d
LEFT JOIN locations loc
ON d.location_id = loc.location_id
ORDER BY d.department_id ASC;

/*
���� 9.
���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/

SELECT d.department_id, d.department_name, d.manager_id,
    (
    SELECT loc.location_id
    FROM locations loc
    WHERE loc.location_id = d.location_id
    ) AS location_id ,
    (
    SELECT loc.street_address
    FROM locations loc
    WHERE loc.location_id = d.location_id
    ) AS st_ad ,
    (
    SELECT loc.postal_code
    FROM locations loc
    WHERE loc.location_id = d.location_id
    ) AS pos_code ,
    (
    SELECT loc.city
    FROM locations loc
    WHERE loc.location_id = d.location_id
    ) AS city
FROM departments d
ORDER BY d.department_id ASC;

/*
���� 10.
locations���̺� countries ���̺��� left �����ϼ���
����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ�
����) country_name���� �������� ����
*/

SELECT loc.location_id, loc.street_address, loc.city, c.country_id, c.country_name
FROM locations loc
LEFT JOIN countries c
ON loc.country_id = c.country_id
ORDER BY country_name ASC;


/*
���� 11.
���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/

SELECT loc.location_id, loc.street_address, loc.city,
    (SELECT c.country_id
    FROM countries c
    WHERE loc.country_id = c.country_id) AS conID,   
    (SELECT c.country_name
    FROM countries c
    WHERE loc.country_id = c.country_id) AS conName
FROM locations loc
ORDER BY conName ASC;


select l.location_id, l.street_address, l.city, l.country_id, 
(select c.country_name from countries c where l.country_id = c.country_id) as ctn
from locations l
order by ctn asc;
