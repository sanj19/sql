-- CREATE TABLES --
CREATE TABLE departments (
	dept_no VARCHAR(4),
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(4),
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
CREATE TABLE dept_manager (
	dept_no VARCHAR(4),
	emp_no INT,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
CREATE TABLE employees (
	emp_no INT,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	gender CHAR(1),
	hire_date DATE,
	PRIMARY KEY (emp_no)
);
CREATE TABLE salaries (
	emp_no INT,
	salary MONEY,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
CREATE TABLE titles (
	emp_no INT,
	title VARCHAR,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
--==========================================================================================
--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List employees who were hired in 1986.
SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

--List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dept_no, dept_name, employees.emp_no, 
	last_name, first_name, from_date, to_date
FROM departments
JOIN dept_manager ON (departments.dept_no = dept_manager.dept_no)
JOIN employees ON (employees.emp_no = dept_manager.emp_no);

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp ON (dept_emp.emp_no = employees.emp_no)
JOIN departments ON (departments.dept_no = dept_emp.dept_no)
ORDER BY employees.emp_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp ON (dept_emp.emp_no = employees.emp_no)
JOIN departments ON (departments.dept_no = dept_emp.dept_no)
WHERE dept_name = 'Sales'
ORDER BY employees.emp_no;


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp ON (dept_emp.emp_no = employees.emp_no)
JOIN departments ON (departments.dept_no = dept_emp.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development'
ORDER BY employees.emp_no;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;