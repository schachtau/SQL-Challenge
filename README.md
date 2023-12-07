# SQL-Challenge

# sql-challenge

This repository contains SQL scripts to create and manage an employee database. The database schema includes tables for departments, titles, employees, department assignments, managers, and salaries.

## Table of Contents
- [Database Schema](#database-schema)
- [SQL Scripts](#sql-scripts)
- [Queries](#queries)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Database Schema

1. **departments Table:**
   - Columns:
     - `dept_no` (Primary Key): VARCHAR
     - `dept_name`: VARCHAR (Not Null)

2. **titles Table:**
   - Columns:
     - `title_id` (Primary Key): VARCHAR
     - `title`: VARCHAR (Not Null)

3. **employees Table:**
   - Columns:
     - `emp_no` (Primary Key): INTEGER
     - `emp_title_id` (Foreign Key): VARCHAR, references `titles(title_id)`
     - `birth_date`: DATE (Not Null)
     - `first_name`: VARCHAR (Not Null)
     - `last_name`: VARCHAR (Not Null)
     - `sex`: VARCHAR (Not Null)
     - `hire_date`: DATE (Not Null)

4. **dept_emp Table:**
   - Columns:
     - `emp_no` (Foreign Key): INTEGER, references `employees(emp_no)`
     - `dept_no` (Foreign Key): VARCHAR, references `departments(dept_no)`

5. **dept_manager Table:**
   - Columns:
     - `dept_no` (Foreign Key): VARCHAR, references `departments(dept_no)`
     - `emp_no` (Foreign Key): INTEGER, references `employees(emp_no)`

6. **salaries Table:**
   - Columns:
     - `emp_no` (Primary Key, Foreign Key): INTEGER, references `employees(emp_no)`
     - `salary`: INTEGER (Not Null)



Query 1: Retrieve Employee Information with Salaries:
This query retrieves information about employees along with their salaries. It uses the JOIN operation to combine rows from the employees table (aliased as e) with corresponding rows from the salaries table (aliased as s). The condition for joining is that the emp_no in the employees table should match the emp_no in the salaries table.

Query 2: Employees Hired in 1986:
This query selects employees who were hired in the year 1986. The EXTRACT(YEAR FROM hire_date) function is used to extract the year from the hire_date column, and the WHERE clause filters the results to include only those where the extracted year is equal to 1986.

Query 3: Managers and Their Departments:
This query retrieves information about department managers and their respective departments. It joins the employees table (aliased as e) with the dept_manager table (aliased as d_mgr) based on the emp_no column. Then, it further joins with the departments table (aliased as dep) based on the dept_no column.

Query 4: Employees and Their Departments:
This query shows a list of employees along with the departments they belong to. It uses JOIN operations to combine information from the employees, dept_emp, and departments tables based on matching emp_no and dept_no columns.

Query 5: Employees Named Hercules in 'B%' Last Names:
This query retrieves employees with the first name 'Hercules' and last names that start with the letter 'B'. The WHERE clause filters the results based on these conditions.

Query 6: Sales Department Employees:
This query lists employees who are currently part of the 'Sales' department. It joins the employees, dept_emp, and departments tables to get information about employees and their respective departments, and the WHERE clause filters the results to include only those in the 'Sales' department.

Query 7: Sales and Development Department Employees:
This query retrieves employees who are part of either the 'Sales' or 'Development' departments. It uses the WHERE clause with the condition d.dept_name = 'Sales' OR d.dept_name = 'Development' to filter the results accordingly.

Query 8: Employee Last Name Frequencies:
This query provides the frequency of each unique last name in the employees table. It uses the COUNT(*) function to count the occurrences of each last name, and GROUP BY last_name groups the results by last name. The ORDER BY frequency DESC sorts the results in descending order based on the frequency.
