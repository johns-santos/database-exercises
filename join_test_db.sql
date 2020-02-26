CREATE TABLE roles
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name    VARCHAR(100) NOT NULL,
    email   VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name)
VALUES ('admin');
INSERT INTO roles (name)
VALUES ('author');
INSERT INTO roles (name)
VALUES ('reviewer');
INSERT INTO roles (name)
VALUES ('commenter');

INSERT INTO users (name, email, role_id)
VALUES ('bob', 'bob@example.com', 1),
       ('joe', 'joe@example.com', 2),
       ('sally', 'sally@example.com', 3),
       ('adam', 'adam@example.com', 3),
       ('jane', 'jane@example.com', null),
       ('mike', 'mike@example.com', null);



use employees;

# Using the example in the Associative Table Joins section as a
# guide, write a query that shows each department along with the
# name of the current manager for that department.
SELECT dept_name as 'Department Name', concat(e.first_name, ' ', e.last_name) as 'Department Manager'
FROM employees as e
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no # keys that have relation
         JOIN departments as d
              ON d.dept_no = dm.dept_no # keys that have relation
WHERE dm.to_date = '9999-01-01'
order by dept_name asc;


#Find the name of all departments currently managed by women.
SELECT dept_name as 'department name', concat(e.first_name, ' ', e.last_name) as 'department manager'
FROM employees as e
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no # keys that have relation
         JOIN departments as d
              ON d.dept_no = dm.dept_no # keys that have relation
WHERE dm.to_date = '9999-01-01'
  and gender = 'F' # adding gender to where
order by dept_name asc;

## Find the current titles of employees currently working in the Customer Service department
SELECT t.title as title, count(t.title) as count
                 FROM employees as e
                          JOIN dept_emp as de
                               ON de.emp_no = e.emp_no
                          JOIN departments as d
                               ON d.dept_no = de.dept_no
                          JOIN titles as t
                               on t.emp_no = e.emp_no
                 WHERE de.to_date = '9999-01-01'
                   and t.to_date = '9999-01-01'
                   and d.dept_name = 'Customer Service'
                 group by t.title;

#Find the current salary of all current managers.
SELECT dept_name                              as 'Department Name',
       concat(e.first_name, ' ', e.last_name) as 'Department Manager',
       salary                                 as 'Salary'
FROM employees as e
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no # keys that have relation
         JOIN departments as d
              ON d.dept_no = dm.dept_no # keys that have relation
         JOIN salaries as s
              ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
  and dm.to_date = '9999-01-01'
ORDER BY d.dept_name ASC;
# ORDER BY dept_name desc.
# group by s.salary;


#Find the names of all current employees, their department name, and their current manager's name.

SELECT concat(employees.first_name, ' ', employees.last_name) AS 'Employee Name',
       d.dept_name                                            AS 'Department Name',
       concat(managers.first_name, ' ', managers.last_name)   AS 'Manager Name'
FROM employees
         JOIN dept_emp AS de
              on de.emp_no = employees.emp_no
         JOIN departments AS d
              on de.dept_no = d.dept_no
         JOIN dept_manager AS m
              on m.dept_no = d.dept_no
         JOIN employees AS managers
              ON m.emp_no = managers.emp_no
WHERE de.to_date = '9999-01-01'
  AND m.to_date = '9999-01-01'
order by dept_name ASC ;