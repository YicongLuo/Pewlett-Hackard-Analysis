-- Use Dictinct with Orderby to remove duplicate rows
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e   
INNER JOIN titles as ti
ON(e.emp_no =ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC, to_date DESC;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
    emp_no,
    first_name,
    last_name,
    title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01';


-- To get retire_title
SELECT COUNT (emp_no),title
INTO retiring_titles
FROM unique_titles
Group BY title
ORDER BY COUNT(emp_no) DESC;


-- create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
SELECT DISTINCT ON (emp_no)
    e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
	de.from_date,
    de.to_date,
    ti.title
INTO mentorship_eligibilty
FROM employees AS e
    INNER JOIN dep_emp AS de 
        ON de.emp_no = e.emp_no
    INNER JOIN titles AS ti
        ON e.emp_no = ti.emp_no
WHERE (de.to_date ='9999-01-01')
	AND (birth_date BETWEEN '1965-01-01'AND '1965-12-31')
ORDER BY emp_no ASC;