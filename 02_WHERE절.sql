
SELECT * FROM employees;

-- WHERE 절 비교(데이터 값은 대/소문자를 구분합니다.)

SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG';

-- King이란 last name을 가진 사람의 모든 컬럼 조회
SELECT * FROM employees
WHERE last_name = 'King';

-- department가 90인 사람들의 모든 컬럼 조회
SELECT  *
FROM employees
WHERE department_id = 90;

-- salary가 15000이상인 사람의 모든 컬럼 조회
SELECT *
FROM employees
WHERE salary >= 15000;

-- hire date 가 04/01/30 인 사람의 모든 컬럼 조회
SELECT *
FROM employees
WHERE hire_date = '04/01/30';

-- 데이터 행 제한 (BETWEEN, IN, LIKE)
-- salary가 15000~20000 사이인 사람 조회
SELECT *
FROM employees
WHERE salary BETWEEN 15000 AND 20000;

-- 03년도에 입사한 사람들 조회
SELECT *
FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

-- IN 연산자의 사용 (특정 값들과 비교할 때 사용)
-- manager id에 100, 101, 102 셋중에 하나에 포함 된다면 가져와요
SELECT *
FROM employees
WHERE manager_id IN (100, 101, 102);

-- job id가 IT_PROG, AD_VP가 포함된다면 가져오세요
SELECT *
FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');

-- LIKE 연산자 
-- %는 어떠한 문자든, _ 는 데이터의 자리(위치)를 찾아낼 때
-- 03으로 시작하는 데이터를 가져오기, %뒤는 어떠한 문자가 오든 상관 없다
SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '03%';

-- 15 앞에는 상관없다
SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%15';

-- 05가 들어가기만 하면 앞뒤 안가림
SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%05%';

-- 05월을 찾고 싶을 때, _ 3개로 앞에 00/다음 4번째 표현
SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '___05%';

-- IS NULL (null값을 찾음)
-- manager_id가 null인 값을 찾는다
SELECT *
FROM employees
WHERE manager_id IS NULL;


SELECT *
FROM employees
WHERE commission_pct IS NULL;

-- null이 아닌 사람들을 조회
SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;

-- AND, OR
-- AND가 OR보다 연산 순서가 빠르다.
-- AND보다 OR이 먼저 계산되어야 한다면 ()로 묶어준다
SELECT *
FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'FT_MGR')
AND salary >= 6000;

-- 데이터의 정렬 (SELECT 구문의 가장 마지막에 배치됩니다.)
-- ASC: ascending 오름차순
-- DESC: descending 내림차순
SELECT *
FROM employees
ORDER BY hire_Date ASC;

SELECT *
FROM employees
ORDER BY hire_Date DESC;

SELECT *
FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY first_name ASC;

-- FROM > 조건검사(WHERE) > SELECT(컬럼조회) > ORDER BY(정렬)
SELECT *
FROM employees
WHERE salary >= 5000
ORDER BY employee_id DESC;

SELECT first_name, salary*12 AS pay
FROM employees
ORDER BY pay ASC;


