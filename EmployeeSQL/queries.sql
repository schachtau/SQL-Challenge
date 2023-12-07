
SELECT e.emp_no, last_name, first_name, sex
FROM employees AS e
JOIN salaries AS s 
ON e.emp_no = s.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

SELECT dep.dept_no, dep.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_manager AS d_mgr 
ON e.emp_no = d_mgr.emp_no
JOIN departments AS dep 
ON d_mgr.dept_no = dep.dept_no;

SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
FROM employees AS e
JOIN dept_emp AS de 
ON e.emp_no = de.emp_no
JOIN departments AS d 
ON de.dept_no = d.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_emp AS de 
ON e.emp_no = de.emp_no
JOIN departments AS d 
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de 
ON e.emp_no = de.emp_no
JOIN departments AS d 
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;






