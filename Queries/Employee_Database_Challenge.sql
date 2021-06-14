-- Creating Retirement Table with titles of current employees with YOB: 1952 to 1955 
SELECT emp.emp_no, emp.first_name, emp.last_name, ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as emp
	INNER JOIN titles as ti
	ON (emp.emp_no = ti.emp_no)
	WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	ORDER BY emp.emp_no
	
	-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles

SELECT COUNT (emp_no), title
-- INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT (title) DESC;

--Creating Mentorship Eligibility table 

SELECT DISTINCT ON (emp_no) emp.emp_no, emp.first_name, emp.last_name,emp.birth_date,
				   dep.from_date, dep.to_date, ti.title
	
INTO mentorship_eligibility
FROM employees as emp
	INNER JOIN dept_emp as dep
	ON (emp.emp_no = dep.emp_no)
	INNER JOIN titles as ti
	ON (emp.emp_no = ti.emp_no)
	WHERE dep.to_date = ('9999-01-01') 
	AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	ORDER BY emp.emp_no
