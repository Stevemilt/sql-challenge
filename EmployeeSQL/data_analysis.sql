--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, 
employees.sex, salaries.salary 
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE DATE_PART('year',hire_date) = 1986

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no,
employees.last_name, employees.first_name
FROM departments
LEFT JOIN dept_manager
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees
ON employees.emp_no = dept_manager.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT emp_department.emp_no, 
employees.last_name, employees.first_name,departments.dept_name
FROM emp_department
LEFT JOIN employees
ON emp_department.emp_no = employees.emp_no
LEFT JOIN departments
ON departments.dept_no = emp_department.dept_no;

--List first name, last name, and sex for employees whose first name is 
--"Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number,
--last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, departments.dept_name
FROM employees e
LEFT JOIN emp_department
ON e.emp_no = emp_department.emp_no
LEFT JOIN departments
ON emp_department.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, departments.dept_name
FROM employees e
LEFT JOIN emp_department
ON e.emp_no = emp_department.emp_no
LEFT JOIN departments
ON emp_department.dept_no = departments.dept_no
WHERE departments.dept_name = 'Development' OR departments.dept_name = 'Sales';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, COUNT(employees.last_name) AS Frequency
FROM employees
GROUP BY last_name
ORDER BY
COUNT (last_name) DESC