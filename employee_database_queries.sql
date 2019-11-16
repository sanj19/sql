
--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no as "Employee Number", 
		employees.last_name as "Last Name", 
		employees.first_name as "First Name", 
		employees.gender as "Gender", 
		salaries.salary as "Salary"
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no;

--List employees who were hired in 1986.
SELECT last_name AS "Last Name",
		first_name AS "First Name",
		hire_date AS "Hire Date"
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

--List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dept_no as "Department Number",
		dept_name as "Department Name",
		employees.emp_no as "Employee Number", 
		last_name as "Last Name",
		first_name as "First Name",
		from_date as "Start Date",
		to_date as "End Date"
FROM departments
JOIN dept_manager ON (departments.dept_no = dept_manager.dept_no)
JOIN employees ON (employees.emp_no = dept_manager.emp_no);

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no as "Employee Number",
		last_name as "Last Name",
		first_name as "First Name",
		dept_name as "Department"
FROM employees
JOIN dept_emp ON (dept_emp.emp_no = employees.emp_no)
JOIN departments ON (departments.dept_no = dept_emp.dept_no)
ORDER BY employees.emp_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name as "First Name", last_name as "Last Name"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no as "Employee Number",
		last_name as "Last Name",
		first_name as "First Name",
		dept_name as "Department"
FROM employees
JOIN dept_emp ON (dept_emp.emp_no = employees.emp_no)
JOIN departments ON (departments.dept_no = dept_emp.dept_no)
WHERE dept_name = 'Sales'
ORDER BY employees.emp_no;


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no as "Employee Number",
		last_name as "Last Name",
		first_name as "First Name",
		dept_name as "Department"
FROM employees
JOIN dept_emp ON (dept_emp.emp_no = employees.emp_no)
JOIN departments ON (departments.dept_no = dept_emp.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development'
ORDER BY employees.emp_no;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name as "Last Name", count(last_name) as "Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;
