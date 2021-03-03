select * from employees;
select * from departments;
select * from locations;
SELECT
    first_name, salary, hire_date
FROM 
    employees;

SELECT
    first_name, last_name, salary
FROM
    employees
ORDER BY salary DESC;

SELECT
    first_name, last_name, salary
FROM
    employees
ORDER BY first_name ASC, last_name DESC;

--�Խ��� ���̺� ����
DROP TABLE BOARD;

CREATE TABLE BOARD (
    board_id NUMBER PRIMARY KEY,
    title VARCHAR2(255),
    writer VARCHAR2(255),
    content VARCHAR2(255)
);
--������ ����
INSERT INTO BOARD
    (board_id, title, writer, content)
VALUES
    (1,'hello','kim','hi my name is KIM');
INSERT INTO BOARD
    (board_id, title, writer, content)
VALUES
    (2,'hello2','park','�ȳ� ���̸��� PARK�̾�~');
INSERT INTO BOARD
    (board_id, title, writer)
VALUES
    (3,'hello3','hong');
INSERT INTO BOARD
    
VALUES
    (4,'hello4','lee','�ȳ� ���̸��� LEE��~');
INSERT INTO BOARD
    
VALUES
    (5,'hello5','song','�ȳ� ���̸��� SONG��~');
SELECT * FROM BOARD;
--������ ����
UPDATE BOARD
SET writer = '��浿',
    title = '�Ʊ���� �Ѹ�'
WHERE board_id = 4;
UPDATE BOARD
SET content = '�� �������Դϴ�~~ �� �����ɱ��??'
WHERE board_id = 3;
SELECT * FROM BOARD;

--������ ����
DELETE 
FROM BOARD
WHERE board_id = 2;
SELECT * FROM BOARD;

-- �ǽ�
-- 1. employees ���̺��� first_name, last_name, salary�� ��ȸ�ϼ���.
SELECT
    first_name,
    last_name,
    salary
FROM employees;
-- 2.departments���̺��� department_id, department_name, manager_id, location_id�� ��ȸ�ϼ���.
SELECT
    department_id,
    department_name,
    manager_id,
    location_id
FROM departments;
-- 3. employees���̺��� first_name�� ��Ī�� '�̸�', salary�� ��Ī�� '�޿�'�� ��ȸ�ϼ���.
SELECT
    first_name AS "����� �̸�",
    salary AS �޿�
FROM employees;
-- 4. employees���̺��� ��������� first_name + last_name + '�� �޿���' + salary + '$�Դϴ�.' 
--    �� ���·� �����Ͽ� '�������' ��� ��Ī�� �ο��Ͽ� �ϳ��� �÷����� ��ȸ�ϼ���.
SELECT
    first_name || last_name || '�� �޿���' || salary || '$�Դϴ�.'
FROM employees;
-- 5. employees���̺��� department_id�� �ߺ��� �����Ͽ� ��ȸ�ϼ���.
SELECT DISTINCT
    department_id
FROM employees;

-- �ǽ� 2
-- 1. employees���̺��� job_id�� 'IT_PROG'�� ����� first_name, job_id, department_id�� ��ȸ�ϼ���.
SELECT 
    first_name, job_id, department_id
FROM employees
WHERE job_id = 'IT_PROG';

-- 2. employees���̺��� last_name�� 'King'�� ����� first_name, last_name, hire_date�� ��ȸ�ϼ���.
SELECT 
    first_name, last_name, hire_date
FROM employees
WHERE last_name = 'King';

-- 3. employees���̺��� salary�� 15000���� ũ�ų� ���� ����� first_name, salary, hire_date�� ��ȸ�ϼ���.
SELECT 
    first_name, salary, hire_date
FROM employees
WHERE salary >= 15000;

-- 4. employees���̺��� salary�� 10000�� 12000 ���̿� �ִ� ����� first_name, salary�� ��ȸ�ϼ���.
SELECT 
    first_name, salary, hire_date
FROM employees
WHERE salary BETWEEN 10000 AND 12000;

-- 5. employees���̺��� manager_id�� 101, 102, 103�߿� ���ϴ� ����� first_name, salary, manager_id�� ��ȸ�ϼ���.
SELECT 
    first_name, salary, manager_id
FROM employees
WHERE manager_id IN (101, 102, 103);

-- 6. employees���̺��� job_id�� 'IT_PROG', 'FI_MGR'�߿� ���Ե��� �ʴ� ����� first_name, job_id�� ��ȸ�ϼ���.
SELECT 
    first_name, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'FI_MGR');

-- 7. employees���̺��� job_id�� 'IT'�� �����ϴ� ����� first_name, last_name, job_id�� ��ȸ�ϼ���.
SELECT 
    first_name, last_name, job_id
FROM employees
WHERE job_id LIKE 'IT%';

-- 8. employees���̺��� email�� �ι�° ���ڰ� A�� ����� first_name, email�� ��ȸ�ϼ���.
SELECT 
    first_name, email
FROM employees
WHERE email LIKE '_A%';

-- 9. employees���̺��� manager_id�� null�� ����� first_name, manager_id�� ��ȸ�ϼ���.
SELECT 
    first_name, manager_id
FROM employees
WHERE manager_id IS NULL;

-- 10. employees���̺��� commission_pct�� null�� �ƴ� ����� first_name, job_id, commission_pct�� ��ȸ�ϼ���.
SELECT 
    first_name, job_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

-- 11. employees���̺��� job_id�� 'IT_PROG'�̰� salary�� 5000�̻��� �����
--     first_name, job_id, salary�� ��ȸ�ϼ���.
SELECT 
    first_name, job_id, salary
FROM employees
WHERE job_id = 'IT_PROG'
    AND salary >= 5000;

-- 12. employees���̺��� job_id�� 'IT_PROG'�̰ų� salary�� 5000�̻��� �����
--     first_name, job_id, salary�� ��ȸ�ϼ���.
SELECT 
    first_name, job_id, salary
FROM employees
WHERE job_id = 'IT_PROG'
    OR salary >= 5000;

-- 13. employees���̺��� job_id�� 'IT_PROG'�̰ų� 'FI_MGR'�̸鼭 salary�� 5000�̻��� �����
--     first_name, job_id, salary�� ��ȸ�ϼ���.
SELECT 
    first_name, job_id, salary
FROM employees
WHERE ( job_id = 'IT_PROG' OR job_id = 'FI_MGR' )
    AND salary >= 5000;