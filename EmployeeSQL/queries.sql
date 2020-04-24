-- Assignment 1: "List the following details of each employee: employee number, last name, first name, gender, and salary."
SELECT 
	e.emp_no AS "Employee Number", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	e.gender AS "Gender", 
	s.salary AS "Salary"
FROM Employees AS e
	INNER JOIN salaries AS s ON e.emp_no = s.emp_no
GROUP BY e.emp_no, e.last_name, e.first_name, e.gender, s.salary, s.from_date
ORDER BY e.emp_no, s.from_date DESC
;

-- Assignment 2: "List employees who were hired in 1986."
SELECT
	e.emp_no AS "Employee Number",
	e.birth_date AS "Birth Date",
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	e.gender AS "Gender",
	e.hire_date AS "Hire Date"
FROM Employees AS e
WHERE DATE_PART('year',e.hire_date) = 1986
ORDER BY e.emp_no
;

-- Assignment 3: "List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates."
SELECT 
	dm.dept_no AS "Department Number", 
	d.dept_name AS "Department Name", 
	dm.emp_no AS "Employee Number", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	e.hire_date AS "Hire Date",
	dm.from_date AS "Department Start Date", 
	dm.to_date AS "Department End Date"
FROM dept_manager AS dm
	INNER JOIN employees AS e ON dm.emp_no = e.emp_no
	INNER JOIN departments d ON dm.dept_no = d.dept_no
ORDER BY dm.dept_no, dm.from_date
;

-- Assignment 4: "List the department of each employee with the following information: employee number, last name, first name, and department name."
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name", 
	e.first_name AS "First Name",
	d.dept_name AS "Department Name", 
	de.from_date AS "Department Start Date", 
	de.to_date AS "Department End Date"
FROM Employees AS e
	INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
	INNER JOIN departments AS d ON de.dept_no = d.dept_no
ORDER BY e.emp_no, de.from_date
;

--Assignment 5: "List all employees whose first name is "Hercules" and last names begin with 'B.'"
SELECT 
	e.emp_no AS "Employee Number",
	e.birth_date AS "Birth Date",
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	e.gender AS "Gender",
	e.hire_date AS "Hire Date"
FROM Employees AS e
WHERE e.first_name = 'Hercules'
	AND e.last_name LIKE 'B%'
ORDER BY e.last_name
;

--Assignment 6: "List all employees in the Sales department, including their employee number, last name, first name, and department name."
SELECT
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name", 
	e.first_name AS "First Name",
	d.dept_name AS "Department Name", 
	de.from_date AS "Department Start Date", 
	de.to_date AS "Department End Date"
FROM Employees AS e
	INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
	INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY de.from_date, e.emp_no
;

--Assignment 7: "List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name."
SELECT
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name", 
	e.first_name AS "First Name",
	d.dept_name AS "Department Name", 
	de.from_date AS "Department Start Date", 
	de.to_date AS "Department End Date"
FROM Employees AS e
	INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
	INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY d.dept_name, de.from_date, e.emp_no
;

--Assignment 8: "In descending order, list the frequency count of employee last names, i.e., how many employees share each last name."
SELECT 
	e.last_name AS "Employee Last Name", 
	COUNT(DISTINCT e.emp_no) AS "Number of Employees With Last Name"
FROM employees AS e
GROUP BY e.last_name
ORDER BY 2 DESC
;

