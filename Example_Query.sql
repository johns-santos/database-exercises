SHOW databases;
USE employees;
SHOW tables;
SELECT *
FROM salaries;

SHOW tables;

DESCRIBE departments;

# In the query window, craft a query that will show all
# the records in the departments table. You should see 9 rows returned
# in the view below.
SELECT *
FROM departments;

SELECT DISTINCT first_name
FROM employees
WHERE first_name LIKE '%nne%';

#use WHERE with BETWEEN to find specific ranges of values.
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no BETWEEN 10026 AND 10082;


####################       IN = INCLUDES  #################
#use WHERE with IN to query only very specific sets of values.
# The () are required when you use IN.
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name IN ('Herber', 'Dredge', 'Lipner', 'Baek');

#how use comparison operators.
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name = 'Baek';

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 10026;

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no <= 10026;

#use IS NULL and IS NOT NULL to see if a value is NULL or not.
SELECT emp_no, title
FROM titles
WHERE to_date IS NOT NULL;


# chain together an IN clause with a LIKE clause, or any of the clauses,
# using AND and OR.
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name IN ('Herber', 'Baek')
  AND emp_no < 20000;



#can chain as many of these as we please together, but it can get
# messy very quickly.
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 20000
    AND last_name IN ('Herber', 'Baek')
   OR first_name = 'Shridhar';



# Forced GROUPING - search for match in two columns
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 20000
  AND (
            last_name IN ('Herber', 'Baek')
        OR first_name = 'Shridhar'
    );