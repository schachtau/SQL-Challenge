This repository allows efficient managment of employees, of all levels, through a SQL driven database.  The database schema includes tables for departments, titles, employees, departments assignments, managers, and salaries.

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
     - `dept_no` VARCHAR (Primary Key)
     - `dept_name`: VARCHAR (Not Null)

2. **titles Table:**
   - Columns:
     - `title_id` VARCHAR (Primary Key)
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



Query 1: Retrieve Employee Information with Salaries:t
This query retrieves information about employees along with their salaries. The JOIN operation combines rows from the employees table (aliased as e) with corresponding rows from the salaries table (aliased as s). emp_no is the conditional for joining and the employees table should match the emp_no in the salaries table.

Query 2: Employees Hired in 1986:
This query only selects employees who were hired in the year 1986. The EXTRACT(YEAR FROM hire_date) function is used to extract the year from the hire_date column, and the WHERE clause filters the results to include only those in 1986.

Query 3: Managers and Their Departments:
This query retrieves information about department managers and their specific departments. It joins the employees table (aliased as e) with the dept_manager table (aliased as d_mgr) based on the emp_no column. It also joins with the departments table (aliased as dep) correllated to the dept_no column.

Query 4: Employees and Departments:
This query shows a list of employees along with the departments in which they work. It uses JOIN operations to combine information from the employees, dept_emp, and departments tables based on matching emp_no and dept_no columns.

Query 5: Employees Named Hercules in 'B%' Last Names:
This query retrieves employees with the first name 'Hercules' and last names that start with the letter 'B'. The WHERE clause filters the results based on these conditions as instructed.

Query 6: Sales Department Employees:
This query lists employees who are currently part of the "Sales" department. It joins the employees, dept_emp, and departments tables to get information about employees and their respective departments, and the WHERE clause filters the results to include only those in the "Sales" department.

Query 7: Sales and Development Department Employees:
This query retrieves employees who are part of either the 'Sales' or "Development" departments. It uses the WHERE clause with the condition d.dept_name = "Sales" OR d.dept_name = "Development" to filter the results appropriately.

Query 8: Employee Last Name Frequencies:
This query provides the frequency of each unique last name in the employees table. It uses the COUNT(*) function to count the instances of each last name, and GROUP BY last_name groups the results by last name. The ORDER BY frequency DESC sorts the results in descending order based on the frequency.
