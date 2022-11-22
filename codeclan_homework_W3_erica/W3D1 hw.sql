SELECT *
FROM employees 
WHERE country NOT IN( 'Spain', 'South Africa', 'Ireland', 'Germany');

select*
from employees where country = 'Greece' and last_name like'Mc%';

--% is a wildcard, the other one is _ which will match a single character only

select*from employees where department='Legal' and last_name like'_a%';

--or you can make it insensitive to case

select*from employees where last_name ilike'_A%';


SELECT 
  id, 
  first_name, 
  last_name 
FROM employees 
WHERE department = 'Accounting';

SELECT
    id, 
    first_name, 
    last_name,
    CONCAT(first_name,' ',last_name) AS full_name
FROM employees   
WHERE first_name NOTNULL AND last_name NOTNULL;

SELECT
 DISTINCT(department)
 FROM employees;

SELECT 
  COUNT(*) 
FROM employees 
WHERE start_date BETWEEN '2001-01-01' AND '2001-12-31';
 WHERE start_date BETWEEN '2001-01-01' AND '2001-12-31';
 
SELECT 
  MAX(salary) AS max_salary
FROM employees;

SELECT 
  MIN(salary) AS min_salary
FROM employees
WHERE department = 'Human Resources';


SELECT 
  SUM(salary) AS total_sals_2018
FROM employees 
WHERE start_date BETWEEN '2018-01-01' AND '2018-12-31';

--First, the minimum salaried employee. 
--Order employees by salary in *ascending* order, return the first, 
--We need to be careful with NULLs here, let's filter out employees with NULL salary
SELECT * 
FROM employees 
WHERE salary IS NOT NULL 
ORDER BY salary ASC 
LIMIT 1;

--Next, the maximum salaried employee. 
--Order employees by salary in *descending* order, return the first 
SELECT * 
FROM employees 
WHERE salary IS NOT NULL 
ORDER BY salary DESC 
LIMIT 1;
--or can be written as 
SELECT * 
FROM employees 
ORDER BY salary ASC NULLS LAST 
LIMIT 1;

SELECT * 
FROM employees 
ORDER BY salary DESC NULLS LAST 
LIMIT 1;

--order employees by full time equivalen hours, highest first, and then alphabetically by the last name.

SELECT * 
FROM employees 
ORDER BY 
  fte_hours DESC NULLS LAST, 
  last_name ASC NULLS LAST;
  
 -- get the details fo the longest serving employee of the corporation
 --get the details of the hhighest paid emp[loyee of the corporation in Libya
 
 SELECT * 
FROM employees 
ORDER BY start_date ASC NULLS LAST 
LIMIT 1;

SELECT * 
FROM employees 
WHERE country = 'Libya' 
ORDER BY salary DESC NULLS LAST 
LIMIT 1;

--be careful of the Limit 1, as when youre trying to find rows that have a min or max value but there are multiples of them, limit 1 will on return one of them.

--HOMEWORK

--Q1 find all the employees who work in the 'Human Resources' 'department'.

SELECT 
  id,  
  first_name,  
  last_name
  FROM employees
WHERE department = 'Human Resources';

--Q2

SELECT 
  first_name, 
  last_name,
  country
  FROM employees 
WHERE department = 'Legal';

--Q3
SELECT 
  COUNT(*) 
FROM employees 
WHERE  country= 'Portugal';

--Q4
SELECT 
  COUNT(*) 
FROM employees 
WHERE country= 'Portugal'OR country = 'Spain';

--Q5
SELECT 
  COUNT(*) 
FROM pay_details pd
WHERE local_account_no IS NULL;

--Q6
SELECT 
  COUNT(*) 
FROM pay_details pd
WHERE local_account_no IS NULL OR iban IS NULL;

--Q7
SELECT 
first_name,
  last_name,
  CONCAT(first_name, ' ', last_name) AS full_name 
FROM employees 
WHERE first_name IS NOT NULL AND last_name IS NOT NULL;
 last_name ASC NULLS LAST;

--Q8
select
first_name,
  last_name,
  country
 FROM employees 
WHERE first_name IS NOT NULL AND last_name IS NOT NULL
ORDER BY country , last_name ASC;

--Q9
SELECT * 
FROM employees 
ORDER BY salary DESC NULLS LAST 
LIMIT 10;

--Q10
SELECT * 
FROM employees 
WHERE country = 'Hungary'
ORDER BY salary ASC NULLS LAST LIMIT 10;

--Q11
SELECT *
FROM employees e
WHERE first_name ilike'F%';

--Q12
SELECT *
FROM employees e
WHERE email ILIKE '%@yah__%';

--Q13
SELECT 
  COUNT(id) AS num_pension_not_France_Germany
FROM employees
WHERE pension_enrol IS TRUE AND country NOT IN ('France', 'Germany')
```

--Q14
SELECT 
  MAX(salary) AS max_salary_engineering_ft
FROM employees
WHERE department = 'Engineering' AND fte_hours = 1
	
--Q15
SELECT first_name, last_name, fte_hours, salary, fte_hours * salary AS effective_yearly_salary
FROM employees;

--Q16
SELECT
  first_name,
  last_name,
  department,
  CONCAT(first_name, ' ', last_name, ' - ', department) AS badge_label
FROM employees
WHERE 
  first_name IS NOT NULL AND 
  last_name IS NOT NULL AND 
  department IS NOT NULL;
 
 --Q17
 SELECT
  (first_name),
  (last_name),
  (department),
  (start_date),
  CONCAT(first_name, ' ', last_name, ' - ', department, 
    ' (joined ', EXTRACT(YEAR FROM start_date),')') AS badge_label
FROM employees
WHERE 
  (first_name) IS NOT NULL AND 
  (last_name) IS NOT NULL AND 
  (department) IS NOT NULL AND
  (start_date) IS NOT NULL
 
 --Q18
  SELECT 
  (first_name), 
  (last_name), 
  CASE 
    WHEN (salary < 40000) THEN ('low')
    WHEN (salary IS NULL) THEN NULL
    ELSE ('high') 
  END AS salary_class
FROM employees;

 
 