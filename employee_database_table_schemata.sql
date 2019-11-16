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
