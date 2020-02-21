
#Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who
# was hired last. It should be Khun Bernini.
SELECT * FROM employees WHERE birth_date LIKE '%-12-25'
                          AND  (hire_date BETWEEN '1990-01-01' AND '1999-12-31') ORDER BY birth_date, hire_date DESC LIMIT 5;



# Find your query for employees born on Christmas and hired in
# the 90s from order_by_exercises.sql. Update it to find just
# the first 5 employees. Their names should be:

SELECT * FROM employees WHERE birth_date LIKE '%-12-25'
                          AND  (hire_date BETWEEN '1990-01-01' AND '1999-12-31') ORDER BY hire_date DESC LIMIT 5;



# Try to think of your results as batches, sets, or pages.
# The first five results are your first page. The five after that
# would be your second page, etc. Update the query to find the
# tenth page of results. The employee names should be:
SELECT * FROM employees WHERE birth_date LIKE '%-12-25'
                          AND  (hire_date BETWEEN '1990-01-01' AND '1999-12-31') ORDER BY birth_date, hire_date DESC LIMIT 5 OFFSET 45;

