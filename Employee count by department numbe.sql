-- -- Employee count by department number
-- SELECT COUNT(ce.emp_no), de.dept_no
-- FROM current_emp as ce
-- LEFT JOIN dep_emp as de
-- ON ce.emp_no = de.emp_no
-- GROUP BY de.dept_no
-- -- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO employee_count_by_department
FROM current_emp as ce
LEFT JOIN dep_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;