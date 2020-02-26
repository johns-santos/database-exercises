
use employees;

# EXAMPLE
#======================================
SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
)
LIMIT 10;
#======================================


# Find all the employees with the same hire date as employee 101010 using a subquery.
# 69 Rows
SELECT first_name, last_name, hire_date
         FROM employees
         WHERE hire_date  IN (
             SELECT hire_date
             FROM employees
             WHERE emp_no  = '101010'
         )
         LIMIT 10;


#Find all the titles held by all employees with the first name Aamod.
# 314 total titles, 6 unique titles - remove emp_no for DISTINCT
SELECT DISTINCT title, emp_no
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
);



#Find all the current department managers that are female.
SELECT first_name, last_name FROM employees WHERE gender = 'F' AND emp_no IN
(SELECT emp_no FROM dept_manager WHERE to_date = '9999-01-01');




