USE employees;

SELECT 
    first_name, last_name
FROM
    employees;
    
SELECT 
    *
FROM
    employees;

SELECT 
    *
FROM
    departments;

SELECT 
    dept_no
FROM
    departments;

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
    -- AND
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        AND first_name = 'Elvis';

-- OR
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        OR first_name = 'Elvis';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';

-- AND, OR
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis'
        AND (gender = 'M' OR gender = 'F');

SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND gender = 'M'
        OR gender = 'F';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna' AND (gender = 'F');

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
        
        -- IN & NOT IN
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
    
    
-- LIKE & NOT LIKE
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%MAR%');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%MAR%');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('MARK%');

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');

SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');
    
    
-- BETWEEN... AND... & NOT BETWEEN... AND...
SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';

SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';

SELECT 
    *
FROM
    salaries;

SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN '66000' AND '70000';


SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';

SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';


--  IS NULL & IS NOT NULL
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;

SELECT 
    *
FROM
    employees
WHERE
    first_name IS NOT NULL;

SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
    
-- equal to
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Mark';

-- not equal to != <>
SELECT 
    *
FROM
    employees
WHERE
    first_name != 'Mark';

SELECT 
    *
FROM
    employees
WHERE
    first_name <> 'Mark';
    

-- greater than >
SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';

-- greater than and equal to >=
SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';

-- less than <
SELECT 
    *
FROM
    employees
WHERE
    hire_date < '1985-02-01';

-- less than <=
SELECT 
    *
FROM
    employees
WHERE
    hire_date <= '1985-02-01';

SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01'
        AND gender = 'F';

SELECT 
    *
FROM
    salaries
WHERE
    salary > '150000';
    

-- DISTINCT
SELECT DISTINCT
    gender
FROM
    employees;

SELECT DISTINCT
    hire_date
FROM
    employees;

-- Aggregat Functions COUNT
SELECT 
    COUNT(emp_no)
FROM
    employees;

SELECT 
    COUNT(first_name)
FROM
    employees;

SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;

SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= '10000';

SELECT 
    COUNT(*)
FROM
    dept_manager;
    

-- Order By
SELECT 
    *
FROM
    employees
ORDER BY first_name;

SELECT 
    *
FROM
    employees
ORDER BY first_name ASC;

SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name ASC;

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

SELECT 
    first_name
FROM
    employees;
    

-- GROUP BY
SELECT 
    first_name
FROM
    employees
GROUP BY first_name;

SELECT DISTINCT
    first_name
FROM
    employees;

SELECT 
    COUNT(first_name)
FROM
    employees
GROUP BY first_name;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees AS names_count
GROUP BY first_name
ORDER BY first_name DESC;

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > '80000'
GROUP BY salary
ORDER BY salary;


-- HAVING
SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';

SELECT 
    *
FROM
    employees
HAVING hire_date >= '2000-01-01';

SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;

SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > '120000'
ORDER BY emp_no;


-- WHERE vs HAVING
SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;


-- LIMIT
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC
LIMIT 100;

SELECT 
    *
FROM
    dept_emp
LIMIT 100;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;


-- INSERT INTO
INSERT INTO employees
(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES (999901, '1986-04-21', 'John', 'Smith', 'M', '2011-01-01');

INSERT INTO employees
(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES (999902, '1973-03-26', 'Patricia', 'Lawrence', 'F', '2005-01-01');

INSERT INTO employees
(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES(999903, '1977-09-14', 'Johnathan', 'Creek', 'M', '1999-01-01');

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

SELECT 
    *
FROM
    titles
LIMIT 10;

INSERT INTO titles
(emp_no, title, from_date)
VALUES (999903, 'Senior Engineer', '1997-10-01');

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC;

SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO dept_emp
(
emp_no, dept_no, from_date, to_date
)
VALUES (
999903, 'd005', '1997-10-01', '9999-01-01'
);


-- INSERT data INTO new table
SELECT 
    *
FROM
    departments
LIMIT 10;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

INSERT INTO departments_dup
(
	dept_no,
    dept_name
)
SELECT * FROM departments;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

SELECT 
    *
FROM
    departments;

INSERT INTO departments
(
	dept_no, dept_name
)
VALUES 
(
	'd010',
    'Business Analysis'
);

SELECT 
    *
FROM
    departments;
    
    
-- UPDATES
SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;

UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = '999909';
    
SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;


-- COMMIT and ROLLBACK
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

COMMIT;

UPDATE departments_dup 
SET 
    dept_no = 'do11',
    dept_name = 'Quality Control';

ROLLBACK;

COMMIT;

SELECT 
    *
FROM
    departments
ORDER BY dept_no DESC;

COMMIT;

UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_name = 'Business Analysis';

SELECT 
    *
FROM
    departments
ORDER BY dept_no DESC;


-- DELETE statements
SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;

DELETE FROM employees 
WHERE
    emp_no = 999903;

ROLLBACK;

SELECT 
    *
FROM
    departments;

DELETE FROM departments 
WHERE
    dept_no = 'd010';
    
    
-- COUNT()
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC;

SELECT 
    COUNT(from_date)
FROM
    salaries;

SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries;

SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;

-- SUM()
SELECT 
    SUM(salary)
FROM
    salaries;

SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

-- MAX() MIN()
SELECT 
    MAX(salary)
FROM
    salaries;

SELECT 
    MIN(salary)
FROM
    salaries;

SELECT 
    MIN(emp_no)
FROM
    employees;

SELECT 
    MAX(emp_no)
FROM
    employees;

-- AVG()
SELECT 
    AVG(salary)
FROM
    salaries;

SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

-- ROUND()
SELECT 
    ROUND(AVG(salary))
FROM
    salaries;

SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries;

SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
    

-- IFNULL() and COALESCE()
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no; 

ALTER TABLE departments_dup
ADD COLUMN dept_manager VARCHAR(255);

DELETE FROM departments_dup 
WHERE
    dept_no = 'd010';

INSERT INTO departments_dup (dept_no)
VALUE('d010');

INSERT INTO departments_dup (dept_no)
VALUE('d011');


SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name
FROM
    departments_dup;
    
SELECT 
    dept_no,
    COALESCE(dept_name,
            'Department name not provided') AS dept_name
FROM
    departments_dup;
        
SELECT 
    *
FROM
    departments_dup;

SELECT 
    dept_no,
    dept_name,
    COALESCE('Department manager name') AS fake_col
FROM
    departments_dup;

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;


SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;

SELECT 
    emp_no,
    birth_date,
    COALESCE(first_name, 'Not provided') AS first_name,
    last_name
FROM
    employees;
