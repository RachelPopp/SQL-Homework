DROP TABLE salaries;
DROP TABLE dept_emp;
DROP TABLE employees;
DROP TABLE titles;
DROP TABLE dept_manager;
DROP TABLE departments;

CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR NOT NULL
 );

DROP TABLE employees;
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR,
	hire_date DATE
);


DROP TABLE dept_manager;
CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT,
	from_date DATE,
	to_date DATE
--    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
--    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

DROP TABLE dept_emp;
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR,
	from_date DATE,
	to_date DATE
--   FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
--	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


DROP TABLE salaries;
CREATE TABLE salaries (
	emp_no INT,
	salary VARCHAR NOT NULL,
	from_date DATE,
	to_date DATE
--    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

DROP TABLE titles;
CREATE TABLE titles (
	emp_no INT,
	title VARCHAR NOT NULL,
	from_date DATE,
	to_date DATE
--    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries
SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM employees
SELECT * FROM dept_emp
SELECT * FROM dept_manager

--QUESTION 1
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
e.emp_no = s.emp_no;
 
 
-- Q2
SELECT * FROM employees
WHERE hire_date LIKE '1986%';

--Q3
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM departments AS d
INNER JOIN dept_manager AS m ON
m.dept_no = d.dept_no
JOIN employees AS e ON
e.emp_no = m.emp_no;

--Q4
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dp ON
dp.dept_no = d.dept_no;

--Q5
SELECT * FROM employees
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%';

--Q6
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dp ON
dp.dept_no = d.dept_no
WHERE dp.dept_name LIKE 'Sales';

--Q7
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dp ON
dp.dept_no = d.dept_no
WHERE dp.dept_name LIKE 'Development'
OR dp.dept_name LIKE 'Sales';

--Q8
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

